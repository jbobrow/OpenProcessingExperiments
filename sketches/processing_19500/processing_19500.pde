
PFont font;
float x1 = 0;
 
void setup(){
  size(250, 250);
  font = loadFont("BodoniMT-48.vlw");
  textFont(font);
  smooth();
  fill(253, 255, 0);
}
void draw(){
  background(100, 0, 100);
  text("M2J 2H3", x1, 50);
  text("M2J 2H3", x1, 100);
  text("M2J 2H3", x1, 150);

 
  frameRate(150);
  x1 += 0.75;
  if (x1 > width) {
      x1 = -150;
  }
}


