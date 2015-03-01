
int top = 1;
int num = 500;
int cuad = (int)random(50);

void setup() {
  size (1200, 600);
  background(0);
}

void draw() {
  for (int i = num-(num-1); i > 0; i--) {
  int cuad = (int)random(25);
  int col = (int)random(8001000-8000000);
  int lin =(int)random(2);
  stroke(col);
  strokeWeight(lin);
  noFill();
  rect(mouseX-cuad/2, mouseY-cuad/2, cuad, cuad);
}
}

void keyPressed() {
  int col = (int)random(8001000-8000000);
  switch (key) {
  case 'c':
  case'C':
    noStroke();
    fill(col);
    rect(mouseX-random(0-top), mouseY-random(0-top), random(0-top), random(0-top));
    top++;
    if (top>=250)top=1;
    break;

  case 'l':
  case'L':
      int lin =(int)random(2);
      int fil = (int)random(8001000-8000000);
      stroke(col);
      strokeWeight(lin);
      noFill();
      rect(mouseX-random(0-top), mouseY-random(0-top), random(0-top), random(0-top));
      top++;
      if (top>=250)top=1;
    }
  }



