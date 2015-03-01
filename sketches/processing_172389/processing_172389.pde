
/* @pjs font="ARubricaCnBold.ttf"; */

PFont font;
String s="Aiweiwei";

void setup(){
  size(600,400);
  font=createFont("ARubricaCnBold",48);
  textFont(font);
  fill(0);
  frameRate(30);
}

void draw(){
  fill(204,24);
  rect(0,0,width,height);
  fill(0);
  text(s,random(-100,600),random(20,380));
}


