
void setup(){
  size(400,400);
  smooth();
  background(255);
  frameRate(50);
}
 
void draw(){
  stroke(mouseX, 141, mouseY);
  float distance =dist(pmouseX,pmouseY,mouseX,mouseY);
  float maxStroke=50;
  strokeWeight(maxStroke-constrain(distance,0,maxStroke));
  line(pmouseX,pmouseY,mouseX,mouseY);
}
void mouseClicked(){
  rectMode(CENTER);
  fill(mouseY,236,mouseX);
  noStroke();
}

void keyPressed(){
  background(255);
}


                
                
