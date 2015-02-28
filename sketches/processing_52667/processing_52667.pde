
float radius = 600;

void setup() {
  size(600, 600);
  // background(0);
  background(12, 11, 66);
  smooth();
  noStroke();

  //big circles
  pushMatrix();
  translate(width/2, height/2);
  //yellow circle
  fill(241, 226, 97);
  ellipse(0, 0, radius+200, radius+200);
  //golden circle
  fill(248, 193, 0);
  ellipse(0, 0, radius+100, radius+100);
  //orange circle
  fill(255, 132, 0);
  ellipse(0, 0, radius, radius);
  //red circle
  fill(224, 58, 0);
  ellipse(0, 0, radius - 100, radius - 100);
  //smaller red circle
  fill(180, 0, 47);
  ellipse(0, 0, radius - 200, radius - 200);

  // fill(0);
  //middle circle circle
  fill(12, 11, 66);
  ellipse(0, 0, radius/3, radius/3);

  //cresent moon
  stroke(2);
  fill(248, 247, 189);
  ellipse(0, 0, radius/4, radius/4);
  //fill(0);
  fill(12, 11, 66);
  ellipse(10, -10, radius/5, radius/5);

  //hexagons around middle circle
  createSun();
  noStroke();

  //ring of octagons
  createOctRing();

  //outer circle ring 
  circleRing();

  //outer black circles 
  outerCircRing();
}


