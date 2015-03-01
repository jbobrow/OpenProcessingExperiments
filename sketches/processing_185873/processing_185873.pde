
float rect_c = 100;
float rect_d = 0;

float move_a = 1;
float move_b = 4;



void setup() {
  background(#21EA73);
  size(400, 200);
  stroke(#D60DFF);
  strokeWeight(7);
}
void draw() {
  
  rect(rect_c, rect_d, 10, 50);
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

