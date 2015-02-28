
PFont font;
float angle = 0.0;
int lastTime = 0;

void setup() {
  size(1000, 1000);
  smooth();
  font = loadFont("FuturaLT-48.vlw");
  textFont(font);
  frameRate(30);
}

void draw() {
  background(255);
  fill(0);
  textSize(45);
  textAlign(CENTER);
  text("BYETONE SOM SITTKONSERT", width/2, height/2);
  
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  arc(0, 0, 600, 600, 0, PI+HALF_PI);
  angle += 0.1;
  popMatrix();
  
  stroke(0);
  strokeWeight(100);
  strokeCap(SQUARE);
  noFill();
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  arc(0, 0, 900, 900, PI, TWO_PI+HALF_PI);
  angle += 0.1;
  popMatrix();
  
  fill(0, 100);
  if (millis() - lastTime >= 500) {
    textSize(150);
    text("kränkt", random(1000), random(1000));
    lastTime = millis();
  }
}


