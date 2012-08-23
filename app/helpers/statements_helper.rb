module StatementsHelper
  def show_sql(sql)
    [sql].flatten.map do |part|
      Uv.parse(part, 'xhtml', 'sql', false, :idle)
    end.join("\n<br/>\n").html_safe
  end
end
