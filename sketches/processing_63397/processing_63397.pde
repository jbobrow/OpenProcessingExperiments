
void setup() {
  size (100, 100);
  background (255);
  fill (0);
  smooth ();
  
}

void draw() {
  for (float x = 5; x <= width; x= x+10) {
    for (float y = 5; y <= height; y= y+10) {
     point (x, y);
   }
  }
}






