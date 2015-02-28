

void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {
  background(160);
  stroke(255);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
  
   
  if (mouseX >= 0 && mouseX <= width/2 && mouseY >= 0 && mouseY <= height/2) {
    rect(0,0, width/2, height/2);
    fill (255,188,3);
  } 
  else if (mouseX >= width/2 && mouseX <= width && mouseY >= 0 && mouseY <= height/2) {
    rect(width/2,0, width/2, height/2);
    fill (145,175,130);
  }
  else if (mouseX >= 0 && mouseX <= width/2 && mouseY >= height/2 && mouseY <= height) {
    rect(0, height/2, width/2, height/2);
    fill (45,100,125);
  }
  else if (mouseX >= width/2 && mouseX <= width && mouseY >= height/2 && mouseY <= height) {
    rect(width/2,height/2, width, height);
    fill (180,80,30);
  }
  else {
  }

} 




void keyPressed(){
  saveFrame("rollover.png");
}

