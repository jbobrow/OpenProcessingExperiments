
void setup() {
  size (300, 300);
  fill (0);
  smooth ();
  
}

void draw() {
  background (0);
  for (float x = 5; x <= width; x= x+20) {
    for (float y = 5; y <= height; y= y+10) {
      ellipse (x+random(-5,5), y+random(-2,2), 10,10);
      fill (255);
      noStroke ();
   }
  }
//noLoop();
}






