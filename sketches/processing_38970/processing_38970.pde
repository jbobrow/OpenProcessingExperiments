
//initial position for our circle
float circle_x = 300;
float circle_y = 20;
float circle_x2 = 100;
float circle_y2 = 50;

//how much to move that circle on each frame
float move_x = 2;
float move_y = -2;
float move_y2 = -2;
float move_x2 = 2;

void setup() {
  size(400, 200);
  stroke(0);
  strokeWeight(2);
}
void draw() {
  background(#3040C6);
  ellipse(circle_x, circle_y, 20, 20);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > width){
    circle_x = width;
    move_x = -move_x;    
    println("BING!");
  }
  if(circle_y > height) {
    circle_y = height;
    move_y = -move_y;
    println("BING!");
  }
  if(circle_x < 0) {
    circle_x = 0;
    move_x = -move_x;
    println("BING!");
  }
  if(circle_y < 0) {
    circle_y = 0;
    move_y = -move_y;
    println("BING!");
  }
  
  //NEW
  
  ellipse(circle_x2, circle_y2, 10, 10);
  circle_x2 = circle_x2 + move_x2;
  circle_y2 = circle_y2 + move_y2;
  
  if(circle_x2 > width){
    circle_x2 = width;
    move_x2 = -move_x2;    
    println("BING!");
  }
  if(circle_y2 > height) {
    circle_y2 = height;
    move_y2 = -move_y2;
    println("BING!");
  }
  if(circle_x2 < 0) {
    circle_x2 = 0;
    move_x2 = -move_x2;
    println("BING!");
  }
  if(circle_y2 < 0) {
    circle_y2 = 0;
    move_y2 = -move_y2;
    println("BING!");
  }
}


