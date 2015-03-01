
int x = 300;
int y = 300;
int a = 300;
int b = 300;
int c = 300;
int d = 300;
int e = 150;
int f = 150;
int g = 425;
int h = 150;

void setup() {
  size(600,600);
  frameRate(50);
}
void draw() {  
  background(255, 255, 0);
  noStroke();
  fill(0, 0, 0);
  ellipse(a, b, 400, 400);
  noStroke();
  fill(255, 255, 255);
  ellipse(c, d, 90, 90);
  noStroke();
  fill(0, 0, 0);
  ellipse(x, y, 30, 30);
  noStroke();
  fill(0, 0, 0);
  rect(e, f, 30, 60);
  noStroke();
  fill(0, 0, 0);
  rect(g, h, 30, 60);
  x++;
  y++;
  if (x > 301) {
    x = 300;
    y = 300;
  }
  a++;
  b++;
  if (a > 303) {
    a = 300;
    b = 300;
  }
  c++;
  d++;
  if (c > 302) {
    c = 300;
    d = 300;
  }
  e++;
  f++;
  if (e > 151) {
    e = 150;
    f = 150;
  }
  g++;
  h++;
  if (g > 426) {
    g = 425;
    h = 150;
  }
  fill(255, 255, 0);
  ellipse(mouseX, mouseY, 40, 40);
}


