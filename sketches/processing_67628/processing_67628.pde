

float circle_x=300;
float circle_y=70;

float move_x=2;
float move_y=2;

float r=0;
float g=0;
float b=0;

void setup(){;
  size(400,200);
  stroke(r,g,b);
  strokeWeight(7);
   background(0);
}
void draw(){

rect(mouseX, mouseY, 60, 60);
  
 
  strokeWeight(4);
  
  ellipse(circle_x, circle_y, 40, 40);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > width) {
    circle_x = width;
    move_x= -move_x;
  fill(random(256),random(256),random(256));
  }
  if(circle_y > height) {
    circle_y = height;
    move_y = -move_y;
  fill(random(256),random(256),random(256));
  }
  if(circle_x <0) {
    circle_x = 0;
    move_x = -move_x;
   fill(random(256),random(256),random(256));
  }
  if(circle_y <0) {
    circle_y= 0;
    move_y = -move_y;
  fill(random(256),random(256),random(256));
}
}
    

