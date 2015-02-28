
int rectx=200;
int recty=150;
int rectw=50;
int recth=20;
PFont font10;

void setup(){
  
  font10 = loadFont("Ebrima-10.vlw");
  size(600,480);
}

void draw(){
  rectMode(CENTER);
  fill(6,203,27);
  rect(rectx, recty, rectw, recth);{
  fill(0);
  textFont(font10);
  text("BUTTON", rectx, recty+5, rectw, recth);
  textAlign(CENTER);
  }
}


