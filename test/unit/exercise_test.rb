require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  fixtures :exercises
  test "exercise attributes must not be empty" do
    exercise = Exercise.new
    assert exercise.invalid?
    assert exercise.errors[:title].any?
    assert exercise.errors[:description].any?
    assert exercise.errors[:image_url].any?
  end

  def new_exercise(image_url)
    Exercise.new(title:       "My Exercise",
                 description: "yyy",
                 image_url:   image_url)
  end

  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg 
             http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_exercise(name).valid?, "#{name} shouldn't be invalid"
    end 

    bad.each do |name|
      assert new_exercise(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "exercise is not valid without a unique title" do
    exercise = Exercise.new(title:       exercises(:steady).title,
                            description: "yyy",
                            image_url:   "fred.gif")
    assert exercise.invalid?
    assert_equal ["has already been taken"], exercise.errors[:title]
  end

end
