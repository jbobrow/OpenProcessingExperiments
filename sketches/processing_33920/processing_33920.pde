
PImage notYou;


void setup(){
  size (504, 360);
  background (136, 238, 252); 
  smooth();
  frameRate (15);
  notYou = loadImage ("notYou.png");
  
}

void draw(){
  image (notYou, mouseX-5, mouseY+8, 118.5, 36);
}

