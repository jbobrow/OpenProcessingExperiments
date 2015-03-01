
int numrects = 200;
int randomfactor = 50;

int[][] coords = new int[numrects][4];
int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(500, 500);
  background(0);

  smooth();
  noStroke();
  mouseReleased();
}

void draw() {
}

void mouseReleased() {
  r = floor(random(randomfactor)) + 100;
  g = r + floor(random(-20, 20));
  b = r + floor(random(-20, 20));
  background(240, 240, 244);
  for (int i = 0; i < numrects; i++) {
    pushMatrix();
    for (int k = 0; k < 4; k++) {
      if (i == 0 || k == 0) {
        coords[i][k] = floor(random(width));
      } else {
        if (coords[i-1][k] > 200) {
          coords[i][k] = coords[i-1][k] / (floor(random(randomfactor))+1);
        } else {
          coords[i][k] = coords[i-1][k] * floor(random(randomfactor))*2;
        }
      }
      println(i + "-" + k + " = " + coords[i][k]);
    }
    if (floor(random(numrects)) < 5) {
      noStroke();
      fill(255,120);
      ellipse(250, 250, 150, 150);
    }
    stroke(r, g, b, random(randomfactor*randomfactor)+50);
    strokeCap(SQUARE);
    strokeWeight(floor(random(randomfactor))+1);
    rotate(radians(floor(random(randomfactor))));
    line(coords[i][0], coords[i][1], coords[i][2], coords[i][3]);
    popMatrix();
  }

  println(randomfactor + " :: " + r + " " + g + " " + b);
}

