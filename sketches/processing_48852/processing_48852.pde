
PFont font;

void setup() {
  size(400, 400);
  background(255);

  smooth();

  font = loadFont("font.vlw");
  textFont(font);

  frameRate(5);
}

void draw() {
  colorMode(RGB, 255, 255, 255);
  background(255);
  
  for (int i = 0; i < 350;i++) {
    candy(random(100, 300), random(120, 320));
  }
  stroke(0);
  strokeWeight(5);
  noFill();
  rect(90, 110, 220, 220);

  fill(24, 60, 90);
  rect(120, 80, 160, 30);
  
  fill(0, 100, 100, 170);
  textSize(60);
  text("CANDY",92,height/2+40);
}

void candy(float x, float y) {
  colorMode(HSB, 360, 100, 100);
  noStroke();
  fill(10*random(36), 100, 100, 100);
  ellipse(x, y, 20, 20);
}

