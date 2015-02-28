
void setup() {
  size(640, 480, P3D);
  frameRate(120);
  smooth();
}

int z = 0;
int mv = 500;

void draw() {
  background(0);
  noFill();
  strokeCap(ROUND);
  if (z > mv/2-3) {
    strokeWeight(20);
  }
  else {
    strokeWeight(1);
  }
  stroke(255);

  if (frameCount%mv < mv*0.5) {
    z = frameCount%mv;
  }
  else {
    z = mv - frameCount%mv;
  }

  translate(width/2, height/2, z);
  rotateY(0.25 * frameCount/mv);
  box(120, 180, 30);
}

