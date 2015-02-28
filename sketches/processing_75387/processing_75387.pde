
//Martin C, CP1, Mods 4-5
//Doubling Shapes

int numShapes;

void setup() {
  size(500, 500, P3D);
  rotateX(PI/3);
  background(0);
  noStroke();
  smooth();
  frameRate(1);
  numShapes = 1;
}

void draw() {
  background(0);
  lights();
  int x = 1;   
  while (x <= numShapes) {
    int tx = int(random(500));
    int ty = int(random(500));
    int tz = int(random(-250));
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int o = int(random(255, 256));
    int radius = int(random(25, 50));
    translate(tx, ty, tz);
    fill(r, g, b, o);
    sphere(radius);
    translate(-tx, -ty, -tz);
    x++;
  }
  numShapes = numShapes * 2;
  if (numShapes==1024) {
    numShapes=1;
  }
}
