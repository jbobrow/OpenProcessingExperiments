
//constellation creator
void setup(){
  size(600,200);
  smooth();
  frameRate(1);
  background(#000000);
  noCursor();
}

void draw(){
 noStroke();
 fill(#FFF48B);
  ellipse(mouseX,mouseY, 20,20);
 fill(#FFFFFF);
  ellipse(pmouseX,pmouseY,20,20);
  stroke(#FFFFFF);
  line(mouseX,mouseY,pmouseX,pmouseY);
  
}

void mousePressed(){
 background(#000000); 
}
