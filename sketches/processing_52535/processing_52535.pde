
float cx,
      cy,
      rw,
      rh;

void clear() {
  background(255);
  cx = width/2;
  cy = height/4 * 3.5;
  rw = 32;
  rh = 8;
}

void setup() {
  size(500, 500, P3D);
  background(255);
  smooth();
  frameRate(30);

  clear();
}

void draw() {
  rw += noise(0.5);

  if(mouseX < width/3) {
    cx -= noise(0.3);
  } else if(mouseX > width/3 * 2) {
    cx += noise(0.3);
  }

  if(mouseY < height/2) {
    cy -= 1.0;
  } else {
    cy -= 0.1;
  }

  noFill();
  stroke(200, 90);
  ellipse(cx, cy, rw, rh);

  if(cy < height/5) { clear(); };
}

void mousePressed() {
  clear();
}

