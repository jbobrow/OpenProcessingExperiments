
/*
an example of recording mouse clicks and drawing a shape with them
*/
int num_clicks_stored = 10;
int click_number = 0;
int[] mouse_click_x = new int[num_clicks_stored];
int[] mouse_click_y = new int[num_clicks_stored];

void setup() {
  size(400, 400);
}
void draw() {
  background(180);
  drawPoints();
}
void mouseClicked() {
  // this save last mouse click
  
  //logic breakdown:
  //if we have clicked too many times, replace earlier clicks
  //if click_number is the same as the amount we can store, replace earlier clicks
  // if (click_number == num_clicks_stored) { start on the first clicks }
  // if (click_number == num_clicks_stored) { click_number = 0 }
  
  if (click_number >= num_clicks_stored) {
    click_number = 0;
  }
  mouse_click_x[click_number] = mouseX;
  mouse_click_y[click_number] = mouseY;
  click_number++;
  //the two below are the same as the line above
  //click_number += 1;
  //click_number = click_number + 1;
}
void drawPoints() {
  //draw lines between all clicks
  //draw points and connect the dots
  //draw a shape's vertexes
  beginShape();
  for (int i = 0; i < num_clicks_stored; i++) {
    vertex(mouse_click_x[i], mouse_click_y[i]);
  }
  /*
    the above for loop is exactly the same as writing this:
    vertex(mouse_click_x[0], mouse_click_y[0]);
    vertex(mouse_click_x[1], mouse_click_y[1]);
    vertex(mouse_click_x[2], mouse_click_y[2]);
    vertex(mouse_click_x[3], mouse_click_y[3]);
    vertex(mouse_click_x[4], mouse_click_y[4]);
    vertex(mouse_click_x[5], mouse_click_y[5]);
    vertex(mouse_click_x[6], mouse_click_y[6]);
    vertex(mouse_click_x[7], mouse_click_y[7]);
    vertex(mouse_click_x[8], mouse_click_y[8]);
    vertex(mouse_click_x[9], mouse_click_y[9]);
  */
  endShape();
}
