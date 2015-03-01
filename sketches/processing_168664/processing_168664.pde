
void setup(){
  size(600, 600);
}

void draw(){
  float my_angle = map(second(), 0, 1, 0, PI/2);
  float my_pos = map(second(), 0, 73, 0, 600);
  
  pushMatrix();
  translate(my_pos, height/2);
  rotate(my_angle+radians(45));
  rectMode(CENTER);
  noStroke();
  fill(0);
  rect(0,-5, 1000,10);
  fill(255);
  rect(0,5, 1000,10);
  popMatrix();
}
