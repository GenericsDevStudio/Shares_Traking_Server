class ShareSerializer < ActiveModel::Serializer
  attributes :id,:symbol, :name, :price, :change, :persentChange, :volume,
    :marketCap, :ratio
end
