
PFont typo;
String quote="C'est la vie";

void setup(){
  size(640,480);
}

void draw(){
  background(102);
  fill(205,0,0);
  textSize(36);
  text(quote,mouseX,mouseY*1.25,500,480);
}

