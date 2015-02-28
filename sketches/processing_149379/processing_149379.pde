
int num= 6, sz = 45, off = 50;
float sz2=100, angle, theta, incr;
PVector[] loc = new PVector[num];

void setup() {
  size(400, 400);
  noStroke();
}

void draw() {
  background(255);
  float mv = map(sin(theta),-1,1,0,50);
  translate(width/2+mv,height/2+mv);
  angle = 0;
  for (int i=0; i<num; i++) {
    float radius = map(sin(theta), -1, 1, 35, 130);
    float sz2 = map(sin(theta),-1,1, 20,120);
    fill(#91A4B9);
    loc[i] = new PVector(sin(angle)*radius, cos(angle)*radius);
    ellipse(loc[i].x-off, loc[i].y-off, sz2, sz2);
    angle += (TWO_PI/num);
  }
  theta += .0523;
  fill(#E67F39);
  ellipse(-off,-off, sz, sz);  
}

