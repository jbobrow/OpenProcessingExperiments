
void setup()
{
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  color color_def = color(266, 81, 252);
  int rect_amt = 12;

  for (int y=0; y<rect_amt; y=y+1) {
    pushMatrix();
    translate(200, 200);
    rotate(radians(  30*y  ));
    fill(color_def);
    rect(0, 0, random(140, 190), random(20, 40), 300);
    popMatrix();
  }

  fill(color_def);
  noStroke();

  ellipse(200, 200, 175, 175);  // body

  fill(255);
  ellipse(200, 180, 70, 70);  // eye white

  fill(72, 176, 247);
  ellipse(200, 180, 45, 45);  // eye color

  fill(0);
  ellipse(200, 180, 30, 30); // pupil

  fill(255);
  ellipse(205, 175, 6, 6);  // eye reflection

  fill(241, 176, 255);
  pushMatrix();
  rotate(2.85);
  arc(-140, -290, 50, 55, -PI, 0); // mouth

  fill(255);
  rect(-165, -290, 50, 10);  // teeth
  popMatrix();

  pushMatrix();
  fill(181, 15, 138);
  rotate(-0.25);
  arc(153, 308, 25, 35, -PI, 0); // tongue
  ellipse(153, 308, 25, 6);  // tongue bottom curve
  popMatrix();
}



