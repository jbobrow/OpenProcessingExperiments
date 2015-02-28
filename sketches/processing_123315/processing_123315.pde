
//Global Variables
int viewX;
int viewY;
PImage Picture5;

import ddf.minim.*;

Minim minim;
AudioSample sonido2;

void setup (){
  minim=new Minim (this);
  sonido2=minim.loadSample("sonido2.mp3");
 

 { 
  size(800,600);
  background(#FFFFFF);
  Picture5=loadImage ("Picture5.jpg");
}

} 


void draw() {
  if(mousePressed){
colorMode(HSB, width, height, 100);
 viewX = mouseX+3;
 viewY = mouseY+3;
for(int gridY = 0;gridY < height;gridY+=viewY){
  for(int gridX = 0;gridX < width;gridX+=viewX){
    stroke(gridX, gridY, viewX, viewY);
    strokeWeight(1);
       arc(400, 300, viewX, viewY,1.57,7.85);
       image(Picture5,200,150,400,300);
}
} 
}
}

void keyPressed() {
if (key == DELETE||key == BACKSPACE) background (#FFFFFF); 
if (key=='s'||key=='S')saveFrame("Assignment 3.png");
if (key=='b')sonido2.trigger();
if (key=='b')println("sample triggered");

}


