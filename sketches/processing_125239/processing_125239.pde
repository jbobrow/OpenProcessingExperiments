
float ang;
int l;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  noFill();
  stroke(255);
  int l = int(random(100, 250));
  float ang = random(PI*2);
  line (cos(ang)*l+width/2, sin(ang)*l+height/2, width/2, height/2);
  ellipse(cos(ang)*l+width/2, sin(ang)*l+height/2, 10, 10);
}

