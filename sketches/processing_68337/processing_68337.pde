
float rads;

void setup() {
  size(400,400);
  smooth();
}


void draw() {
  background(255);
  
 
  rads = atan2( mouseY - 200, mouseX - 200);
  float distance = dist(mouseX,mouseY,200,200);
 
  line( 200 , 200, 200 + cos(rads) * distance, 200 + sin(rads) * distance);

}
