
int circle_x = 200;

void setup() {
  size(500, 500);
};
void draw () {
  fill(60, 200, 206, 50);
//background erases previous pixels
  background(255);
  stroke(255);
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(circle_x, 250, 100, 100);
  circle_x = circle_x + 2;
  println(circle_x);
  fill(255);
////fourth number is opacity
  ellipse(250, 250, 200, 200);
  fill(0);
////  
////do placement within screen
  ellipse(width/2, height/2, 100, 100);
//
////change drawing position with mouse
  ellipse(mouseX/2, mouseY/2, 50, 50);
  ellipse(mouseX+30, mouseY+30, 50, 50);
  
};



