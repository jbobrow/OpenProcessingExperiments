
//Jeff Conway, jconway@andrew.cmu.edu
//Copyright 2014

float easing_value = 0.05;
float prior_rectangle_x = 0;
float prior_rectangle_y = 0;

void setup(){
  size(400, 400);
}

void draw(){
  background(50, 50, 50);
  rectMode(CENTER);

  float difference_in_x = mouseX - prior_rectangle_x;
  float difference_in_y = mouseY - prior_rectangle_y;

  float new_rectangle_x = prior_rectangle_x + (difference_in_x*easing_value);
  float new_rectangle_y = prior_rectangle_y + (difference_in_y*easing_value);

  fill(100, 100, 100);
  rect(new_rectangle_x, new_rectangle_y, 100, 100);

  prior_rectangle_x = new_rectangle_x;
  prior_rectangle_y = new_rectangle_y;
}


