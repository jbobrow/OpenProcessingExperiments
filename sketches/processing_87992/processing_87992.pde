
float circle_x = 300;
float circle_y = 20;

float move_x = 4;
float move_y = -4;

void setup(){
  size(400, 300);
  stroke(220,225,220);
  strokeWeight(0);
}

void draw(){
  background(4,108,8);
  rect(200, 0, 5,300);
  rect(0, 100, 5, 100);
  rect(395, 100, 5, 100);
  ellipse(circle_x, circle_y, 20, 20);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > width) {
    circle_x = width;
    move_x = -move_x;
    println("too right");
  }
  if(circle_y > height) {
    circle_y = height;
    move_y = -move_y;
    println("too bottom");
  }
  if(circle_x < 0) {
    circle_x = 0;
    move_x = -move_x;
    println("too left");
  }
  if(circle_y < 0) {
    circle_y = 0;
    move_y = -move_y;
    println("too top");
}
}


