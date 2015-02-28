
float angle;

void setup() {

  size(500, 500, P3D);
  background(255);
  strokeWeight(2);
  stroke(0);
  smooth();
  frameRate(30);
}

void draw() {

  background(255);

  angle = angle + 0.00001;

  translate(100, height/2);

  for (int x = 0; x < 300; x  = x + 2) {
    for (int y = 0; y < 150; y = y + 3) {

      rotateX(angle);

      point(x, y);
    }
  }
}


