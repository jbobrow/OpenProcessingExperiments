
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

PFont f;

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  frameRate(1);
  f = loadFont("Arial-Black-240.vlw");
  textFont(f);
  
}

void draw() {
  background(#325A7D);

  fill(255);
  
  for (int i=15; i<width; i+=20){
    for (int j=15; j<height; j+=20){
      pushMatrix();
      translate(i, j);
      rotate(random(TWO_PI));
      fill(random(255));
      textSize(random(40));
      textAlign(CENTER,CENTER);
      text(minute(), 0, 0);
      popMatrix();
    }
  }
  
  pushMatrix();
  rotate(-radians(15));
  fill(255,220);
  textSize(900);
  textAlign(CENTER,CENTER);
  text(second(), width/2, height/2);
  popMatrix();
  
  pushMatrix();
  rotate(radians(15));
  fill(255);
  textSize(400);
  textAlign(CENTER,CENTER);
  text(hour(), width/2, height/2);
  popMatrix();
}



