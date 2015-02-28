
void setup(){
  size (500, 300);
  frameRate(24);
}

void draw(){
  background(#92A8FA);
  fill(136, mouseX, 20);
  beginShape();
  vertex(72,54);
  vertex(72,144);
  vertex(90,144);
  vertex(90,135);
  vertex(81,135);
  vertex(81,117);
  vertex(135,117);
  vertex(135,144);
  vertex(153,144);
  vertex(153,135);
  vertex(144,135);
  vertex(144,99);
  vertex(171,99);
  vertex(171,63);
  vertex(135,63);
  vertex(135,81);
  vertex(81,81);
  vertex(81,63);
  vertex(90,63);
  vertex(90,72);
  vertex(99,72);
  vertex(99,54);
  vertex(72,54);
  endShape(CLOSE);
  
  beginShape();
  vertex(162, 81);
  vertex(162, 90);
  vertex(172, 90);
  endShape();
  
  fill(0);
  rect(144,63,10, 20);
  ellipse(162, 72, 5, 5);
}
  


