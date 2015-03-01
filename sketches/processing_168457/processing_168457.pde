
int numrects = 12;
int randomfactor = 5;

int[][] coords = new int[numrects][4];
int r = 0;
int g = 0;
int b = 0;

void setup() {
  size(500, 500);
  background(255);

  smooth();
  noStroke();
  
  mouseReleased()

}

void draw() {
}


void mouseReleased() {
  r = floor(random(randomfactor)) + 60;
  g = r + floor(random(-20, 20));
  b = r + floor(random(-20, 20));
  background(240,240,244);
  fill(r, g, b);
  for (int i = 0; i < numrects; i++) {
    pushMatrix();
    for (int k = 0; k < 4; k++) {
      if (i == 0 || k == 0) {
        coords[i][k] = floor(random(width*0.66));
      } else {
        if (coords[i-1][k] > 200) {
          coords[i][k] = coords[i-1][k] / (floor(random(randomfactor*3))+1);
        } else {
          coords[i][k] = coords[i-1][k] + floor(random(randomfactor*3));
        }
      }
      println(i + "-" + k + " = " + coords[i][k]);
    }
    rotate(radians(floor(random(randomfactor))));
    rect(coords[i][0], coords[i][1], coords[i][2], coords[i][3]);
    popMatrix();
  }

  println(randomfactor + " :: " + r + " " + g + " " + b);
}

