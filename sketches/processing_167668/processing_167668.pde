
/* @pjs font="RotisSansSerifStd-ExtraBold.ttf"; */

PFont f;

void setup() {
  size(400, 400);
//  f = loadFont("RotisSansSerifStd-ExtraBold-48.vlw");
  f = createFont("RotisSansSerifStd-ExtraBold",48);
  textFont(f);
  textAlign(CENTER);
  fill(200,200,100);
  frameRate(20);
}

void draw() {
  background(20);
  translate(200,200);
  text("jumpy", (sin(mouseX*0.07)*20), (cos(mouseY*0.07))*20);
}


