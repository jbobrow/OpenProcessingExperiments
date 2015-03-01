
float x = 0;

void setup() {
  size (400, 400);
  background (255);
  stroke (255);
}

void change_line_color() {
  if (random(100) > 50) {
    stroke(255);
  } 
  else {
    stroke (100,40,100);
  }
}

void draw() {
  line(x, 100, x, 200);
  x = x +1;

  if (x> width) {
    x = 0;
  }
  if (random(100) >70) {
    change_line_color();
  }
}

