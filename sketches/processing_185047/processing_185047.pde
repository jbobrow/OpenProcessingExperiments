
PImage img;
PImage img2;
void setup(){
  size(301,400);
  background(255);
  img=loadImage("Write.png");
  img2=loadImage("bg2.png");
    pushMatrix();
  image(img,0,0);
  image(img2,0,101);
  image(img2,0,202);
  image(img2,0,303);
  popMatrix();
}
void draw(){
  smooth();
  if (mousePressed){
    
      //ArabicCalligraphyBrush
  if (mouseButton==LEFT){
    strokeWeight(1);
    line(mouseX,mouseY,mouseX-10,mouseY+10);
    line(pmouseX,mouseY,pmouseX-10,pmouseY+10);
  }
  //Erase Tool
    if (mouseButton==RIGHT){
      stroke(255);
      strokeWeight(10);
        line(mouseX,mouseY,mouseX-20,mouseY-20);
    line(pmouseX,mouseY,pmouseX-20,pmouseY-20);
  }
  }
}


