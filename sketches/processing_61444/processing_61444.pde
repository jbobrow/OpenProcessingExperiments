
void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(13);
  PFont font;
  font = loadFont ("Jokerman-Regular-48.vlw");
  textFont(font);
}
 
void draw(){
  translate(mouseX, mouseY);
  fill(#F79B0F,120);
  text("h",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F02E3E,120);
  text("o",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F74D0F,120);
  text("l",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F7740F,120);
  text("a",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F70F13,120);
  text("!",mouseX,random(0,250),mouseY,random(0,250));
  fill(#F7C90F,120);
  text("!",mouseX,random(0,250),mouseY,random(0,250));
  if (mousePressed == true){
    background(0);
  }
}
