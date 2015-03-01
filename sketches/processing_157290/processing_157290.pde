
int value = 5;
 
void setup(){
   size(800, 600);
   colorMode(HSB,100);
   background(0);   
}
 
void draw() {
  for(float i=0; i < 100; i++) {
  float x = random(1500);
  float y = random(1500);
  fill(value);
  rect(x, y, 50, 50);
  }
}
 
void mouseMoved() {
  value = value + 50;
  if (value > 255) {
    value = 0;
  }
}


