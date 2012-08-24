require 'create_table'

class CreateTable::Column
  def serializable_hash
    {
      :name => name,
      :data_type => data_type,
      :allow_null => allow_null,
      :default => default,
      :primary_key => primary_key,
      :unique => unique,
      :autoincrement => autoincrement,
      :charset => charset,
      :collate => collate,
    }
  end
end

class StatementSerializer < ActiveModel::Serializer
  attributes(
    :original,
    :mysql,
    :postgresql,
    :sqlite3,
  )
  has_many :columns
end
