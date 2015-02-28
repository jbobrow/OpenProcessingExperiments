
import processing.opengl.*;
import peasy.*;
import shapes3d.*;


PeasyCam cam;
Box head;
double rotX, rotY;

int swid, shei;
void setup() {
  //set cam
  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(500);
  size(640, 480, OPENGL);
  //set box
  head = new Box(this);
  String[] faces = new String[] {
    "front.jpg", "back.jpg", "right.jpg", 
    "left.jpg", "bottom.jpg", "top.jpg"
  };
  head.setTextures(faces);
  head.setSize(100, 100, 100);
  head.drawMode(Shape3D.TEXTURE | Shape3D.WIRE);
  rotX = 0;
  rotY = 0;
}
void draw() {
  background(255);
  head.draw();
  //butFront.display();
  cam.rotateY(rotY);
  cam.rotateX(rotX);
}
void keyPressed() {
  if (key == ' ') {
    cam.reset();
    rotX = 0;
    rotY = 0;
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      rotY = rotY + 0.01;
    }
    if (keyCode == RIGHT) {
      rotY = rotY - 0.01;
    }
    if (keyCode == UP) {
      rotX = rotX + 0.01;
    }
    if (keyCode == DOWN) {
      rotX = rotX - 0.01;
    }
  }
}


