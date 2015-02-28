
void setup() {
  size(400,400);
}

void draw() {
  float act = (getMouseActivity());
  ellipse(width/2,height/2,act,act);
}

float getMouseActivity() {
  float activity = 0;
  float activeX = abs(pmouseX-mouseX);
  float activeY = abs(pmouseY-mouseY);
  activity = activeX+activeY;
  return activity;
}

