
void setup() {
  size(400,400);
  smooth();
}


void draw() {
  background(255);
  
  float rads = atan2( mouseY - 200, mouseX - 200);
  
  line( 200 , 200, 200 + cos(rads) * 150, 200 + sin(rads) * 150);
 
}
