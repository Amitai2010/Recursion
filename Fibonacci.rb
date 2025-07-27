def fibs_rec(num, arr = [])
  if num.zero?
    arr << 0
    arr
  end
  if num == 1
    arr << 0
    arr << 1
    arr
  else
    arr = fibs_rec(num-1, arr)
    last = arr[-1]
    second_last = arr[-2]
    arr << (last + second_last) if arr.length < num
  end
  arr
end

def fib(num)
  return [0] if num == 0
  return [0, 1] if num == 1

  arr = [0, 1]
  (2..num).each do |i|
    arr << arr[-1] + arr[-2]
  end
  arr
end

def merge(arr_left, arr_right)
  result = []

  left_idx = 0
  right_idx = 0

  while left_idx < arr_left.length && right_idx < arr_right.length
    if arr_left[left_idx] <= arr_right[right_idx]
      result << arr_left[left_idx]
      left_idx += 1
    else
      result << arr_right[right_idx]
      right_idx += 1
    end
  end

  result.concat(arr_left[left_idx..]) if left_idx < arr_left.length
  result.concat(arr_right[right_idx..]) if right_idx < arr_right.length

  result
end

def merge_sort(arr)
  if arr.length <= 1
    return arr
  end
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left, right)

end
arr = [2,6,8,2,8,4,8,3,4,8,9,1,3]
p merge_sort(arr)
