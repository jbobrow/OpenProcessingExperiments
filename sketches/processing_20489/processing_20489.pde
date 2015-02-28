
PFont font;
float x = 170;
float y = 200;
 
void setup(){
  size(250, 250);
  smooth();
  background(0);
  font = loadFont("Gulim-48.vlw");
  textFont(font);
}
 
void draw() {
  frameRate(3);
  fill(155, 40, 199, 100);
  textSize(random(3, 80));
  text("L1W 3Z2", random(y), random(x));
}


