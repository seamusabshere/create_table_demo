class Statement < ActiveRecord::Base
  attr_accessible :original

  def create_table
    @create_table ||= CreateTable.new original
  end

  def mysql
    create_table.to_mysql.join(";\n")
  end

  def postgresql
    create_table.to_postgresql.join(";\n")
  end

  def sqlite3
    create_table.to_sqlite3.join(";\n")
  end

  delegate :columns, :to => :create_table
end
