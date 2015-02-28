
PFont font;
float x = 150;
float y = 150;

void setup(){
  size(300, 300);
  smooth();
  background(255);
  font = loadFont("HelveticaNeue-Bold-48.vlw");
  textFont(font);
}

void draw() {
  frameRate(2);
  fill(0, 0, 0, 40);
  textSize(random(3, 66));
  text("H9X 2E6", random(y), random(x));
}

void keyPressed() {
  background(255);
  if (key == CODED) {
    if (keyCode == UP) {
      x += -15;
    } 
    if (keyCode == DOWN) {
      x += 15;
    }
    if (keyCode == RIGHT) {
      y += 15;
    } 
    if (keyCode == LEFT) {
      y += -15;
    } 
  } 
}

