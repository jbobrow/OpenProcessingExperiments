
void setup() {
  size(200, 200);
  smooth();
}
  
void draw() {
  background(0);
  stroke(255);
  strokeWeight(10);
  line(0, height/2, width, height/2);
  line(width/2, 0, width/2, height);
   
   //farben/mouseover:
    
  if (mouseX >= 0 && mouseX <= width/2 && mouseY >= 0 && mouseY <= height/2) {
    rect(0,0, width/2, height/2);
    fill (255,0,0);
  }
  else if (mouseX >= width/2 && mouseX <= width && mouseY >= 0 && mouseY <= height/2) {
    rect(width/2,0, width/2, height/2);
    fill (0,255,0);
  }
  else if (mouseX >= 0 && mouseX <= width/2 && mouseY >= height/2 && mouseY <= height) {
    rect(0, height/2, width/2, height/2);
    fill (0,0,255);
  }
  else if (mouseX >= width/2 && mouseX <= width && mouseY >= height/2 && mouseY <= height) {
    rect(width/2,height/2, width, height);
    fill (255);
  }
  else {
  }
 
}
 
 
 
 
void keyPressed(){
  saveFrame("rollover.png");
}


