module StatementsHelper
  def show_sql(sql)
    Uv.parse(sql, 'xhtml', 'sql', false, :idle).html_safe
  end
end
