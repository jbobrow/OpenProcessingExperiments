
void setup () {
  size(255, 255);
  background(255);
  colorMode(HSB);
  boolean s = true;
}

void draw () {
  boolean s = true;
  int c = 0;
  for (int y=255; y>=0; y=y-1) {
    if (c>=0) {
      c=c+1;
      stroke(mouseX, mouseY, c);
      line(0, y, 255, y);
    }
  }
  if (mousePressed == true) {
    if (s=true) {
      noLoop();
      s = false;
    }
    else {
      loop();
      s = true;
    }
  }
}

void mouseClicked () {
  boolean s = false;
    loop();
    s = true;
  
}
