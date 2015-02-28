

void setup() {
  size(600, 400);
  noStroke();
  background(millis()%255, random(255), random(255));
 
}

void draw() { 
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    background(millis()%255, random(255), random(255));
  } else { 
    fill(random(255), random(255), random(255));
    float x = map(keyIndex, 0, 25, 0, width);
    rect(x, random(400), random(50), random(50));
  }
}


