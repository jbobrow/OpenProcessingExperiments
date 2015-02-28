
import ddf.minim.*;
import peasy.*;
PeasyCam cam;

Minim minim;
AudioInput audioInput;

float lineWidth = 2;
float rotateaa  = 0;


void setup() {

  background(255);
  frameRate(30);
  size(400,400,P3D);
  minim = new Minim(this);
  minim.debugOn();
 cam = new PeasyCam(this, 0,0, 0, 500);

  audioInput = minim.getLineIn(minim.MONO);
}

void draw() {


 background(0);
  strokeWeight(2);
  stroke(128,128,128,128);
  
  doshit();
  
   
  
}


void doshit(){
  for(int y = 0; y < height ; y+=20){
    noFill();
    beginShape();
  for(int i = 0; i <=width; i++) {

    vertex(i,y,200+audioInput.right.get(i)*1000);
  }
  endShape();
  }
}


void keyPressed() {
  switch (keyCode) {
    case(UP): 
    lineWidth+=0.1;
    break;
    case(DOWN):
    if (lineWidth >= 1) {
      lineWidth-=0.1;
    }
    break;
  }
}


