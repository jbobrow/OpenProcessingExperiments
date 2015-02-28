
void setup(){
  background(0);
  rectMode(CENTER);
  size(300,300);
}

void draw(){
  int h=hour();
  int m=minute();
  int s=second();
  fill(h*11.086956,0,0);
  rect(150,50,300,100);
  fill(0,m*4.322033898,0);
  rect(150,150,300,100);
  fill(0,0,s*4.322033898);
  rect(150,250,300,100);
}

