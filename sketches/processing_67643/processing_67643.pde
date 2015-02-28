
float circle_x = 100;
float circle_y = 100;
float move_x = 5;
float move_y = -5;

void setup() {
  size(400,400);
  stroke(0,255,0);
  strokeWeight(5);
}
void draw() {
  background(#430F06);
  ellipse(circle_x,circle_y,40,40);
  rect(0,mouseY,10,100);
  rect(390, mouseY, 10, 105); 
  circle_y = circle_y + move_y;
  circle_x = circle_x + move_x;
  
  if(circle_x >= 370) {
    circle_x = 370;
    move_x = -move_x;
  }
  if(circle_y > height) {
    circle_y = height;
    move_y = -move_y; 
  }
  if(circle_x <= 30) {
    circle_x = 30;
    move_x = -move_x;
  }
  if(circle_y < 0) {
    circle_y = 0;
    move_y = -move_y;
  }
}

