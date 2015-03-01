
// import processing.serial.*;
// Serial myPort;


float distance;
float rotate;



Box[] boxs = new Box[10];

//Level[] platform = new Level[20];


void setup() {
  size(1000, 700, P3D);
  for (int i = 0; i<boxs.length; i++) {
    boxs[i] = new Box(188, 62, 0);
  }
  smooth();
}

void draw() {
  //  frameRate(20);
  //  background(0);
  pushMatrix();

  popMatrix();
  pushMatrix();
  translate(0, 0, -1511);
  fill(0, 100);
  rect(-1251, -891, 3592, 2654);
  popMatrix();
  translate(195, 605, -443);
  rotateX(0.9);

  lights();

  pushMatrix();
  translate(258, -147, -35);
  rotateX(4.2);
  rotateY(14.0);
  rotateZ(1.4);
  for (int i = 0; i<boxs.length; i++) {
    boxs[i].grid();
    boxs[i].render();
  }
  popMatrix();
}
class Box {
  float x;
  float y;
  float z;
  float tx, ty;
  float n;
  Box(int xPos, int yPos, int zPos) {
    x = xPos;
    y = yPos;
    z = zPos;
    tx = 0;
    ty = 10000;
    
  }

  void grid() {

    translate(x+23, y+-5, z+-50);
    rotateX(x);
    rotateY(y);
    rotateZ(x);
    pushMatrix();
    fill(235, 171, 138);

    rotateX(x);
    rotateY(y);
    rotateZ(n);
    n += .05 ;

    // for (int i = 0; i<9; i++) {
    //    for (int t = 0; t<9; t++) {

    //    translate(21, 0, 0);
    box(9, 153, 864);
    popMatrix();
  }
  void render() {
    x = map(noise(tx), 0, 1, 0, -1);
    y = map(noise(ty), 0, 1, 0, -1);
    tx += .01;
    ty += .01;
  }
}


