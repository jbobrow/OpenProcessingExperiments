
void setup(){
  size(500,300);
  frameRate(60);
}

void draw (){
  background(#765D08);
  fill(136,mouseX,mouseY);
  beginShape();
  vertex(144,144);
  vertex(171,144);
  vertex(171,135);
  vertex(153,135);
  vertex(171,81);
  vertex(207,135);
  vertex(180,135);
  vertex(180,144);
  vertex(216,144);
  vertex(207,153);
  vertex(153,153);
  endShape(CLOSE);
  
  rect(162,117,10,10);
  rect(180,117,10,10);

}


