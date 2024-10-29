class Order < ApplicationRecord
  include AASM

  after_create :assign_serial_number
  belongs_to :user

  aasm column: :state do
    state :pending, initial: true
    state :submitted, :paid, :failed, :revoked

    event :submit do
      transitions from: :pending, to: :submitted
    end

    event :pay do
      # transitions from: :submitted, to: :paid
      transitions from: :submitted, to: :paid, success: :add_balance
    end

    event :fail do
      transitions from: [:pending, :submitted], to: :failed

      # transitions from: :pending, to: :failed
      # transitions from: :submitted, to: :failed
    end

    event :revoke do
      # transitions from: [:pending, :submitted], to: :revoked
      transitions from: :paid, to: :revoked,
                  if: :balance_enough?,
                  success: :deduct_balance
    end
  end

  private

  def balance_enough?
    user.balance >= amount
  end

  def add_balance
    user.update(balance: user.balance + amount)
  end

  def deduct_balance
    user.update(balance: user.balance - amount)
  end

  def assign_serial_number
    self.update(serial_number: "gem-#{id.to_s.rjust(9, '0')}")
  end
end
