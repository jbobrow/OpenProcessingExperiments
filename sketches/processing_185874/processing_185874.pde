
float rect_x = 400;
float rect_y = 0;
float move_x = 1;
float move_y = -1;

float rect_a = 100;
float rect_b = 0;

float rect_c = 100;
float rect_d = 0;

float move_a = -1;
float move_b = 4;

void setup() {
  size(400, 200);
  
   background(#21EA73);
}
void draw() {
 
  ellipse(rect_x, rect_y, 40, 40);
  stroke(#D70DFD);
  strokeWeight(1);
  rect_x = rect_x - move_x;
  rect_y = rect_y - move_y;
  if(rect_x > width) {
    rect_x = width;
    move_x = -move_x;
   
  }
  if(rect_y > height) {
    rect_y = height;
    move_y = -move_y;
    
  }
  if(rect_x < 0) {
    rect_x = 0;
    move_x = -move_x;
   
  }
  if(rect_y < 0) {
    rect_y = 0;
    move_y = -move_y;
  
  }
  rect(rect_a, rect_b, 20, 10);
  stroke(#72AA37);
  strokeWeight(4);
  rect_a = rect_a - move_x;
  rect_b = rect_b + move_y;
  if(rect_a > width) {
    rect_a = width;
    move_x = -move_x;
   
  }
  if(rect_b > height) {
    rect_b = height;
    move_y = -move_y;
    
  }
  if(rect_a < 0) {
    rect_a = 0;
    move_x = move_x;
   
  }
  if(rect_b < 0) {
    rect_b = 0;
    move_y = move_y;
    
    rect(rect_c, rect_d, 10, 50);
    stroke(#EAAA1F);
  strokeWeight(4);
  rect_c = rect_c - move_a;
  rect_d = rect_d + move_b;
  if(rect_c > width) {
    rect_c = width;
    move_a = -move_a;
   
  }
  if(rect_d > height) {
    rect_d = height;
    move_b = -move_b;
    
  }
  if(rect_c < 0) {
    rect_c = 0;
    move_a = -move_a;
    
  }
  if(rect_d < 0) {
    rect_d = 0;
    move_b = -move_b;
  
  }
  
  }
}




