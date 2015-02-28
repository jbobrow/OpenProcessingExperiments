

void setup() {
  size(400, 400);
}
  
void draw() {
  background(25);
  //stroke(255);
  //strokeWeight(15);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
   
    
  if (mouseX >= 0 && mouseX <= width/2 && mouseY >= 0 && mouseY <= height/2) {
    rect(0,0, width/2, height/2);
    fill (155,216,5);
  }
  else if (mouseX >= width/2 && mouseX <= width && mouseY >= 0 && mouseY <= height/2) {
    rect(width/2,0, width/2, height/2);
    fill (255,133,34);
  }
  else if (mouseX >= 0 && mouseX <= width/2 && mouseY >= height/2 && mouseY <= height) {
    rect(0, height/2, width/2, height/2);
    fill (175,127,191);
  }
  else if (mouseX >= width/2 && mouseX <= width && mouseY >= height/2 && mouseY <= height) {
    rect(width/2,height/2, width/2, height/2);
    fill (255,0,28);
  }
  else {
  }
 
}

 void mouseReleased(){
  saveFrame("smile.png");
}

