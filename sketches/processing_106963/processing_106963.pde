
int px;
int py;
int raio;
int minRaio;
int maxRaio;
int vx;
void setup() {
  size(600, 400);
  background(0, 0, 0);
  noStroke();
  px      = width / 2;
  py      = height / 2;
  raio    = 50;
  vx      = 3;
  minRaio = 50;
  maxRaio = 300;
}   

void draw() {
  background(0, 0, 0);
  fill(255, 0, 0);
  ellipse(px, py, raio, raio);
  raio += vx;  // raio = raio + vx;
  if (raio > maxRaio || raio < minRaio) {
    vx *= (-1);
  }
}
