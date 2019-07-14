class Product
  attr_accessor :product_num, :name, :price

  def initialize(product_num, name, price)
    @product_num = product_num
    @name  = name
    @price = price
  end
end

class DVD < Product
  attr_accessor :running_time

  def initialize(product_num, name, price, running_time)
    #スーパークラスのinitializeメソッドを呼び出す
    super(product_num, name, price)
    #DVDクラス独自の属性
    @running_time = running_time.to_i
  end

  def products_display
    puts <<~TEXT
      商品番号:#{@product_num}
      商品名:#{@name}
      値段:#{@price}
      再生時間:#{@running_time}
      ------------------------
    TEXT
  end
end

class Book < Product
  attr_accessor :product_num, :name, :price, :page_num

  def initialize(product_num, name, price, page_num)
    super(product_num, name, price)
    #本クラスの独自の属性
    @page_num = page_num
  end

  def products_display
    puts <<~TEXT
      商品番号:#{@product_num}
      商品名:#{@name}
      値段:#{@price}
      ページ数:#{@page_num}
      ------------------------
    TEXT
  end
end

dvd1 = DVD.new(1, 'アラジン', 2000, 120)
dvd2 = DVD.new(2, 'スパイダーマン', 1500, 120)
dvd3 = DVD.new(3, 'ザ．ファブル', 1500, 100)
book1 = Book.new(4, 'Ruby入門', 3000, 500)
book2 = Book.new(5, '何者', 500, 300)

products = [dvd1, dvd2, dvd3, book1, book2]

dvd1.products_display
dvd2.products_display
dvd3.products_display
book1.products_display
book2.products_display

def payoff(products)
  puts "商品番号を選択してください"
  num = gets.chomp!.to_i
  select_product = products[num -1]
  return puts "選択された商品番号はありません" if select_product.nil?
  puts "商品の個数を選択してください"
  quantity = gets.chomp!.to_i
  #個数によって条件分岐
  if quantity >= 3
    sum = select_product.price * quantity
    #割引計算
    discount = sum * 0.1
    sum = sum - discount.to_i
    puts "お会計は#{sum}円です"
  else
    sum = select_product.price * quantity
    puts "お会計は#{sum}です"
  end
end

payoff(products)
