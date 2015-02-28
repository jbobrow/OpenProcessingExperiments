
import netscape.javascript.*;


Mover mover;
    PImage b;
    float inercia = 5500;
 
void setup() {
  size(900,600);
  b = loadImage("logo.png");
  smooth();
  background(255);
  mover = new Mover();
   
}
  
void draw() {
  noStroke();
  fill(0,100);
  rect(0,0,width,height);
  
    
  mover.update();
  mover.checkEdges();
  mover.display();

   
}


