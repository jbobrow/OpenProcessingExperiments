


float slices = 50;
float orgX, orgY, theta;
int min = 100, max = 350;

void setup() {
  size(500, 500);
  background(255);
  orgX = width/2;
  orgY = height/2;
  strokeCap(SQUARE);
}


void draw() {

  background(255);

  for (int i=0; i<slices;i++) {
    float unit = TWO_PI/slices;
    if (i%2==0) {
      noFill();

      stroke(#480D4A);
      float sz = map(sin((i*unit+theta)), -1, 1, min, max);
      strokeWeight(sz/5);
      arc(orgX-25, orgY-25, sz, sz, i*unit, (i+1)*unit);

      float sz2 = map(sin((i*unit-theta)), -1, 1, max, min);
      strokeWeight(sz2/5);
      stroke(#BB1C60);
      arc(orgX+25, orgY+25, sz2, sz2, i*unit, (i+1)*unit);
    }
  }

  theta += 0.0523;
}

