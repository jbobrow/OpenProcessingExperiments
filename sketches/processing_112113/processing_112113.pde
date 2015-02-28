
// hello world, 2013/09/25
// Stella Wang, Tainan

void setup() {
  size(500, 360);
  background(220);
}

void draw() {
  smooth();

  strokeWeight(1.5);
  rectMode (CENTER);
  rect(280, 220, 80, 80);
  rect(280, 220, 60, 60);
  rect(284, 224, 35, 35);
  rect(286, 226, 20, 20);
  rect(288, 228, 10, 10);


  ellipseMode(CORNER);
  ellipse(280, 220, 100, 100);
  ellipse(300, 240, 70, 70);


  ellipse(355, 295, 30, 30);


  strokeWeight(0.8);
  line(60, 0, 540, 480);
}

