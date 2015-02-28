
float t = 0;
int nbLignes = 400;
int i=0;

void setup() {
  size(300,300);
  background(160);
  noStroke();
  smooth();
}

void draw() {
  float n = noise(t);
  float h = map(n, 0, 1, 0, height);
  fill(103, 255, 255);
  pushMatrix();
  translate(i*(height/nbLignes), width/2);
  rotate(radians(h));
  rect(0, 0-h/2, 1, h);
  popMatrix();
  t+=0.01;
  if (i<nbLignes) i++;
  else { 
    i=0;
    background(160);
  }
}



