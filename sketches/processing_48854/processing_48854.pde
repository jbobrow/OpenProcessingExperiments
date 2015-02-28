
int r = 300;

int cr = 40;

float[] b;

float y = 400;

void setup() {
  size(400, 400);

  background(255);  
  smooth();

  noLoop();
}

void draw() {
  ptn(width/2, height);
  ptn(width/2, 0);

  ellipse(width/2, height/2, cr, cr);
}

void ptn(int w, int h) {
  noStroke();

  fill(200, 0, 0);
  ellipse(w-r, h, r*2, r*2);
  ellipse(w+r, h, r*2, r*2);

  fill(0);
  ellipse(w-r*0.55, h, r, r);
  ellipse(w+r*0.55, h, r, r);

  fill(200, 0, 0);
  ellipse(w-r*0.33, h, r*0.6, r*0.6);
  ellipse(w+r*0.33, h, r*0.6, r*0.6);

  fill(0);
  ellipse(w-r*0.18, h, r*0.3, r*0.3);
  ellipse(w+r*0.18, h, r*0.3, r*0.3);

  fill(200, 0, 0);
  ellipse(w-r*0.1, h, r*0.15, r*0.15);
  ellipse(w+r*0.1, h, r*0.15, r*0.15);
}

