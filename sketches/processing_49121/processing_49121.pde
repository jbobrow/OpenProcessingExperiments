
//Michelle Frappier
//ART 479
//Christian Schmidt
//Critter 1

float x = 300;
float y = 250;
float w = 22;
float h = 66;
float eyeSize = 12;

float r;

void setup() {
  size(640, 480);
  frameRate(30);
  smooth();
  
  rectMode(CENTER);
  ellipseMode(CENTER);
}

//Quiggle Body
void draw() {
  r = random(255);
  
  background(0);
  fill(r, 211, 53);
  rect(mouseX, mouseY, w, h);
  rect(mouseX + 34, mouseY, w, h);

//Quiggle Eyes
  fill(237, 176, 7);
  ellipse(mouseX + 7, mouseY - 50, eyeSize, eyeSize);
  ellipse(mouseX + 28, mouseY - 50, eyeSize, eyeSize);

//Quiggle Legs
  stroke(0);
  fill(237, 126, 7);
  rect(mouseX + 10, mouseY + 51, w/8, h/4);
  rect(mouseX + 25, mouseY + 51, w/8, h/4);
  }

