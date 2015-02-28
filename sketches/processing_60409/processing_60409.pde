

float y = 0.0;

void setup() {
  size(270, 150);
  smooth();
  fill(#F7AC87);
}

void draw() {
  background(#957D64);
  frameRate(150);
    for (int x = 40; x <= 110; x += 5) {
      stroke(#FCF3D9);
      strokeWeight(1);
      line(0, x, width, x);
    }
    for (int z = 0; z < 40; z += 5) {
      stroke(#A5A4CB);
      line(0, z, width, z);
    }
    for (int a = 115; a < height; a += 5) {
       stroke(#A5A4CB);
      line(0, a, width, a);
    }
  strokeWeight(1);
  stroke(#F7AC87);
  ellipse(y, 75, 70, 70);
  y += 0.5;
  if (y > 300) {
    y = -30.0;
  }
}


