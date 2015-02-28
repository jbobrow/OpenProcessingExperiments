
/*
**  SPATIAL CONFUSION
**  by Martin Melcher
*/

RotateLinie3D myLinie[] = new RotateLinie3D[200];
RotateLinie3D myLinie2[] = new RotateLinie3D[20];
RotateLinie3D myLinie3[] = new RotateLinie3D[200];

void setup() {
  size(720, 480, OPENGL); 
  background(0);
  fill(255);
  strokeWeight(5);
  frameRate(50);
  randomSeed(myLinie.length);
  smooth();

  for (int i = 1; i < myLinie.length; i++) {
    // Linie(float _xpos, float _ypos, float _breite, float _hoehe) {
    myLinie[i] = new RotateLinie3D(i*random(300), height, i*random(-500, 500), i*random(100), height-i*random(-100, 100), i*random(-500, 500), random(50));
  }
  for (int i = 1; i < myLinie2.length; i++) {
    // Linie(float _xpos, float _ypos, float _breite, float _hoehe) {
    myLinie2[i] = new RotateLinie3D(-i*random(300), -height, -i*random(-500, 500), -i*random(100), -height-i*random(-80, 160), -i*random(-500, 500), random(51));
  }
  for (int i = 1; i < myLinie3.length; i++) {
    // Linie(float _xpos, float _ypos, float _breite, float _hoehe) {
    myLinie3[i] = new RotateLinie3D(-i*random(300), -height, -i*random(-900, 300), -i*random(100), -height-i*random(-100, 300), -i*random(-300, 900), random(49));
  }
}
float rotX = 0;
float rotY = 0;

void draw() {
  background(0);
  stroke(255);
 
  pushMatrix();
  
    rotX = radians(frameCount)*0.7;
    rotY = radians(frameCount)*0.5;
  
  translate(0, -height/2, 500);
  

  rotateX(rotX);
  rotateY(rotY);

  for (int i=1; i < myLinie.length; i++) {
    myLinie[i].display();
    myLinie[i].update();
  }

  for (int i=1; i < myLinie2.length; i++) {
    myLinie2[i].display();
    myLinie2[i].update();
  }

  for (int i=1; i < myLinie3.length; i++) {
    myLinie3[i].display();
    myLinie3[i].update();
  }
  
  popMatrix();
}

void keyPressed() {
    if(keyCode == ENTER) {
     saveFrame("line-######.png");
    } 
}

class Linie3D {
  float xpos, _xpos, xpos2, _xpos2;
  float ypos, _ypos, ypos2, _ypos2;
  float zpos, _zpos, zpos2, _zpos2;

  Linie3D(float _xpos, float _ypos, float _zpos, float _xpos2, float _ypos2,  float _zpos2) {
    xpos = _xpos;
    xpos2 = _xpos2;
    ypos = _ypos;
    ypos2 = _ypos2;
    zpos = _zpos;
    zpos2 = _zpos2;
  }

  void display() {
    fill(255);
    line(xpos, ypos, zpos, xpos2, ypos2, zpos2);
  }
}

class RotateLinie3D extends Linie3D {
  float rota, _roat;
  float xpos3, _xpos3;
  float ypos3, _ypos3;

  RotateLinie3D(float xpos, float ypos, float zpos, float xpos2, float ypos2, float zpos2, float _rota) {
    super(xpos, ypos, zpos, xpos2, ypos2, zpos2);
    rota = _rota;
  } 

  void update() {

  }
}
