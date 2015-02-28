
size(500, 500);
background(250, 124, width);
smooth();

//For the Lines that begina at a certain point
for ( int a = 4; a <= 100; a += 8) {
  smooth();
  stroke(random(width), width, height);

  line(0, 50, 500, a);

  pushMatrix();
  translate(150, 150);
  line(0, 50, 500, a);
  popMatrix();

  pushMatrix();
  translate(300, 300);
  line(0, 50, 500, a);
  popMatrix();

  pushMatrix();
  translate(135, 135);
  line(0, 0, 0, 500);
  popMatrix();

  pushMatrix();
  translate(285, 285);
  line(0, 0, 0, 500);
  popMatrix();
}

//The change in the origin and primative
noStroke();
fill(4, 88, 150);
ellipse(50, 50, 20, 20);
ellipse(50, 250, 20, 20);

pushMatrix();
translate(75, 75);
rect(50, 50, 20, 20);
rect(50, 250, 20, 20);
popMatrix();

pushMatrix();
translate(150, 150);
ellipse(50, 50, 20, 20);
ellipse(50, 250, 20, 20);
popMatrix();


pushMatrix();
translate(225, 225);
rect(50, 50, 20, 20);
rect(50, 250, 20, 20);
popMatrix();

pushMatrix();
translate(300, 300);
ellipse(50, 50, 20, 20);
ellipse(50, 250, 20, 20);
popMatrix();


