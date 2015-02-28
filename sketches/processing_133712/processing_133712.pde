
void setup() {
  size(400,400);
  background(255);
  smooth();
}

void draw() {
  //background(255);
  for (int i=0; i<400; i+=1) {
    circles(i,i);
  }
  strokeWeight(3);
  stroke(0);
  float r=random(400);
  float f=random(400);
  line(200,0,r,f);
}
void circles(int x, int y) {
  noStroke();
  float r=random(255);
  fill(r,x,y,r);
  ellipse(200,y,x,20);
}
