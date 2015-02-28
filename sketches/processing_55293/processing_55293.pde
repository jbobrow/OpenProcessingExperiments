
int x = 0;
int y = 0;

void setup() {
  size(600, 400);
}

void draw() {
  background(200,55,209);
  fill(255);
  noStroke();
  rect(x, y, 70, 90);
  fill(200,55,209);
  rect(x + 10, y + 10, 10, 10);
  rect(x + 50, y + 10, 10, 10);
  rect(x + 10, y +50, 50, 10);
}

void keyPressed() {
  if (key == 'd')
  x = x + 5;
  if (key == 'f')
  x = x - 5;
  if (key == 'v')
  y = y + 5;
  if (key == 'z')
  y = y - 5;
  
}

