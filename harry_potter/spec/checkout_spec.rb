def basket_count(items)
  count = 0
  price = 8
  total = Array.new
  while count < items.length do
    total <<  items[count] * 8
    count += 1
  end
  total.reduce(:+)
end

RSpec.describe "This checkout has" do

  it "one book without discount" do
    items = [1]
    expect(basket_count(items)).to eq(8)
    # 1*8
  end

  it "two different books with a 5% discount" do
    items = [1, 1]
    expect(basket_count(items)).to eq(15.20)
    # 2*8*.95
  end

  it "three different books with a 10% discount" do
    items = [1, 1, 1]
    expect(basket_count(items)).to eq(21.6)
    # 3*8*.9
  end

  it "four different books with a 20% discount" do
    items = [1, 1, 1, 1]
    expect(basket_count(items)).to eq(25.6)
    # 4*8*.8
  end

  it "five different books with a 25% discount" do
    items = [1, 1, 1, 1, 1]
    expect(basket_count(items)).to eq(30)
    # 5*8*.75
  end

  it "two of the same book without discount" do
    items = [2]
    expect(basket_count(items)).to eq(16)
    # 2*8
  end

  it "three books with a 5% discount" do
    items = [2, 1]
    expect(basket_count(items)).to eq(23.2)
    # 2*8*.95+1*8
  end

  it "two of the same book without discount" do
    items = [2]
    expect(basket_count(items)).to eq(51.2)
    # 4*8*.8+4*8*.8
  end
end
