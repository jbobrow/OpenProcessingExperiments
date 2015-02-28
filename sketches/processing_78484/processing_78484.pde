
float x;
float y;
float x1;
float y1;

void setup() {
  size(500,500);
  noStroke();
  background(0);
}

void draw() { 
}

void keyPressed() {
  x=random(0,500);
  y=random(0,500);
  x1=random(1,200);
  y1=random(1,200);
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    background(0);
  } 
  else { 
    fill(255,255,255,keyIndex);
    ellipse(x,y,x1,x1);
  }
}
