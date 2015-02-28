
color c1, c2, c3;

float angle = 0.0;
float scalar = 20;
float speed = 0.07;

void setup() {
  size(800, 400);
  smooth();
  c1 = color(101, 169, 245);
  c2 = color(249, 121, 184);
  c3 = color(219, 149, 239);
}

void draw () {
  background(255);
  float yone = sin(angle + .5) * scalar;
  robot(150, 200+yone*.5, c1);
  pushMatrix();
  translate(170,140);
  scale(.5);
  robot(425, 200+yone*3, c2);
  popMatrix();
  pushMatrix();
  translate(50,30);
  scale(.9);
  robot(700, 200+yone*1.2, c3);
  popMatrix();
}

void robot(int x, float yone, color c) {
  
  pushMatrix();
  translate(x, yone);
  noStroke();
  fill(c);
  ellipse(-30, -70, 130, 130);//head
  fill(255);
  rect(-70, -90, 30, 30);//eft eye
  rect(-15, -90, 30, 30);//right eye
  fill(0);
  ellipse(-60, -80, 8, 8);//left pupil
  ellipse(-5, -80, 8, 8);//right pupil
  stroke(0);
  strokeWeight(5);
  line(-120, -70, -97, -70);//left antenna
  line(36, -70, 59, -70);//right antenna
  line(-30, -3, -30, 15);//neck
  rect(-80,18, 100,70);//body
  strokeWeight(4);
  fill(100);
  ellipse(-70, 100,15, 15);//left wheel
  ellipse(10, 100, 15, 15);
  angle += speed;
  popMatrix();
  
}

