class StatementSerializer < ActiveModel::Serializer
  attributes(
    :original,
    :mysql,
    :postgresql,
    :sqlite3
  )
end
