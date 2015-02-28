
float angle = 0.0;
float white = 255;

void setup(){
  size(250,250);
  smooth();
  noStroke();
  background(#DCC9EA);
}
void draw(){
  angle=angle+0.02;
  translate(125,125);
  rotate(angle);
  stroke(white);
  noFill();
  ellipse(-50,-50,150,150);
}
void mouseDragged(){
  white -= 5;
}

