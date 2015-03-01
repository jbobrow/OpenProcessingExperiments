
int perro = 0;
void setup () {
  size(500, 500);
  background(194, 126, 255);
}

void draw() {
  perro = perro+2;
  ellipse(width/3, perro, 5, 5);
  fill(0, 108, 255);
  ellipse((width/1.5), perro, 5, 5);
  fill(0, 255, 99);
  ellipse(perro, height/3, 5, 5);
  fill(252, 3, 3);
  ellipse(perro, ((height/3)*2), 5, 5);
  fill(255, 102, 0);
}

