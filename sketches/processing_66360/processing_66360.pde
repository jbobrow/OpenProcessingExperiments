
int myNum;

void setup() {
  smooth();
  size(500, 505);
  background(255);
  myNum = 0;
}

void draw() {

  stroke(255);
  for (int i = 0; i<20; i++) {
    myNum += 30;
    for (int y = 0; y < 20; y++) {
      fill(myNum, 200, 190);
      ellipse(y*30, myNum, 6, 6);
    }
  }
}


