
void setup(){
  size(300,300);
  background(0);
}

void draw(){
  background(0);
  int h=hour();
  int m=minute();
  int s=second();
   fill(255,128,0);
  stroke(255,255,0);
  ellipse(h*13.0434783,h*13.0434783,30,30);
  fill(0,255,0);
  stroke(0,0,255);
  ellipse(m*5.08474576,m*5.08474576,30,30);
  fill(255,0,255);
  stroke(0,0,255);
  ellipse(s*5.08474576,s*5.08474576,30,30);
}
  

