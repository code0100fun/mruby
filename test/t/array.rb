##
# Array ISO Test

assert('Array', '15.2.12') do
  assert_equal(Array.class, Class)
end

assert('Array superclass', '15.2.12.2') do
  assert_equal(Array.superclass, Object)
end

assert('Array.[]', '15.2.12.4.1') do
  assert_equal(Array.[](1,2,3), [1, 2, 3])
end

assert('Array#*', '15.2.12.5.1') do
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong argument
    [1].*(-1)
  end
  assert_equal([1].*(3), [1, 1, 1])
  assert_equal([1].*(0), [])
end

assert('Array#+', '15.2.12.5.2') do
  assert_equal([1].+([1]), [1, 1])
end

assert('Array#<<', '15.2.12.5.3') do
  assert_equal([1].<<(1), [1, 1])
end

assert('Array#[]', '15.2.12.5.4') do
  a = Array.new
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong arguments
    a.[]()
  end
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong arguments
    a.[](1,2,3)
  end

  assert_equal([1,2,3].[](1), 2)
end

assert('Array#[]=', '15.2.12.5.5') do
  a = Array.new
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong arguments
    a.[]=()
  end
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong arguments
    a.[]=(1,2,3,4)
  end

  assert_equal([1,2,3].[]=(1,4), 4)
  assert_equal([1,2,3].[]=(1,2,3), 3)
end

assert('Array#clear', '15.2.12.5.6') do
  a = [1]
  a.clear
  assert_equal(a, [])
end

assert('Array#collect!', '15.2.12.5.7') do
  a = [1,2,3]
  a.collect! { |i| i + i }
  assert_equal(a, [2,4,6])
end

assert('Array#concat', '15.2.12.5.8') do
  assert_equal([1, 2].concat([3, 4]), [1,2,3,4])
end

assert('Array#delete_at', '15.2.12.5.9') do
  a = [1,2,3]
  a.delete_at(1)
  assert_equal(a, [1,3])
end

assert('Array#each', '15.2.12.5.10') do
  a = [1,2,3]
  b = 0
  a.each {|i| b += i}
  assert_equal(b, 6)
end

assert('Array#each_index', '15.2.12.5.11') do
  a = [1]
  b = nil
  a.each_index {|i| b = i}
  assert_equal(b, 0)
end

assert('Array#empty?', '15.2.12.5.12') do
  a = []
  b = [b]
  assert_true([].empty?)
  assert_false([1].empty?)
end

assert('Array#first', '15.2.12.5.13') do
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong argument
    [1,2,3].first(-1)
  end
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong argument
    [1,2,3].first(1,2)
  end

  assert_nil([].first)

  b = [1,2,3]
  assert_equal(b.first, 1)
  assert_equal(b.first(0), [])
  assert_equal(b.first(1), [1])
  assert_equal(b.first(4), [1,2,3])
end

assert('Array#index', '15.2.12.5.14') do
  a = [1,2,3]

  assert_equal(a.index(2), 1)
end

assert('Array#initialize', '15.2.12.5.15') do
  a = [].initialize(1)
  b = [].initialize(2)
  c = [].initialize(2, 1)
  d = [].initialize(2) {|i| i}

  assert_equal(a, [nil])
  assert_equal(b, [nil,nil])
  assert_equal(c, [1,1])
  assert_equal(d, [0,1])
end

assert('Array#initialize_copy', '15.2.12.5.16') do
  a = [1,2,3]
  b = [].initialize_copy(a)

  assert_equal(b, [1,2,3])
end

assert('Array#join', '15.2.12.5.17') do
  a = [1,2,3].join
  b = [1,2,3].join(',')

  assert_equal(a, '123')
  assert_equal(b, '1,2,3')
end

assert('Array#last', '15.2.12.5.18') do
  assert_raise(ArgumentError) do
    # this will cause an exception due to the wrong argument
    [1,2,3].last(-1)
  end

  a = [1,2,3]
  assert_equal(a.last, 3)
  assert_nil([].last)
