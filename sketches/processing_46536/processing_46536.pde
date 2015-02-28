
import processing.opengl.*;



void setup() {

  size(600,600, OPENGL);
  background(0);
  noStroke();
}

void draw() {
   background(0);
  //ellipse(mouseX,mouseY,30,30); 
  lights();
  translate(mouseX, mouseY, (mouseX+1)/(mouseY+1));
  if (mouseX > width/2){
     fill(0,255,0); 
  }
  sphere(40);
  fill(255,255,255);
  

}

