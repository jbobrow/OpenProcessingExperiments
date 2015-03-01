
int rectWidth;

void setup() {
  size(640, 360);
  noStroke();
  background(0);


  String s = "TYPE YOUR NAME...";
  fill (255);
  text(s, width/2, height/2, 300, 150);
}
void draw() {
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z'|| key == ' ') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z'|| key == ' ') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    background(0);
  } else {
    fill(millis()%255, 200, 15);
    float x = random(0, width);
    rect(x, 0, 100, height);

    textSize(50);
    fill(0);
    text(key, x, width/2, height/2);
  }

  if (key == ' ') {
    fill(10, millis()%255, millis()%255);
    float x = random(0, width);
    rect(x, 0, 100, height);
  }
}


