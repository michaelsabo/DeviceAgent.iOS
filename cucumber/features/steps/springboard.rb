

Given(/^I can see the Control Panel$/) do
  binding.pry
  topmost =  query({type: "Window"}).first
  start = {x: topmost["rect"]["width"]/2, y: topmost["rect"]["height"] - 2}
  finish = top_full_pan_point({type: "Window"})

  pan_between_coordinates(start, finish)
  sleep(1.0)

  continue_button = query({marked: "Continue", springboard: true}).first
  if (continue_button)
    coordinate = query_for_coordinate({marked: "Continue", springboard: true})
    touch_coordinate(coordinate)
    sleep(1.0)
  end

  wait_for_view({marked: "AirPlay Mirroring"})

end
