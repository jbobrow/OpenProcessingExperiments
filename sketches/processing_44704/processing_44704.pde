
void setup(){
size(300,300);
  fill(0,102);
  smooth();
  
}

void draw(){
  float weight=dist(mouseX,mouseY,pmouseX,pmouseY);
  
  strokeWeight(0.1);
  triangle(mouseX,mouseY,pmouseX,pmouseY,90,90);

  stroke(255);
  strokeWeight(0.25);
  ellipse(mouseX,mouseY,pmouseX,pmouseY);
 
}

