
void setup(){
  size(500,500);
  background(24,24,24);
  smooth();
}

void draw(){
  strokeWeight(1);
  stroke((sq(mouseX/2)),0,0,40);
  strokeJoin(ROUND);
  noFill();
  beginShape();
  vertex(mouseX,mouseY);
  bezierVertex(mouseX*2,mouseY*3,  mouseX,mouseY,  490,490);
  endShape();

  println(mouseX + ", " + mouseY);
}


