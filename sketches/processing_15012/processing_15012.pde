
PFont f;
PFont f2;

void setup() {
  size(400, 400);
   smooth();
  background (255);
  f = loadFont("CenturyGothic-100.vlw");
  f2 = loadFont("CenturyGothic-20.vlw");
}
void draw() {
  if(!mousePressed) {
    background(250);
    textFont(f2);
    fill (0);
    text("Click and drag",10,20);
  }
  else {
    float ratio = ((float)mouseY)/((float)height);
    if (ratio>1.0) ratio=1.0;
    else if (ratio<0.0) ratio=0.0;
    color c1 = color(255, 0, 255);
    color c2 = color (255, 255, 0);
    color x = lerpColor(c1, c2, ratio);
    fill(x);
    ellipse(mouseX,mouseY, 100,100);
  }
  textFont(f);
  fill (255,255,255,10);
  text("Hello\nWorld",10,270);
}


