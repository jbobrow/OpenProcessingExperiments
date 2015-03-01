
/* @pjs font="ACaslon-AltBold.ttf"; */

PFont font;
String s = "Swaying";
float angle = 0.0;
void setup() {
  size(600, 400);
  font = createFont("ACaslon-AltBold",48); 
  textFont(font, 24);
  fill(0);
}
void draw() {
  background(204);
  angle += 0.1;
  for (int i=0;i<s.length();i++){
  float c= sin(angle+i/PI);
  textSize((c+1.0)*32+10);
  text(s.charAt(i),100+i*60,200);
  }
}



