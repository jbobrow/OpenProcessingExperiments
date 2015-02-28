
Drops[] drops;
int dropNum = 300;
float Y2 = -1000;

//-----------------------------------------
class Drops {
  float x, y, z, dy;
  float destX, destY, destZ;
  void reset(){
    destX = x = random(-25, 25);
    destZ = z = random(-25, 25);
    dy = random(1, 5);
    y = random(Y2, 0);
    destY = Y2;
  }
  Drops (){ reset(); }
  void update() {
    pushMatrix();
    stroke(50, 50, 100, 50);
    fill(150, 150, 200, 50);
    translate(x, y, z);
    box(3);
    popMatrix();
    y -= dy;
    if (y <= destY) reset();
  }
}

void setup(){
  size(640, 384, P3D);
  frameRate(20);
  drops = new Drops[dropNum];
  for (int i = 0; i < dropNum; i++) drops[i] = new Drops();
}

void draw(){
  background(255);
  translate(width/2, height-100);
  for (int i = 0; i < dropNum; i++) drops[i].update();
}

