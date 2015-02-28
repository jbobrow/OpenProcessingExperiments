

int xPos;
int yPos;
PFont police;
int x;
int y;
int couleur;
int mode=2;

float rot_x = 0.0;
float rot_z = 0.0;

void setup() {
  size(600, 600, P3D);
  smooth();
  stroke(0);
  police = loadFont ("ARCENA-48.vlw");
}

void draw() {

  background(255);
  if (mode==0){
    writo();
  }
  else if (mode==1){
    cube();
  }
  else {
    textFont (police, 30);
  text("select a mode with left/right button", width/5, height/2);
  fill(0);
  }
    
}

void writo()
{

  background(0);
  x = int(random(600));
  y = int(random(600));
  fill (255);
}

void cube()
{
  translate (width/2, height/2);
  rotateX(rot_x);
  rotateZ(rot_z);
  fill(0, 150, 50, 75);
  box(200, 200, 200);
  fill(0, 150, 90, 75);
  box(300, 300, 300);
  fill(0, 150, 120, 75);
  box (400, 400, 400);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    mode=0;
  } 
  else if (mouseButton == RIGHT) {
    mode=1;
  }
}

void keyPressed() {
  textFont (police, 50);
  text(key, x, y);
}

void mouseMoved() {
  float reduire = 0.01;
  rot_x += (pmouseY-mouseY) * reduire;
  rot_z += (mouseX-pmouseX) * reduire;
}


