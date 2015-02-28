
void setup(){
  size(510,510);
  background(random(0,255));
  smooth();
}

void draw(){
  
  if(mousePressed){
    color(mouseX/2, mouseY/2, (mouseX+mouseY)/2);
    stroke(mouseX/2, mouseY/2, (mouseX+mouseY)/2);
  
    strokeWeight(random(5,20));
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  if(keyPressed){
    color(mouseY/2, (mouseX+mouseY)/2, mouseX/2);
    stroke(mouseY/2, (mouseX+mouseY)/2, mouseX/2);
  
    strokeWeight(random(10,30));
    ellipse(mouseX, mouseY, 1, 1);
  }
}
