
void start() {
  size(200, 200);
}
void draw() {
  background(255);
  fill(200, 200, 200);
  //ears
  rect(105,50,15,15);
  rect(80,50,15,15);
  //hindpaws
  ellipse(100, 100, 50, 50);
  //forepaws
  ellipse(120, 120, 10, 20);
  ellipse(80, 120, 10, 20);
  //forearms
  ellipse(110, 115, 10, 35);
  ellipse(90, 115, 10, 35);
  //head
  ellipse(100, 65, 30, 30);
  //eyes
  fill(0,0,0);
  ellipse(95, 60, 2, 2);
  ellipse(105, 60, 2, 2);
  //nose
  fill(0, 0, 0);
  triangle(98, 65, 102, 65, 100, 67);
}



