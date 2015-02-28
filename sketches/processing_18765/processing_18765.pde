
float angle = 0.0;

void setup() {
  size(250,250);
  smooth();
  noStroke();
}

  void draw(){
    
  fill(0,12);
  rect(0,0,width,height);
 stroke(255);
  angle = angle + 0.05;
  translate(125,125);
  rotate(angle);
  
  stroke(#B958FF);
  ellipse(mouseX, 20, pmouseX, 80);
  
  }
  


