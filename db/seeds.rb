# encoding: utf-8
#This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#___
Exercise.delete_all
#É
Exercise.create(title: 'Single Distance Workout',
  description: 
    %{<p>
      Single Distance - how many meters did you row?
    </p>},
  image_url: 'singledist.jpg')
#
Exercise.create(title: 'Single Time Workout', 
  description:
    %{<p>
      Single Time - how long did you row for? 
    </p>},
  image_url: 'singletime.jpg')
#
Exercise.create(title: 'Cross Train/Other', 
  description:
    %{<p>
      Tell us about your non-rowing workout! 
    </p>}, 
  image_url: 'crosstrain.jpg')

