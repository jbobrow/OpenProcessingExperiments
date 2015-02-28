
float a=1;
void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(52);
  noStroke();
  fill(232,105,86);
  pushMatrix();
  translate(width/2,height/2);
  rotate(a);
  rectMode(CENTER);
  rect(0,0,100,100);
  popMatrix();
  a=a+0.05;
  
}


