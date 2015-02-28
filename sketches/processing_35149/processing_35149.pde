
void setup(){
  size(700,400);
  smooth();
  background(0);
  frameRate(30);
}

void draw(){
  stroke(mouseX,0,mouseY);
  float distance= dist(pmouseX,pmouseY,mouseX,mouseY);
  float maxStroke=15;
  strokeWeight(maxStroke-constrain(distance,0,maxStroke));
  line(pmouseX,pmouseY,mouseX,mouseY);
}

void mouseClicked(){
  rectMode(CENTER);
  fill(mouseY,255,mouseX);
  noStroke();
  rect(mouseX,mouseY,50,50);
}

void keyPressed(){
  background(0);
}
                
                
