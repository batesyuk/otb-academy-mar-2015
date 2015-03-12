class Checkout

  attr_reader :items, :total
  RRP = 8

  def initialize(items)
    @items = items
  end

  def handle_total
    calculate_basket
  end

  def calculate_basket
      create_sets
      basket_count
  end

  def create_sets
    @sets = Array.new

    while @items.length > 0
      parts = @items.uniq
      @sets << parts
      parts.each { |x| @items.delete_at(@items.index(x)) }
    end

    @sets
    p @sets
  end

  def basket_count

    @total = Array.new

    if @sets.length == 2

      @first = Array.new
      @last = Array.new

      if @sets.first.length == 5
        @first << @sets.first.length * RRP * 0.75
      elsif @sets.first.length == 4
        @first << @sets.first.length * RRP * 0.8
      elsif @sets.first.length == 3
        @first << @sets.first.length * RRP * 0.9
      elsif @sets.first.length == 2
        @first << @sets.first.length * RRP * 0.95
      else
        @first << @sets.first.length * RRP
      end

      if @sets.last.length == 5
        @last << @sets.last.length * RRP * 0.75
      elsif @sets.last.length == 4
        @last << @sets.last.length * RRP * 0.8
      elsif @sets.last.length == 3
        @last << @sets.last.length * RRP * 0.9
      elsif @sets.last.length == 2
        @last << @sets.last.length * RRP * 0.95
      else
        @last << @sets.last.length * RRP
      end

      @first = @first.reduce(:+)
      @last = @last.reduce(:+)

      @total << @first + @last

    elsif @sets.first.length == 5
      @total << @sets.first.length * RRP * 0.75
    elsif @sets.first.length == 4
      @total << @sets.first.length * RRP * 0.8
    elsif @sets.first.length == 3
      @total << @sets.first.length * RRP * 0.9
    elsif @sets.first.length == 2
      @total << @sets.first.length * RRP * 0.95
    else
      @total << @sets.first.length * RRP
    end

    @total = @total.reduce(:+)
  end

end
