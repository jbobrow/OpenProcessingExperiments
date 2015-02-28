
int x = 120;
int y = 60;
int radius = 12;
int screenW = 240;
int screenH = 120;
boolean lastStateWasIn = false;
final float popRadius =  dist(0,0,screenW,screenH) / 2;
final int startRadius = 5;
int radiusBeforePop;

void setup() {
  size(screenW, screenH);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(204);
  float d = dist(mouseX, mouseY, x, y);
  if (d < radius) {
    radius +=3;
    lastStateWasIn = true;
  } else {
    if (lastStateWasIn) {
      radiusBeforePop = radius;
      lastStateWasIn = false;
    }
    textSize(map(radiusBeforePop, 5, popRadius, 5, 40));
    text(radiusBeforePop, 180, 110);
    radius--;
  }
  if ((radius <= startRadius) || (radius >= popRadius)) {
    radius = startRadius;
  } 
  float mappedColor = map(radius, startRadius, popRadius, 0, 255);
  fill(mappedColor, 0, 0, 255-mappedColor);  
  ellipse(x, y, radius, radius);
}
