
// Emily Dayton

float x, y, w, h, c1, c2, c3;

void setup() {
  size (500, 500);
  smooth ();
  background (255);
  frameRate (8);

}



void draw() {
  x = random (width) ;
  y = random (height);
  w = random (50, 100);
  h = w;

  drawLantern (x, y, w, h);
  drawFlame (x, y, w, h, c1, c2, c3);
}

void drawLantern (float x, float y, float w, float h) {
  noStroke ();
  fill (0);

  beginShape ();
  vertex (x + w* 13/50, y + h);
  vertex (x + w* 37/50, y + h);
  vertex (x + w* 9/10, y + h* 2/5);
  vertex (x + w, y + h* 2/5);
  vertex (x + w/2, y);
  vertex (x, y + h* 2/5);
  vertex (x + w* 1/10, y + h* 2/5);
  endShape (CLOSE);
}


void drawFlame (float x, float y, float w, float h, float c1, float c2, float c3) {
  noStroke ();


  fill (c1, c2, c3);
  quad ((x + w* 3/10), (y + h* 9/10), (x + w* 7/10), (y + h* 9/10), (x + w* 7/10), (y + h* 5/10), (x + w* 3/10), (y + h* 5/10));
}

void mousePressed () {
  c1 = random (0, 255);
  c2 = random (0, 255);
  c3 = random (0, 255);

  drawFlame (x, y, w, h, c1, c2, c3);
}

void keyPressed () {
  background (255);
}


