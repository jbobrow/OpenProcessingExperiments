
void Setup(){
  size(500,300);
  frameRate(24);
}
void draw(){
  background(#70abd6);
  fill(136,mouseX,20);
  beginShape();
  vertex(72,28);
  vertex(72,81);
  vertex(81,80);
  vertex(81,72);
  vertex(91,72);
  vertex(90,90);
  vertex(98,90);
  vertex(98,72);
  vertex(108,72);
  vertex(108,81);
  vertex(117,81);
  vertex(117,72);
  vertex(125,72);
  vertex(125,90);
  vertex(135,90);
  vertex(135,28);
  endShape(CLOSE);
 
  rect(81,36,10,20);
  rect(117,36,10,20);
}


