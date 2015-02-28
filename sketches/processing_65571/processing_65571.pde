
int r = 250;
float t;

void setup() {
  size(300, 300);
  background(150);
  smooth();

  noStroke();
}

void draw() {
  background(150);
  translate(width/2, height/2);


  fill(0);
  ellipse(0, 0, r, r);

  fill(255);
  pushMatrix();
  rotate(-t+PI/2);
  arc(0, 0, r, r, 0, PI);
  popMatrix();

  fill(255);
  ellipse(-r/4*sin(t), -r/4*cos(t), r/2, r/2);
  fill(0);
  ellipse(r/4*sin(t), r/4*cos(t), r/2, r/2);

  fill(255);
  ellipse(r/4*sin(t), r/4*cos(t), r/8, r/8);
  fill(0);
  ellipse(-r/4*sin(t), -r/4*cos(t), r/8, r/8);

  t -= 0.05;
}


