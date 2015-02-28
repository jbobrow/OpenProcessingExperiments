
void setup() {
  size (100, 100);
  background (255);
  fill (255);
  smooth ();
}

void draw() {
  for (float y = 20; y <= 80; y= y+10) {
     line ( 20, y, 50, y);
    }
  for (float y = 25; y <= 80; y= y+10) {
     line ( 50, y, 80, y);
    }
}






