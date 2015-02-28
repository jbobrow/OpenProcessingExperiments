
//import processing.pdf.*;

int x1 = 0;
int y1 = 0;
int spacing = 50;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

void draw() {
  for (int j = 0; j<=500; j = j + spacing) {
    for (int i = 0; i<=500; i = i + spacing) {
      for (int k = 0; k<=25; k = k+6) {
        rect(x1+i, y1+j, 45, 45);
        fill(70, 255, 244);
        rect(x1+i, y1+j, 35, 35);
        fill(#270E9B-j/3);
        ellipse(x1+i, y1+i, 20, 20);
        ellipse (500-i, y1+i, 20, 20);
      }
    }
  }
  //exit();
}


