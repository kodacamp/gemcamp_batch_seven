class Project < ApplicationRecord
  has_many :developer_projects
  has_many :developers, through: :developer_projects

  # has_and_belongs_to_many :developers, join_table: :developer_projects
end
