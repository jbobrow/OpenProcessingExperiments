
void setup(){
size(300,300);
  fill(0,102);
  smooth();
  
}

void draw(){
  float weight=dist(mouseX,mouseY,pmouseX,pmouseY);
 
  
  strokeWeight(255);
  ellipse(mouseX,mouseY,pmouseX,pmouseY);

  {
    stroke(150);
  strokeWeight(0.25);
  rect(mouseX,mouseY,pmouseX,pmouseY,10,10);
}

 stroke(255);
  line (mouseX,mouseY,10,10); 
}

