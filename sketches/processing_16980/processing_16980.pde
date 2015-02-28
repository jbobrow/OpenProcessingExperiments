
//atom 1.0 by Evan White
int r=80;
void setup(){
size(500,500);
smooth();
}
void draw(){
  background(21,80,193);
  stroke(255);
  strokeWeight(10);
  line(mouseX,height/2,width/2,mouseY);
  noStroke();
  ellipse(mouseX,height/2,r,r);
  ellipse(width/2,mouseY,r,r);
}

