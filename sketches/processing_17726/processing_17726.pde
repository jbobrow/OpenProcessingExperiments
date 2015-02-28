
import processing.opengl.*;
float a, b, c, oldMouseX, oldMouseY;
boolean rotation = false, zRotation = false;

void setup() {
  size(600,600, OPENGL);
  background(150);
  smooth();
  drawBlocks();
}

void draw() {
  background(150);
  drawBlocks();
  Rotate();
}

void mousePressed() {
  rotation = true;
  oldMouseX=mouseX;
  oldMouseY=mouseY;
}

void mouseReleased() {
  rotation = false;
}
void keyPressed() {
  if (key==' ') {
    zRotation=true;
  }
}
void keyReleased() {
  switch(key) {
  case '1':
    a=-1;
    b=0;
    c=0;
    break;
  case '2':
    a=0.85;
    b=0;
    c=0;
    break;
  case '3':
    a=-6.25;
    b=-2;
    c=-14.13;
    break;
  case '4':
    a=-6.25;
    b=-5.2;
    c=-14.13;
    break;
  case '5':
    a=0.01;
    b=-2;
    c=0;
    break;
  case '6':
    a=0.01;
    b=1;
    c=0;
    break;
  case ' ':
    zRotation = false;
    break;
  default:
    a=0;
    b=0;
    c=0;
    break;
  }
}

void Rotate() {
  if (rotation) {
    if(zRotation) {
      c+=(mouseY-oldMouseY)*0.01;
      oldMouseY=mouseY;
    }
    else {
      a+=(mouseX-oldMouseX)*0.01;
      b+=(mouseY-oldMouseY)*0.01;
      oldMouseX=mouseX;
      oldMouseY=mouseY;
    }
  }
}

void drawBlocks() {
  fill(#43740a);
  int z = 50;
  translate(300, 300, 0); 
  rotateY(a);
  rotateX(b);
  rotateZ(c);
  box(0);

  for (int i=1; i<4; i++) {
    translate(-25,z,0);
        text("waarde", 125-i*25, 0);
        text("tekst", -140+i*25, 0);
    box(200-z*i,50,50);
    if(i>1) {
      fill(#29371f);
    }
  }
  fill(#43740a);
  translate(50,-100,0);
  for (int i=0; i<3; i++) {
    translate(25,-z,0);
    text("waarde", 125+i*25, 0);
                text("tekst", -140-i*25, 0);
    box(200+z*i,50,50);
    if(i>-1) {
      fill(#88bb1c);
    }
  }
}


