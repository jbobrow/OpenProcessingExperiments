
float d=250.0;
float speed=1.0;
int direction=1;
void setup(){
  size(500,500);
  smooth();
  noStroke();
  fill(255,204);
}
void draw(){
  background(0);
  ellipse(0,250,d,d);
  ellipse(500,250,d,d);
  ellipse(500,0,d,d);
  ellipse(500,500,d,d);
    ellipse(0,500,d,d);
  ellipse(0,0,d,d);

  d+=speed*direction;
  if ((d>width)||(d<width/10)){
    direction=-direction;
  }
}



