
import processing.video.*;

PImage backimg;

int mouseMovement;
boolean drawing = false;

void setup() {
  size(600, 400);

  smooth();
  
  backimg = loadImage("adv2.jpg");
  image(backimg,0,0);
 
frameRate(30);
//speed (increase to make it faster)
}

void draw() {
//beginning animation -> loop

    
mouseMovement = abs(mouseX-pmouseX);
  stroke(#ffffff,100);
  fill(#ffffff,100);
  strokeWeight(1);
  
ellipse(random(pmouseX),random(pmouseY),15,15);
//size of CIRCLEsssss
  
}
//-----------------------------------

  void mousePressed () {
  drawing = false; {
  }
  
  save("_snowfall.png");
  
}

 void keyRelease() {
   
    if (key == DELETE || key == BACKSPACE);
 
  }





