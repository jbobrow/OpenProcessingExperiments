
import processing.opengl.*;
void setup(){
  size(400,400);
  background(0);
}
void draw(){

fill(0,10);rect(0,0,width,height);


 if (mousePressed) {
   fill(200,150,50);
   rect(mouseX,mouseY,20,20);
 }
  
}

