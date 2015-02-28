
float bx;
float by;
float boxSize = 50;
float xOffset = 0;
float yOffset = 0;
boolean overBox = false;
boolean locked = false;
float b = 0;

void setup() {
  background(0);
  size(300, 300);
  bx = width/2;
  by = height/2;
  rectMode(RADIUS);
  noStroke();
  smooth();
}

void draw() {
  fill(bx, by, b); ellipse(bx, by, boxSize, boxSize);
  if(mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
       overBox = true;
       if(!locked) {
         noStroke();
       }
       } else {
         overBox = false;
         stroke(0);
       }
  //fill(0, 0, 0, 20);
  //rect(0, 0, 600, 400);
  if(keyPressed) {
    if(key == 'b')  {
    b = (b+3) % 255;
  }
  if(keyPressed) {
    if(key == 'B')  {
    b = (b-3) % 255;
     }
    if(key == 'c') {
      background(0);
      bx = width/2;
      by = height/2;
    }
    if(key == CODED) {
      if(keyCode == UP) {
      boxSize = boxSize+2 % height/2;
        }
      if(keyCode == DOWN) {
        boxSize = (boxSize-2) % height/2;
        if(boxSize < 10) {
          boxSize = 10;
        }
    }
  }
  }
}
}


void mousePressed() {
  if(overBox) {
    locked = true;
  } else {
    locked = false;
  }
  xOffset = mouseX-bx;
  yOffset = mouseY-by;
}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset;
    by = mouseY-yOffset;
}
}

void mouseReleased() {
  locked = false;
}
