class Project < ApplicationRecord
  has_many :developer_projects
  has_many :developers, through: :developer_projects
end
