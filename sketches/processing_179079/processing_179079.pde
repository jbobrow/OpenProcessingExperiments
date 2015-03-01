
float diam = 40;
float cX = 100;
float cY = 390;
float alpha = 250;
float cresc = 0.2;

float vX;
float vY;

void setup() {
  size(1000, 450);
  smooth();

  diam = 40;
  vX = 2;
  vY = -1;
}

void draw() {

  background(255);

  cX = cX + vX;
  cY = cY + vY;
  diam = diam + cresc;

  noStroke();
  fill(200, 0, 0, alpha);
  ellipse(cX, cY, diam, diam);

  if (cY<diam/2) {
 vY=0;
 vX=0;
 diam = diam +3+(random(-20,20)+frameCount/50);
 alpha=alpha-1;
 cY=cY + 0.01;
}
}


