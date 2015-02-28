
int rectWidth;
int rectHeight;


   
void setup() {
  size(320, 240);
  noStroke();
  background(0);
  rectWidth = width/2;
  rectHeight = height/4;
}

void draw() { 
  text("L", 160, 125);{
    fill(75);
}
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'L' && key <= 'L') {
    keyIndex = key - 'L';
  } else if (key >= 'l' && key <= 'l') {
    keyIndex = key - 'l';
  }
  if (keyIndex == -1) {
    background(0);
  } else { 
    fill(millis() % 255);
    float x = map(keyIndex, 0, 25, 0, height - rectHeight);
    rect(x, 0, width, height);
  }
}


