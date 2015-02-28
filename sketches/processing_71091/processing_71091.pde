
void setup(){
  size(700,700);
  background(1);
  frameRate(60);
  smooth();
}
void draw(){
  ellipse(pmouseX,pmouseY,30,30);
  fill(0,0,255);
  ellipse(width-pmouseX,height-pmouseY,30,30);
  fill(255,204,0);
  ellipse(pmouseY,pmouseX,30,30);
  fill(255,0,0);
  ellipse(width-pmouseY,height-pmouseX,30,30);
  fill(102,204,0);
  noStroke();
  smooth();
}
void keyPressed() {
  background(1);
}

