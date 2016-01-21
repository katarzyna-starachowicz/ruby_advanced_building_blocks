module Enumerable

  def my_each
    return enum_for(:my_each) unless block_given?
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?
    index = 0
    for item in self
      yield(item, index)
      index += 1
    end
  end

  def my_select
    return enum_for(:my_select) unless block_given?
    new_array = []
    for item in self
      new_array << item if yield(item)
    end
    new_array
  end

  def my_all?
    result = true
    if block_given?
      self.my_each { |item| result = false unless yield(item) }   
    else
      self.my_each { |item| result = false unless item }
    end
    result
  end

  def my_any?
    result = false
    if block_given?
      self.my_each { |item| result = true if yield(item) }
    else
      self.my_each { |item| result = true if item }
    end
    result
  end

  def my_none?
    result = true
    if block_given?
      self.my_each { |item| result = false if yield(item) }
    else
      self.my_each { |item| result = false if item }
    end
    result
  end

  def my_count(*arg)
    return self.size unless block_given? || arg != []
    count = 0
    if block_given?
      for i in 0...self.size
        count += 1 if yield(self[i])
      end
    else
      for i in 0...self.size
        count += 1 if arg[0] == self[i]
      end
    end
    count
  end

  def my_map(&block)
    return enum_for(:my_map) unless block_given?
    new_array = []
    self.my_each { |item| new_array << block.call(item) }
    new_array
  end

  def my_inject(n = nil)
    memo = n == nil ? self.first : n
    m = n == nil ? self.my_count - 1 : self.my_count
    for i in self.last(m)
      memo = yield(memo, i)
    end
    memo
  end

end

def multiply_els(array)
  array.my_inject { |m, n| m * n}
end