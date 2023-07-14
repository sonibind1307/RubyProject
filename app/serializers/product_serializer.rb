class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :img
  has_one :category
  has_one :campany
end
