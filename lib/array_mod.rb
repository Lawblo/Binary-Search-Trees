# frozen_string_literal: true

# managing the array
module ArrayMod
  def mid(arr)
    arr[(0 + arr.length - 1) / 2]
  end

  def left(arr)
    arr[0, (0 + arr.length - 1) / 2]
  end

  def right(arr)
    arr[(0 + arr.length - 1) / 2 + 1, arr.length - 1]
  end

  def clean_arr(arr)
    arr.uniq.sort
  end
end
