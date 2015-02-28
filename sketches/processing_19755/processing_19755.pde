
void setup(){
  size(250,250);
  background(0);
  smooth();
  frameRate(13);
  PFont font;
  font = loadFont ("UniversLTStd-BoldCn-40.vlw");
  textFont(font);
}

void draw(){
  translate(mouseX, mouseY);
  fill(#F79B0F,120);
  text("M",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F02E3E,120);
  text("3",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F74D0F,120);
  text("H",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F7740F,120);
  text("4",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F70F13,120);
  text("B",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F7C90F,120);
  text("3",mouseX,random(0,250),mouseY,random(0,250)); 
  if (mousePressed == true){
    background(0);
  }
}


