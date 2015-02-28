
void setup(){
  size(450,275);
  smooth();
  strokeWeight(20);
  frameRate(32);
}

void draw(){
  background(240,204,0);
  fill(113,mouseX,32);
  beginShape(); 
  vertex(250,180);
  vertex(280,125);
  vertex(135,70);
  vertex(110,60);
  endShape(CLOSE);
  
  ellipse(180,60,210,210);
  ellipse(165,130,140,140);
  endShape(CLOSE);
  
  line(30,65,380,90);
}
