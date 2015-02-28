
//define variables
float circleA = 400;
float circleB = 300;

void setup() {
  size(800,600);
  background(0);
  smooth();
}

void draw() {
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(circleA,circleB,50,50);
  ellipse(circleB,circleA,50,50);
  ellipse(circleA+50,circleB+50,50,50);
  ellipse(circleB+50,circleA+50,50,50);
  ellipse(circleA-50,circleB-50,50,50);
  ellipse(circleB-50,circleA-50,50,50);

  //reset circle values
  circleA=circleA+random(-5,5);
  circleB=circleB+random(-5,5);
}


