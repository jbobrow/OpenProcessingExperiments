
void setup() {
  size(300, 300);
  background(237, 26, 26);
}
void draw() {


  if (mousePressed) {
    fill(51, 240, 15);
    ellipse(30, 30, 30, 30);
    ellipse(70, 30, 30, 30);
    fill(255);
    ellipse(50, 50, 50, 50);
    fill(15, 240, 208);
    ellipse(42, 42, 8, 8);
    ellipse(58, 42, 8, 8);
    fill(235, 15, 240);
    rect(45, 60, 10, 10);
    fill(7, 21, 245);
    rect(38, 75, 25, 25);
    fill(0);
    line(10, 70, 90, 90);
  }
  else { 
    fill(0);
    ellipse(30, 30, 30, 30);
    ellipse(70, 30, 30, 30);
    fill(255);
    ellipse(50, 50, 50, 50);
    fill(0);
    ellipse(42, 42, 8, 8);
    ellipse(58, 42, 8, 8);
    rect(38, 75, 25, 25);
    line(10, 70, 90, 90);
    rect(40, 60, 20, 10);
  }
}