end

assert('Array#length', '15.2.12.5.19') do
  a = [1,2,3]

  assert_equal(a.length, 3)
end

assert('Array#map!', '15.2.12.5.20') do
  a = [1,2,3]
  a.map! { |i| i + i }
  assert_equal(a, [2,4,6])
end

assert('Array#pop', '15.2.12.5.21') do
  a = [1,2,3]
  b = a.pop

  assert_nil([].pop)
  assert_equal(a, [1,2])
  assert_equal(b, 3)
end

assert('Array#push', '15.2.12.5.22') do
  a = [1,2,3]
  b = a.push(4)

  assert_equal(a, [1,2,3,4])
  assert_equal(b, [1,2,3,4])
end

assert('Array#replace', '15.2.12.5.23') do
  a = [1,2,3]
  b = [].replace(a)

  assert_equal(b, [1,2,3])
end

assert('Array#reverse', '15.2.12.5.24') do
  a = [1,2,3]
  b = a.reverse

  assert_equal(a, [1,2,3])
  assert_equal(b, [3,2,1])
end

assert('Array#reverse!', '15.2.12.5.25') do
  a = [1,2,3]
  b = a.reverse!

  assert_equal(a, [3,2,1])
  assert_equal(b, [3,2,1])
end

assert('Array#rindex', '15.2.12.5.26') do
  a = [1,2,3]

  assert_equal(a.rindex(2), 1)
end

assert('Array#shift', '15.2.12.5.27') do
  a = [1,2,3]
  b = a.shift

  assert_nil([].shift)
  assert_equal(a, [2,3])
  assert_equal(b, 1)
end

assert('Array#size', '15.2.12.5.28') do
  a = [1,2,3]

  assert_equal(a.size, 3)
end

assert('Array#slice', '15.2.12.5.29') do
  a = "12345".slice(1, 3)
  b = a.slice(0)

  assert_equal("#{b}:", "2:")
  assert_equal([1,2,3].[](1), 2)
end

assert('Array#unshift', '15.2.12.5.30') do
  a = [2,3]
  b = a.unshift(1)
  c = [2,3]
  d = c.unshift(0, 1)

  assert_equal(a, [1,2,3])
  assert_equal(b, [1,2,3])
  assert_equal(c, [0,1,2,3])
  assert_equal(d, [0,1,2,3])
end

assert('Array#to_s', '15.2.12.5.31 / 15.2.12.5.32') do
  a = [2, 3,   4, 5]
  r1 = a.to_s
  r2 = a.inspect

  assert_equal(r1, r2)
  assert_equal(r1, "[2, 3, 4, 5]")
end

assert('Array#==', '15.2.12.5.33') do
  assert_false(["a", "c"] == ["a", "c", 7])
  assert_true(["a", "c", 7] == ["a", "c", 7])
  assert_false(["a", "c", 7] == ["a", "d", "f"])
end

assert('Array#eql?', '15.2.12.5.34') do
  a1 = [ 1, 2, 3 ]
  a2 = [ 1, 2, 3 ]
  a3 = [ 1.0, 2.0, 3.0 ]

  assert_true(a1.eql? a2)
  assert_false(a1.eql? a3)
end

assert('Array#hash', '15.2.12.5.35') do
  a = [ 1, 2, 3 ]

  assert_true(a.hash.is_a? Integer)
end

assert('Array#<=>', '15.2.12.5.36') do
  r1 = [ "a", "a", "c" ]    <=> [ "a", "b", "c" ]   #=> -1
  r2 = [ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1
  r3 = [ "a", "b", "c" ]    <=> [ "a", "b", "c" ]   #=> 0

  assert_equal(r1, -1)
  assert_equal(r2, +1)
  assert_equal(r3, 0)
end

# Not ISO specified

assert("Array (Shared Array Corruption)") do
  a = [ "a", "b", "c", "d", "e", "f" ]
  b = a.slice(1, 3)
  a.clear
  b.clear
end

