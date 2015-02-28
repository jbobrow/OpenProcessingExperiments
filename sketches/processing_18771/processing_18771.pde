
float angle = 0.0;

void setup() {
  size(250,250);
  smooth();
  noStroke();
  background(#CE1CD8);
}
void draw(){
  fill(255,3);
  rect(0,0,width,height);
  stroke(255);
  angle = angle + 0.02;
  translate(125,125);
  rotate(angle);
  line(10,100,20,100);
  line(10,30,10,100);
}
  


