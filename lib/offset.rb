class Offset
  def date_number
  date = Time.now.strftime("%d%m%y").to_i
  date = date ** 2
  date.to_s[-4..-1]
  end
end
