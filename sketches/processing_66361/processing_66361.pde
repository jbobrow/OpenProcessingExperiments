
int myNum;

void setup() {
  smooth();
  size(500, 505);
  background(255);
  strokeWeight(1);
  myNum = -35;
}

void draw() {
  for (int i = 0; i<20; i++) {
    myNum += 30;
    for (int y = 0; y < 40; y++) {
      noFill();
      stroke(220, 150, myNum);
      rect(myNum,y*30,25,25);
    }
  }
}


