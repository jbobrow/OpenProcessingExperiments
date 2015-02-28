

void setup() {
  size(700, 700);
  smooth();
}

void draw() {
  noStroke();

  background(40, 21, 72);

  //ufo
  fill(0);
  ellipse(350, 300, 300, 400);
  fill(135, 135, 142);
  rect(200, 300, 300, 200);
  triangle(500, 500, 500, 300, 700, 400);
  triangle(200, 500, 200, 300, 0, 400);
  fill(64, 6, 6);
  rect(200, 500, 300, 35);

  //ufo flame 
  frameRate(25);
  fill(random(255), random(255), random(255));
  rect(200, 535, 300, 100);
  triangle(150, 585, 200, 535, 200, 585);
  triangle(150, 635, 200, 585, 200, 635);
  triangle(500, 535, 500, 585, 550, 585);
  triangle(500, 585, 500, 635, 550, 635);
  triangle(200, 585, 500, 585, 350, 685);
}           
                                
