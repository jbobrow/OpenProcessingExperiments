
float rads;

void setup() {
  size(400,400);
  smooth();
}


void draw() {
  background(255);
  
  rads = rads + 0.01;
  
  line( 200 , 200, 200 + cos(rads) * 150, 200 + sin(rads) * 150);
  
}
