
float x, y;
float angle;
float r = 200;

float diff = 1;

void setup() {

  size(600, 600);
  background(0);
}


void draw() {

  x= r*cos(angle);
  y= r*sin(angle);


  noFill();
  stroke(random(255), random(255), random(255));
  strokeWeight(0.3);
  translate(300, 300);
  rotate(r*0.1);
  ellipse(width/2, height/2, x, y);
  ellipse(width/3, height/3, x, y);
  ellipse(x, y, 20, 20);

  angle = angle+0.1;
  r = r-0.1;
}
