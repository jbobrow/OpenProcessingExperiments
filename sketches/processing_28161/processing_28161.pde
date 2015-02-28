
float lineWeight = 80;
float lineHue = 186;
float lineSaturation = 89;
float lineBrightness = 100;
float lineAlpha = 20;



void setup() {
  size(screen.width,screen.height);
  background(255);
  colorMode(HSB);
  frameRate(60);
}

void draw() {
  stroke(lineHue, lineSaturation, lineBrightness, lineAlpha);
  strokeWeight(mouseX/5);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

