def basket_count(items)
  count = 0
  price = 8

  total = Array.new
  while count < items.length do
    calc = items[count] * 8

    if items.length == 5
      total << calc * 0.75
    elsif items.length == 4
      total << calc * 0.8
    elsif items.length == 3
      total << calc * 0.9
    elsif items.length == 2
      total << calc * 0.95
    else
      total << calc
    end
    count += 1
  end

  total.reduce(:+)

end
