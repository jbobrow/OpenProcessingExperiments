
float angle = 0.0;
float d = 5.0;
float speed = 1.0;
int direction = 1;

void setup() {
  size(600,600);
  smooth();
  noStroke();
  fill(155, 104);
}

void draw() {
  fill(0,12);
  rect(0,0,width,height);
   fill(60, 105, 200, 60);
  //fill(255, 200, 40, 150);
  angle = angle + 0.02;
  translate(270, 240);
  rotate(angle);
  rect(-30, -30, 60, 60);
    ellipse(10, 50, d/2, d/2);
  ellipse(150, 50, d/3, d/4);
  ellipse(50, 0, d/2, d/5);
  //ellipse(50, 100, d, d);
  d += speed * direction;
  if (( d> width) || (d < width/100)) {
  direction = -direction;
  }
}



