
int rectWidth;
   
void setup() {
  size(640, 360);
  noStroke();
  background(0);
  rectWidth = width/4;
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
}

void keyPressed() {
  int KeyPosition = -1;
  if (key == 'R' || key == 'r') {
    KeyPosition = 0;
    fill(255, 0, 0);
  }
  else if (key == 'G' || key == 'g') {
    KeyPosition = 13;
    fill(0, 255, 0);
  }
  else if (key == 'B' || key == 'b') {
    KeyPosition = 26;
    fill(0, 0, 255);
  }
  
  if (KeyPosition != -1) {
    background(0);
    float x = map(KeyPosition, 0, 26, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
  else{
    background(0);
  }
}
