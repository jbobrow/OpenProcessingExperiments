
void setup() {
size (100, 100);
background (255);
fill (255);
}

void draw() {
float y = 20;

while (y <= 80) {
  line ( 20, y+15, 80, y);
  y = y+5;
 }
}

