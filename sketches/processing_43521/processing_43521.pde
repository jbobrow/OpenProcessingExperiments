
PFont f;

void setup() {
  size(640,480);
  background(255);
  smooth();
  f=createFont("Verdana",160,true);
}

void mousePressed() {
  textFont(f);
  fill(0);
  textAlign(CENTER);
  text("Click",width/2,height/2+50);
}

void mouseReleased() {
  background(255);
}

void keyPressed() {
  textFont(f);
  fill(0);
  textAlign(CENTER);
  text("Tap",width/2,height/2+50);
}

void keyReleased() {
  background(255);
}
                                
