module Enumerable

  def my_each
    if block_given?
      for i in self
        yield(i)
      end
    else
     "<Enumerator: #{self}:my_each>" #It should be an Enumerator :-/
    end
  end

  def my_each_with_index
    index = 0
    if block_given?
      for item in self
        yield(item, index)
        index += 1
      end
    else
      "<Enumerator: #{self}:my_each_with_index>" #It should be an Enumerator :-/
    end
  end

  def my_select
    new_array = []
    if block_given?
      for i in self
        new_array << i if yield(i)
      end
    else
      "<Enumerator: #{self}:my_select>" #It should be an Enumerator :-/
    end
    new_array
  end

  def my_all?
    if block_given?
      result = true
      self.my_each { |item| result = false unless yield(item) }  	
    else
      self.my_each { |item| result = false if item }
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

  def my_count(arg = nil)
  	result = 0
    if block_given?
      self.my_each { |item| result += 1 if yield(item) }
    elsif arg != nil
      self.my_each { |item| result += 1 if arg == item }
    else
      self.my_each { result += 1 }
    end
    result
  end

  def my_map(&block)
    new_array = []
    if block_given?
      self.my_each { |item| new_array << block.call(item) }
    else
      "<Enumerator: #{self}:my_map>" #It should be an Enumerator :-/
    end
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