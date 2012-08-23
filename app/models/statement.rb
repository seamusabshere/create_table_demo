class Statement < ActiveRecord::Base
  attr_accessible :original

  def create_table
    @create_table ||= CreateTable.new original
  end

  delegate :to_mysql, :to_postgresql, :to_sqlite3, :to => :create_table
end
