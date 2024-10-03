class Developer < ApplicationRecord
  has_many :developer_projects
  has_many :projects, through: :developer_projects

  # developers_projects
  # has_and_belongs_to_many :projects, join_table: :developer_projects
end
# Developer.create(name: 'ced')
# Developer.create(name: 'mark')
# Developer.create(name: 'jerome')
# Developer.create(name: 'bernard')

# Project.create(title: 'Project One')
# Project.create(title: 'Project two')
# Project.create(title: 'Project Three')
# Project.create(title: 'Project Four')

# Project.first.developers << Developer.where(name: ['mark', 'ced'])
# Project.first.developers << Developer.create(name: 'mathew')
# Project.first.developer_projects.create(developer: Developer.find(4))