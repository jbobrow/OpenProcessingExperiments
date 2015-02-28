
void setup() {
size (100, 100);
background (255);
fill (255);
smooth ();
}

void draw() {
for (float y = 1; y <= 80; y= y*1.5) {
  line ( 20, y+19, 80, y+19);
  }
}

