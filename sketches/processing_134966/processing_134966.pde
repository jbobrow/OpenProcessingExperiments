
void setup () {
  size(600, 400);
  frameRate(24);
}

void draw() {
  background(255);
  fill (random(0,255),random(0,255),random(0,255));
  line( width/2,0, width/2,height);
  line(0,height/2, width,height/2);
  //&&, ||
  if (mouseX < width/2) {
    if (mouseY < height/2) {
      rect(0, 0, width/2, height/2);
    }else {
      rect(0, height/2, width/2, height/2);
    }
  }else {
    if (mouseY < height/2) {
      rect(width/2, 0, width/2, height/2);
    }else {
      rect(width/2, height/2, width/2, height/2);
    }
  }
}

