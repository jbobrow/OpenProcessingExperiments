
void setup(){
  size(500,500);
  background(255);
}

int value = 0;

void draw() {
  fill(value);
  rect(25, 25, 50, 50);
  rect(85, 85, 50, 50);
  rect(145, 145, 50, 50);
  rect(215, 205, 50, 50);
  rect(425, 25, 50, 50);
  rect(355, 85, 50, 50);
  rect(285, 145, 50, 50);
}

void mouseClicked() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

