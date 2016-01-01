require "./bubble_sort"

describe "#sort" do

  it "sort an array" do
    a = bubble_sort([4, 3, 78, 2, 0, 2])
    a.should == [0, 2, 2, 3, 4, 78]
  end

  it "sort an array" do
    a = bubble_sort([55, 88, 6, -3, -5, 100, 8000])
    a.should == [-5, -3, 6, 55, 88, 100, 8000]
  end

   it "sort an array" do
    a = bubble_sort([35, 34, 33, 32, 31, 50, 49, 48, 47, 46, 45, 5, 4, 3, 2, 1])
    a.should == [1, 2, 3, 4, 5, 31, 32, 33, 34, 35, 45, 46, 47, 48, 49, 50]
  end

  it "give the same array, if there is only one item" do
    a = bubble_sort([1])
    a.should == [1]
  end

  it "give the same array, if it's empty" do
    a = bubble_sort([])
    a.should == []
  end

  it "sorts an array but accepts a block" do
    a = bubble_sort_by(["hi","hello","hey"]) do |left,right|
      left.length - right.length
    end
    a.should == ["hi", "hey", "hello"]
  end

end




