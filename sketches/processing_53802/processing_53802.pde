
import processing.pdf.*;

void setup(){
  size(400,500);
  background(230,250,255);
}

void draw(){
  //background(100,100,0);
  stroke(0,0,200,8);
  strokeWeight(random(3));
  line(mouseX,mouseY,200,mouseY);
}

 

