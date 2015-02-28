

float x = 0;

int px = 50;
int py = 50;

      int i = 0;

void setup() {
  size(400, 400);
  smooth();
  rectMode(RADIUS);
  noStroke();
  background(0);
}

void draw() {

  while (i < 8) {

    x = int(random(1, 3));

    if (x == 2) {
      rect(px, py + 50, 25, 25);
      py = py + 50;
    } 

    if (x ==1) {
      rect(px + 50, py, 25, 25);
      px = px + 50;
    } 

    println(i);
    i = i + 1;
  }

  if (mousePressed == true) {
    background(0);
    i = 0;
    px = 50;
    py = 50;
  }
}



