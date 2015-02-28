
float x1,y1;


int i = 1;
float rad = 400;
int steps = 180;
float angle = TWO_PI / steps;
 
  
void setup() {
  size(400, 400);
  smooth();
  background(250);
  
  strokeWeight(0.5);
  
  x1 = width/2;
  y1 = height/2;
}
void draw() {
   
   rad = random(100, 380);
   translate(width/2, height/2);
   
   float x2 = cos(angle * i) *rad;
   float y2 = sin(angle * i ) *rad;
   line(x1, y1, x2,y2);
    
   i++;
     
}
 


