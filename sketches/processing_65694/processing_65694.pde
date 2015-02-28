
float d=20;

PImage backg;
void setup(){
  size(500,500);
  
  noFill();
  stroke(255);
  smooth();
  backg =loadImage("backg.jpg");
}
void draw(){
  background(backg);
  ellipse(mouseX,mouseY,d,d);
  if(mousePressed){
    d++;
  }
}
void mouseReleased(){
  loadPixels();
  backg.pixels=pixels;
  d=20;
}
  

