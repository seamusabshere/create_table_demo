class StatementSerializer < ActiveModel::Serializer
  attributes(
    :original,
    :to_mysql,
    :to_postgresql,
    :to_sqlite3
  )
end
