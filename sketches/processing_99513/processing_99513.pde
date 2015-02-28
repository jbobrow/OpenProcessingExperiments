
int appear = 5000;
int range = 10000;
int distance = 20000;
int wide = 0;
int high = 0;
int forwardspeed = 20;

void setup() {
  size(1600, 900, P3D);
  background(0); 
  beginCamera();
}

void draw() {
  wide += (mouseX - (width / 2)) / 10;
  high += (mouseY - (height / 2)) / 10;
  background(0);
  camera(width/2.0 + wide, height/2.0 + high, distance - (frameCount * forwardspeed), width/2.0, height / 2, 0, 0, 1, 0);
  fill(255); 
  stroke(255);
  randomSeed(0);

  for (int t = 0; t < distance * 5; t++) {
    int x = int(random(-range, range));
    int y = int(random(-range, range));
    int z = int(random(0, distance));
    if ((z < distance - (frameCount * forwardspeed)) && (z > distance - (frameCount * forwardspeed) - appear)) {
      point(x, y, z);
    }
  }

  println(frameCount);
  // println(((height/2.0) / tan(PI*30.0 / 180.0)) - (frameCount));
}



