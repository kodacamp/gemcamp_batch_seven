class ProvinceSerializer < ActiveModel::Serializer
  attributes :id, :name

  # def name
  #   object.name.upcase
  # end

  # def created_at
  #   object.created_at.strftime("%m/%d/%Y %H:%M")
  # end
end
