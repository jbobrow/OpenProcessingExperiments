
void setup(){
  size(500,500);
  background(0);
}
void draw(){
  float braw = random(0,500);
  float man = random(0,500);
  float cray = random(0,255);
  stroke(cray,0,240);
  line(braw,man,braw,man);
  fill(cray,0,200);
  ellipse(10,10,braw,man);
}
