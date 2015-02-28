
void setup() {
  size (300, 300);
  background (0);
  fill (0);
  smooth ();
  
}

void draw() {
  for (float x = 30; x <= width; x= x+30) {
    for (float y = 30; y <= height; y= y+30) {
    fill (random (255), random (255), random (255));
    quad (x, y, x+5, y, x+5, y+5, x, y+5);
   }
  }
}






