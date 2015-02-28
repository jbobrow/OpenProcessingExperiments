
String thetext =  "abcdefghijklmnopqrstuvwxyz" 
+ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+ "1234567890";

PFont myFont;

void setup() {
  size(800, 500);
  smooth();
  myFont = loadFont("DINNeuzeitGrotesk-Light-36.vlw");
  textFont(myFont, 36);
}

void draw() {
  background(175, 250, 50);
  smooth();
  text("Die Freiheit des einzelnen hört dort auf wo die Freiheit es anderen beginnt."
+ "\n \nROSA LUXEMBURG", mouseX, 70, mouseY, 500);
  rect(mouseX, mouseY, 50,  500);
  noStroke();
}



void mousePressed() {
  fill(0, random(255), random(255), 100);
}

