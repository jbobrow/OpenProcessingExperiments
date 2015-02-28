
float circle_x = 0;
float circle_y = 0;
float x = 4;
float y = -5;

void setup() {
  size(500,500);
    background(0);
}


void draw() {
    background(0);
  smooth();
  ellipse (circle_x,circle_y,50,50);
  
 circle_x= circle_x + x;
  circle_y = circle_y + y;
  

if(circle_x > width) {
  println("too far right");
  circle_x = width;
  x = -x;
  fill(random(255),random(255),random(255));
}

if(circle_y > height) {
  println("too far bottom");
  circle_y = height;
  y = -y;
  fill(random(255),random(255),random(255));
}

if(circle_x <0){
  println("too far left");
  circle_x = 0;
  x = -x;
  fill(random(255),random(255),random(255));
  
}

if(circle_y<0){
  println("too far top");
  circle_y = 0;
  y = -y;
  fill(random(255),random(255),random(255));
}

}




