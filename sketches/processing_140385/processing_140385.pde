
int s = 10;

void setup() {
  size(400 - s*3, 400);
  background(255);
  noLoop();

  stroke(100,50);
}

void draw() {
  background(255);

  for (int i = 0; i < height/s;i++) {
    for (int j = 0; j < width/s;j++) {
      if (i % 4 == 0) {
        if (j % 4 == 1) {
          fill(255);
        }
        else {
          fill(0);
        }
      }
      else if (i % 4 == 1) {
        if (j % 4 == 0) {
          fill(255);
        }
        else {
          fill(0);
        }
      }
      else if (i % 4 == 2) {
        if (j % 4 == 3) {
          fill(0);
        }
        else {
          fill(255);
        }
      }
      else {
        if (j % 4 == 2) {
          fill(0);
        }
        else {
          fill(255);
        }
      }
      sankaku(j*s, i*s, 0);
    }
  }



  for (int p = 0; p < height/s;p++) {
    for (int q = 0; q < width/s;q++) {
      if (p % 4 == 0) {
        if (q % 4 == 0) {
          fill(0);
        }
        else {
          fill(255);
        }
      }
      else if (p % 4 == 1) {
        if (q % 4 == 1) {
          fill(255);
        }
        else {
          fill(0);
        }
      }
      else if (p % 4 == 2) {
        if (q % 4 == 2) {
          fill(255);
        }
        else {
          fill(0);
        }
      }
      else {
        if (q % 4 == 3) {
          fill(0);
        }
        else {
          fill(255);
        }
      }
      sankaku(q*s, p*s, 1);
    }
  }
}

void sankaku(int x, int y, int k) {
  pushMatrix();
  translate(x, y);
  rotate(radians(180*k));
  beginShape();
  vertex(0, 0);
  vertex(s, 0);
  vertex(0, s);
  endShape(CLOSE);
  popMatrix();
}



