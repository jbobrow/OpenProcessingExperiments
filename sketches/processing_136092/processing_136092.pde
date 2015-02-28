
void setup(){
  size(400,400);
  background(0);
  smooth();
}

void draw(){
  if(mousePressed){
    stroke(255, 0, 0);
    strokeWeight(10);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  if(keyPressed){
    fill(0, 255, 0);
    stroke(0, 255, 0);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

