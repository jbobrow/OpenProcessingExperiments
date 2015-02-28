
int r = 20;
float x = r;
float y = 0;

float speed = 2;
int dir = 1;

float angle_multiplier;

boolean bg = true;

void setup() {
  smooth();
  size(500, 500);
}

void draw() {

  if (bg)
    background(0);

  angle_multiplier = map(mouseY, 0, height, 1, 5);

  speed = map(mouseX, 0, width, 2, 10);
  x += speed * dir;

  float map = map(x, 0, width, 0, TWO_PI * angle_multiplier);
  y = sin(map) * map(mouseY, 0, height, 20, 50);

  if (x > width-r || x < r)
    dir *= -1;

  translate(0, height/2);
  ellipse(x, y, r, r);
}

void keyPressed() {
  if (key == 't' || key == 'T') {
    bg = !bg;
  }
}


