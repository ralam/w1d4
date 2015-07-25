require "byebug"

class Array
  def my_each(&block)
    self.length.times { |el| block.call(self[el]) }
  end

  def my_map(&block)
    arr = []
    self.my_each do |el|
      arr << block.call(el)
    end
    arr
  end

  def my_select(&block)
    arr = []
    self.my_each do |el|
      arr << el if block.call(el)
    end
    arr
  end

  def my_inject(&block)
    result = self[0]
    self.drop(1).my_each do |el|
      result = block.call(result, el)
    end
    result
  end

  def my_sort!(&block)
    self.length.times do
      self.each_with_index do |x, idx|
        y = self[idx + 1]
        if y.nil?
          next
        elsif block.call(x, y) > 0
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
        end
      end
    end
    self
  end

  def my_sort(&block)
    arr = self.dup
    arr.my_sort!(&block)
  end

  def <=>(obj)
    self.value <=> obj.value
  end
end

def eval_block(*args, &block)
  if block_given?
    block.call(*args)
  else
    puts "NO BLOCK GIVEN"
  end
end
