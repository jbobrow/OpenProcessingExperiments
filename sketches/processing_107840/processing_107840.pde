
import fullscreen.*;

FullScreen fs;

void setup () {
  size (1280,960);
  background(0,0,0);
  frameRate(20);
  
  fs = new FullScreen(this);
  fs.enter();
  
  frameRate(120);
}
void draw () {
  if(keyPressed== true) {stroke(255);}
  if(keyPressed== false) {stroke(0);}
  
  fill(random(255), random(255), random(255), random(255));
  rect(random(1280), random(960), random(50), random(50));
  fill(random(255), random(255), random(255), random(255));
  rect(random(1280), random(960), random(50), random(50)); 
  fill(0,0,0, random(1000));
  stroke(0);
  rect(random(1280), random(960), random(50), random(50));
  
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fill(255,255,255);
      stroke(0);
      rect(mouseX, mouseY, random(50), random(50));
    }
    if(mouseButton == RIGHT) {
      fill(0,0,0);
      stroke(255);
      rect(mouseX-25, mouseY-25, random(50), random(50));
    }
  }
}


