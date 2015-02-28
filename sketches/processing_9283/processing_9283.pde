
import processing.opengl.*;

PFont fontA;
float a;
int c=0;
float o=100;
float f=1;
void setup() {
  size(screen.width, screen.height, P3D);
  background(102);
  smooth();
  fontA = loadFont("DialogInput-48.vlw");
  textFont(fontA, 32);
}

void draw() {
  fill(0, 0, 0, o);
  textAlign(CENTER);
  translate(mouseX, mouseY);
  rotate(a);
 // rotateY(a);
  text("art", 0, 0);
  a +=.03;
  if(c==1000){
    c=0;
  }
  c=c+1;
  o=o-f;
  if(o==0){
    f=f*-1;
  }
  if(o==100){
    f=f*-1;
  }
  if(keyPressed==true){
    if(key=='s'){
      save("fun.tif");
    }
    if(key=='c'){
      background(102);
    }
  }
}

