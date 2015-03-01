
int a=0;
void setup () {
  size(400,400);
}
void draw () {
  background(255);
  translate(width/2, height/2);
  rotate(radians(a));
  noStroke();
  fill(255,115,0);
  ellipse(0,0,400,300);
  a=a+3;
}
