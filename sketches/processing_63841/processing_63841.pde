
float links = -60;
float rechts = 30;
float angle = 40;


void setup() {
  size(700,600);
  smooth();
}

void draw() {

  background (150);
  
  strokeWeight(2);

  line(338, 380, 336, 393);
  line(362, 380, 364, 393);

  pushMatrix();
  translate(385,260);
  rotate(radians(angle));
  ellipse(-3, -13, 25, 40);
  popMatrix();
  pushMatrix();
  translate(325,252);
  rotate(radians(-angle));
  ellipse(-8, -16, 25, 40);
  popMatrix();
  
  ellipse(350, 305, 80, 160);
  
  angle = random(25,80);
  
  line(317, 152, 350, 200);
  ellipse(317, 152, 10, 10);
  line(383, 152, 350, 200);
  ellipse(383, 152, 10, 10);

  ellipse(350, 200, 70, 70);

  strokeWeight(8);
  point(366, 192);
  point(334, 192);
  strokeWeight(3);
  line(338, 215, 362, 215);

}

