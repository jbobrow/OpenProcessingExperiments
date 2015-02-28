
int d = 60;
float xP;
float yP;
float xV = random(5, 25);
float yV = random(5, 25);

void setup() {
  size(450, 450);
  noStroke();
  smooth();
  xP = random(30, 420);
  yP = random(30, 420);
}

void draw() {
  background(164, 159, 152);

  //how ball moves
  xP = xP + xV;
  yP = yP + yV;

  //move ball on x
  if (xP >= width-(d/2) || xP <= 0+(d/2))
    xV = xV*(-1);

  //move ball on y
  if (yP <= 0+(d/2) || yP >= height-(d/2))
    yV = yV*(-1);

  //draw ball
  fill(255, 144, 0);
  ellipse(xP, yP, d, d);
}


