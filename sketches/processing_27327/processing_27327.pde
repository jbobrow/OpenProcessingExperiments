
PFont font;


void setup() {
  size(300,300);
  frameRate();
  smooth();
  font = createFont("Arial Bold",48);
}

void draw() {
  background(100);
  // oversampled fonts tend to look better
  textFont(font,36);
  // white float frameRate
  fill(255);
  text(frameRate,20,20);
  // gray int frameRate display:
  fill(200);
  text(int(frameRate),20,60);
}
