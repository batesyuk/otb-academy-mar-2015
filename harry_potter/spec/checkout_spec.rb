require 'checkout'

RSpec.describe "This checkout has" do

  it "one book without discount" do
    items = [1]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(8)
    # 1*8
  end

  it "two different books with a 5% discount" do
    items = [1, 2]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(15.20)
    # 2*8*.95
  end

  it "three different books with a 10% discount" do
    items = [1, 2, 3]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(21.6)
    # 3*8*.9
  end

  it "four different books with a 20% discount" do
    items = [1, 2, 3, 4]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(25.6)
    # 4*8*.8
  end

  it "five different books with a 25% discount" do
    items = [1, 2, 3, 4, 5]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(30)
    # 5*8*.75
  end

  it "two of the same book without discount" do
    items = [1, 1]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(16)
    # 2*8
  end

  it "three books with a 5% discount" do
    items = [1, 2, 1]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(23.2)
    # 2*8*.95+1*8
  end

  it "Max discount and multiple trilogy" do
    items = [1, 2, 3, 4, 5, 1, 2, 3]
    checkout = Checkout.new(items)

    expect(checkout.handle_total).to eq(51.2)
    # 4*8*.8+4*8*.8
  end
end
