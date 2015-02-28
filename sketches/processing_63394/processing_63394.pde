
void setup() {
size (100, 100);
background (255);
fill (255);
smooth ();
}

void draw() {
for (float x = 1; x <= 80; x= x*1.5) {
  line ( x+19, 20, x+19, 80);
  }
}

