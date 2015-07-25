require "byebug"

def range(first, last)
  [last] if first == last
  if last < first
    []
  else
    [first] + range((first + 1), last)
  end
end


def exponent_one(num, exp)
  1 if exp == 0
  num * exponent_r(num, (exp - 1))
end

def exponent_two(num, exp)
  if exp == 0
    1
  elsif exp == 1
    num
  elsif exp.even?
    exponent_two(num, exp / 2) ** 2
  else
    num * exponent_two(num, (exp - 1) / 2) ** 2
  end
end

def deep_dup(arr)
  if arr.none? { |el| el.is_a?(Array)}
    arr.dup
  else
    arr.inject([]) do |arrays, el|
      if el.is_a?(Array)
        arrays + [deep_dup(el)]
      else
        arrays + [el]
      end
    end
  end
end

def fibonacci(n)
  if n == 0
    [0]
  elsif n == 1
    [0, 1]
  else
    fibonacci(n-1) + [fibonacci(n - 1)[-2] + fibonacci(n - 1)[-1]]
  end
end

def fibonacci_i(n)
  if n == 0
    arr = [0]
  else
    arr = [0, 1]
    (n - 1).times do
      arr << (arr[-2] + arr[-1])
    end
  end
  arr
end

def bsearch(arr, target)
  nil if arr.length == 0

  half_arr_length = arr.length / 2
  if arr[half_arr_length] == target
    arr.length / 2
  elsif arr[half_arr_length] > target
    bsearch(arr[0...half_arr_length], target)
  else
    bsearch(arr[(half_arr_length + 1)...arr.length], target) + half_arr_length + 1
  end
end

def make_change(value, coins)
  return [] if coins.length == 0

  if value < coins[0]
    make_change(value, coins.drop(1))
  elsif coins.length == 1
    if value % coins[0] != 0
      nil
    else
      [coins[0]] + make_change(value - coins[0], coins)
    end
  else
    use_biggest_coin = [coins[0]] + make_change(value - coins[0], coins)
    not_using_biggest_coin = make_change(value, coins[1..-1])
    if use_biggest_coin.inject(:+) != value && not_using_biggest_coin.inject(:+) != value
      nil
    elsif use_biggest_coin.length <= not_using_biggest_coin.length
      use_biggest_coin
    else
      not_using_biggest_coin
    end
  end
end

def merge_sort(arr)
  return [arr] if arr.length < 2

  set_of_arrays = []
  set_of_arrays + merge_sort(arr[0...arr.length / 2])
  # second_half = merge_sort(arr[(arr.length / 2)..arr.length])
end

def merge(arr1, arr2)
  arr1[0] < arr2[0] ? [arr1, arr2] : [arr2, arr1]
end
