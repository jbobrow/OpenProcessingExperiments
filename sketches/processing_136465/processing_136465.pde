
/*
Jenny Hsu
 Benjamin Bacon
 Creative Computing Section B
 27 February 2014
 */

void setup() {
  size(800, 800);
  background(255); 
  smooth();
}

void draw() {
  // random colored rec
  fill(random(0, 255), random(0, 255), random(0, 255));
  noStroke();
  rect(50, 50, 700, 700);

  fill(255);
  rect(75, 75, 650, 650);

  // random colored circle
  fill(random(0, 255), random(0, 255), random(0, 255));
  noStroke();
  ellipse(400, 400, 600, 600);

  //  fill(255);
  //  ellipse(400, 400, 550, 550);

  // cursor
  fill(random(0, 255), random(0, 255), random(0, 255));
  //  int x = round(map(mouseX, 400, 0, width, 100));
  //  int y = round(map(mouseY, 400, 0, height, 100));
  ellipse(mouseX, mouseY, 200, 200);
}



