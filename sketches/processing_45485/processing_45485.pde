
float posi=0;
float dista=0;
float col=0;
int sw=1;

void setup() {
  size(800, 400);
  background(255);
  smooth();
}

void draw() {
  noStroke();
  fill(0, 5);

  stroke(50);
  strokeWeight(0.1);

  float alt1=noise(dista)*450;

  translate(posi, 0);
  float pox = alt1;

  line(0, 0, 0, height);

  noStroke();

  fill(col, 50);
  float lado = 5;
  translate(0, pox);
  rect(-lado/2, -lado/2, lado, lado);

  if (posi > width) {
    posi=0;
    col=random(200);
  }
  posi+=5;
  dista+=alt1;
}


