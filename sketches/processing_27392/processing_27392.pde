
void setup(){
  size(300,300);
}

void draw(){
  int h=hour();
  int m=minute();
  int s=second();
  fill(h*11.086956,0,0);
  background(0);
  stroke(255,0,0);
  ellipse(h*13.0434783,h*13.0434783,30,30);
  stroke(255,255,0);
  fill(0,m*4.322033898,0);
  ellipse(m*5.08474576,m*5.08474576,30,30);
  stroke(0,0,255);
  fill(0,0,s*4.322033898);
  ellipse(s*5.08474576,s*5.08474576,30,30);
}

