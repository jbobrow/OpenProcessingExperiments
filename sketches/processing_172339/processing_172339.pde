
void setup () {
  size(500,500);
  background(255);
}
void draw () {
  float hazza = random(0,500);
  float luke = random(0,500);
  float ashton = random(0,255);
  stroke(ashton,198,180);
  line(hazza,luke,30,30);
  fill(ashton,luke,hazza);
  ellipse(luke,hazza,30,30);
  fill(202,179,200);
  ellipse(30,30,30,30);
}
