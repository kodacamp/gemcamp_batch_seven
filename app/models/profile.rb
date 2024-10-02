class Profile < ApplicationRecord
  belongs_to :customer
end
# Profile.create(image: '/test.png', customer: Customer.first)
# Profile.create(image: '/test.png', customer_id: Customer.find(1))
# Profile.create(image: '/test.png', customer_id: Customer.first.id)
# Profile.create(image: '/test.png', customer_id: 1)

# customer = Customer.create(name: 'mark', email: 'mark@firndly.com')
# customer.profile = Profile.new(image: 'test2.png')
# Profile.create(image: 'asdf.png', customer: Customer.create(name: 'test',email: 'mark@firndly.com'))

# Profile.first.customer
# Customer.last.profile

# Profile.all.each do |profile|
#   p profile.customer.name
# end
#
# Customer.all.each do |customer|
#   p customer.profile
# end