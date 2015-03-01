
PFont font;
void setup(){
  size(500,500);
//  font=loadFont("CooperBlackStd-48.vlw");
  noStroke();
}
void draw(){
  fill(0);
  rect(0,0,width,height);
  fill(random(mouseX),random(mouseY),50);
  //textFont(font);
  text("banana",random(pmouseX),random(pmouseY));
}


