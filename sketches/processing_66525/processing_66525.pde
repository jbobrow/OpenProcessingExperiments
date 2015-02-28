
PImage colonial;

void setup(){
size(500,500);
colonial=loadImage("colonial.png");
}
void draw(){
  background(255);
  image(colonial,0,0);
  PFont f;
  f = loadFont("SansSerif-48.vlw");
  textFont (f,24);
  fill(0);
  if(mouseX<width/2 && mouseY<height/2){
    text("CHICKEN!!!",mouseX,mouseY);
}
  if(mouseX<width/2 && mouseY>height/2){
    text("CRISPY CHICKEN!",mouseX,mouseY);
}
  if(mouseX>width/2 && mouseY<height/2){
    text("GRILLED CHICKEN!",mouseX,mouseY);
}
  if(mouseX>width/2 && mouseY>height/2){
    text("BISCUITS!",mouseX,mouseY);
}
}


