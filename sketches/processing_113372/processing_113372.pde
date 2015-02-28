
void setup(){
  size(900,900);
  rectMode(CENTER);
  background(0);
  doIt(width/2, 0, width/2);
}

void draw(){
}


void doIt(float x, float y, float d){
  if(d < 1){ return;}
  pushMatrix();
  noFill();
  stroke(250);
  translate(x, y);
  rect(0, 0, d, d);
  doIt(d/2, y, d/2);
  doIt(-d/2, y, d/2);
  doIt(0,d/2, d/2);
  popMatrix();
}
