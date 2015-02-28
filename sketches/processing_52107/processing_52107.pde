
void setup(){
  size(450,450);
  smooth();
  stroke(0,102);
  background(255);
}
  
void draw(){
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  stroke(2,mouseY,mouseX,102);
  line(mouseX,mouseY, pmouseX, pmouseY);
  
fill(255);
stroke(255);
  if(mousePressed == true) {
    ellipse(mouseX,mouseY,30,30);
}
}    
