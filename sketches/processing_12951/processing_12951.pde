
//returns true if the given coordinates are in the given circle with center and radius given
boolean point_in_circle(PVector center, float radius, float x, float y) {
  float delta_x = x-center.x;
  float delta_y = y - center.y;
  return( sqrt(delta_x*delta_x + delta_y*delta_y) < radius );//pythagorian
}

//invert the switch colors
void invert_colors() {
  if (switch_color1 == color1) {
    switch_color1 = color2;
    switch_color2 = color1;
  }
  else {
    switch_color1 = color1;
    switch_color2 = color2;
  }
}

