require "./enumerable_methods"

describe "#enumerable methods - my way" do

  it "my_each" do
    a = ["a", "b", "c"].my_each { |x| print x, "--" }
    a.should == ["a", "b", "c"].each { |x| print x, "--" }
  end

  it "my_select" do
    a = [1,2,3,4,5].my_select { |num|  num.even? }
    a.should == [1,2,3,4,5].select { |num|  num.even? }
  end

  it "my_all?" do
    a = %w[ant bear cat].my_all? { |word| word.length >= 3 }
    a.should == %w[ant bear cat].all? { |word| word.length >= 3 }
  end

  it "my_all?" do
    a = %w[ant bear cat].my_all? { |word| word.length >= 4 }
    a.should == %w[ant bear cat].all? { |word| word.length >= 4 }
  end

  it "my_all?" do
    a = [nil, true, 99].my_all?
    a.should == [nil, true, 99].all?
  end

  it "my_any?" do
    a = %w[ant bear cat].my_any? { |word| word.length >= 3 }
    a.should == %w[ant bear cat].any? { |word| word.length >= 3 }
  end

  it "my_any?" do
    a = %w[ant bear cat].my_any? { |word| word.length >= 4 }
    a.should == %w[ant bear cat].any? { |word| word.length >= 4 }
  end

  it "my_any?" do
    a = [nil, true, 99].my_any?
    a.should == [nil, true, 99].any?
  end

  it "my_none?" do
    a = %w{ant bear cat}.my_none? { |word| word.length == 5 }
    a.should == %w{ant bear cat}.none? { |word| word.length == 5 }
  end

  it "my_none?" do
    a = %w{ant bear cat}.my_none? { |word| word.length >= 4 }
    a.should == %w{ant bear cat}.none? { |word| word.length >= 4 }
  end

  it "my_none?" do
    a = [].my_none?
    a.should == [].none?
  end

  it "my_none?" do
    a = [nil].my_none?
    a.should == [nil].none?
  end

  it "my_none?" do
    a = [nil, false].my_none?
    a.should == [nil, false].none?
  end

  it "my_count" do
    a = [1, 2, 4, 2].my_count
    a.should == [1, 2, 4, 2].count
  end

  it "my_count" do
    a = [1, 2, 4, 2].my_count(2)
    a.should == [1, 2, 4, 2].count(2)
  end

  it "my_count" do
    a = [1, 2, 4, 2].my_count { |x| x % 2 == 0 }
    a.should == [1, 2, 4, 2].count { |x| x % 2 == 0 }
  end

  it "my_map" do
    a = (1..4).my_map { |i| i * i }
    a.should == (1..4).map { |i| i * i }
  end

  it "my_inject" do
    a = (5..10).my_inject { |sum, n| sum + n }
    a.should == (5..10).inject { |sum, n| sum + n }
  end

  it "my_inject" do
    a = (5..10).my_inject(1) { |product, n| product * n }
    a.should == (5..10).inject(1) { |product, n| product * n }
  end

  it "multiply_els" do
    a = multiply_els([2, 4, 5])
    a.should == 40
  end

end




