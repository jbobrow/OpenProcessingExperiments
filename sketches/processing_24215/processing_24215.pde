
final color colour = color(66, 113, 250);
final int patternCount = 6;

void setup() {
  size(500, 1000);
  background(255);
  stroke(colour);
  smooth();
  noLoop();
}

void draw() {
  int i = 0;
  while (i < 3) {
    int j = 0;
    while (j < 6) {
      int rand = (int) random(patternCount);
      if (rand == 0) {
        p1(90 + i * 160, 100 + j * 160);
      } else if (rand == 1) {
        p2(90 + i * 160, 100 + j * 160);
      } else if (rand == 2) {
        p3(90 + i * 160, 100 + j * 160);
      } else if (rand == 3) {
        p4(90 + i * 160, 100 + j * 160);
      } else if (rand == 4) {
        p5(90 + i * 160, 100 + j * 160);
      } else if (rand == 5) {
        p6(90 + i * 160, 100 + j * 160); 
      }
      j = j + 1;
    }
    i = i + 1;
  }
}

void p1(int x, int y) {
  noFill();
  strokeWeight(10);
  ellipse(x, y, 130, 130);
}

void p2(int x, int y) {
  noFill();
  strokeWeight(20);
  ellipse(x, y, 130, 130);
  fill(colour);
  ellipse(x, y, 75, 75);
}

void p3(int x, int y) {
  noFill();
  strokeWeight(40);
  ellipse(x, y, 100, 100);
  strokeWeight(1);
  fill(colour);
  ellipse(x, y, 50, 50);
}

void p4(int x, int y) {
  noFill();
  strokeWeight(2);
  ellipse(x, y, 80, 80);  
  ellipse(x, y, 120,120);
  ellipse(x, y, 50, 50);
  ellipse(x, y, 140, 140);
  strokeWeight(20);
  ellipse(x, y, 100, 100);
 
}

void p5(int x, int y) {
  noFill();
  strokeWeight(50);
  ellipse(x, y, 80, 80);
  
}

void p6(int x, int y){
  noFill();
  strokeWeight(40);
  ellipse(x, y, 100, 100);
  ellipse(x, y, 10, 10);

}
  

