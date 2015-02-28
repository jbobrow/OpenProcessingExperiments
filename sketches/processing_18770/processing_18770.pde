
float angle = 0.0;

void setup() {
  size(200,200);
  smooth();
  noStroke();
  background(#CE1CD8);
}
void draw(){
  fill(255,3);
  rect(0,0,width,height);
  stroke(255);
  angle = angle + 0.02;
  translate(100,100);
  rotate(angle);
  line(10,100,20,100);
  line(10,30,10,100);
}
  


