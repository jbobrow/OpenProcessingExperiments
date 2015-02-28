
void setup() {
  size(400,400);
  smooth();
  noStroke(); 
}
 
void draw() {
  background (16,206,218);;
  fill(245,145,231);
  for(int i=0; i < 60; i = i + 1) {
     rect (0, i*20 +5,height, i*0.2);
  }
}
