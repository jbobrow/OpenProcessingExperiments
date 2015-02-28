
PFont bomb, suicide;
String AJ = "M2M4H9";
float X, Y;
void setup() {
  size(250,250);
  background(#000000, 30);
  smooth();
  bomb = createFont("1", 50);
  suicide = createFont("1",50);
}
 
void draw() {
  fill(#000000, 20);
  rect(-5,-5,260,260);
  if (mousePressed) {
    textFont(bomb);
    fill(#FFFFFF);
    text(AJ,mouseX++,mouseY);
  //flashy texts
  }
 X = random(width);
 Y = random(height);
     textFont(suicide);
    fill(#FFFFFF);
    text(AJ,X,Y);
}


