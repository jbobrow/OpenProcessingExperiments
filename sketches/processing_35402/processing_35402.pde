

void setup(){
  size (500,500);
  smooth();
  frameRate(20);
  background(30,200,153);
}


void draw(){
  noStroke();
  fill(random(255), random(255), random(255), 5);
  beginShape();
  vertex(random(500),random(500));
  bezierVertex(400, 30, 90, 50, 450, 10);
  bezierVertex(pmouseX, 19, 50, pmouseY, mouseX, mouseY);
  endShape();
}

void mousePressed(){
  background (random(255), random(255), random(255));
}
                
                
