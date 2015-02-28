
float x = 10;
PFont font;
String txt = "appare";
String txt2 = "scompare";

void setup(){
  size(400, 150);
  font = createFont("Courier");
  textFont(font);
  textSize(40);  
}

void draw(){
  background(255);
  textSize(50);
  fill(0);
  text(txt, x + 30, 35, x, 70);
  x = x +0.2;
  text(txt2, x, 70, 250 -x, 70);
  x = x +0.3; 
}
