
void setup() {
  size(600, 500, P3D);
  background(200);
  smooth();
  rectMode(CENTER);

  frameRate(15);
}

void draw() {
  background(200);

  int ri = (int)random(6.99999);
  int rj = (int)random(8.99999);

  translate(width/2, height/2);

  pushMatrix();
  rotateX(radians(70));
  stroke(0);
  strokeWeight(5);
  for (int i = 0;i < 7; i++) {
    for (int j = 0;j < 9;j++) {
      if (i == ri && j == rj) {
        fill(0, 255, 0);
      }
      else {
        fill(255);
      }
      rect(-width/4+ i * 50, -100 + j * 50, 50, 50);
    }
  }

  popMatrix();

  strokeWeight(2);
  line(-138, -250, -138, -35);
  line(138, -250, 138, -35);
}

