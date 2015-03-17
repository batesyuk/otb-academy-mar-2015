class Checkout

  attr_reader :items, :total
  RRP = 8

  def initialize(items)
    @items = items
  end

  def handle_total
    calculate_basket
  end

  def handle_discount
    {
      1 => 1,
      2 => 0.95,
      3 => 0.9,
      4 => 0.8,
      5 => 0.75
    }
  end

  def calculate_basket
      find_best_deal
      basket_count
  end

  def create_sets
    @sets = Array.new

    while @items.length > 0
      @parts = @items.uniq
      @sets << @parts
      @parts.each { |x| @items.delete_at(@items.index(x)) }
    end
  end

  def find_best_deal
    create_sets

    if @sets.first.length == 5 && @sets.last.length == 3
      pop = @sets[0].pop
      @sets[1] << pop
    end
  end

  def basket_count

    @total = Array.new

    if @sets.length == 2

      @first = Array.new
      @last = Array.new

      @first << @sets.first.length * RRP * handle_discount[@sets.first.length]
      @last << @sets.last.length * RRP * handle_discount[@sets.last.length]

      @first = @first.reduce(:+)
      @last = @last.reduce(:+)

      @total << @first + @last

    else
      @total << @parts.length * RRP * handle_discount[@parts.length]
    end

    @total = @total.reduce(:+)
  end

end
