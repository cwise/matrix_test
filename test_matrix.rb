load "my_matrix.rb"
require "test/unit"
 
class TestMyMatrix < Test::Unit::TestCase
 
  def test_perfect_square
  	# true cases
    assert_equal true, MyMatrix.new(1).perfect_square?
    assert_equal true, MyMatrix.new(4).perfect_square?
    assert_equal true, MyMatrix.new(9).perfect_square?
    assert_equal true, MyMatrix.new(16).perfect_square?
    assert_equal true, MyMatrix.new(25).perfect_square?
    assert_equal true, MyMatrix.new(36).perfect_square?

    # false cases
    assert_equal false, MyMatrix.new(2).perfect_square?
    assert_equal false, MyMatrix.new(3).perfect_square?
    assert_equal false, MyMatrix.new(5).perfect_square?
    assert_equal false, MyMatrix.new(6).perfect_square?
    assert_equal false, MyMatrix.new(7).perfect_square?
    assert_equal false, MyMatrix.new(8).perfect_square?
    assert_equal false, MyMatrix.new(10).perfect_square?
    assert_equal false, MyMatrix.new(11).perfect_square?
    assert_equal false, MyMatrix.new(12).perfect_square?
    assert_equal false, MyMatrix.new(13).perfect_square?
    assert_equal false, MyMatrix.new(14).perfect_square?
    assert_equal false, MyMatrix.new(15).perfect_square?
  end
 
  def test_spiral_1
  	assert_equal [[1]], MyMatrix.new(1).matrix
  end

  def test_spiral_4
  	assert_equal [[4, 3], [1, 2]], MyMatrix.new(4).matrix
  end

  def test_spiral_9
  	assert_equal [[5, 4, 3], [6, 1, 2], [7, 8, 9]], MyMatrix.new(9).matrix
  end

  def test_spiral_16
  	assert_equal [[16, 15, 14, 13], [5, 4, 3, 12], [6, 1, 2, 11], [7, 8, 9, 10]], MyMatrix.new(16).matrix
  end
end
