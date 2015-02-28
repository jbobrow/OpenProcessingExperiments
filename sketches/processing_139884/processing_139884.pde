
void setup() {
  size(400, 400);
  stroke(5);
  noCursor();
}

void draw() {
  background(255);
 
  if (mousePressed) {
    background(255, 0, 0);
    fill(255);
    ellipse(mouseX, mouseY, 120, 120);
   
    
    strokeWeight(7);
    
    //Base of the monster.
    ellipse(mouseX-10, mouseY, 30, 30);
    
    //Eyes "widen."
    ellipse(mouseX+10, mouseY, 30, 30);
    ellipse(mouseX+1, mouseY+25, 20, 20);
    
    
    //"Scary" parts -- lines around the monster.
    line(mouseX, mouseY+30, mouseX-50, mouseY+60);
    line(mouseX, mouseY+80, mouseX-50, mouseY+60);
    
    line(mouseX, mouseY-30, mouseX+50, mouseY-60);
    line(mouseX, mouseY-80, mouseX+50, mouseY-60);
    
    line(mouseX+100, mouseY, mouseX-50, mouseY+20);
    line(mouseX-100, mouseY, mouseX-50, mouseY+20);
    
  }
  else {
    fill (255);
    strokeWeight(1);
    
  }
  
  //Basic "face."
  ellipse(mouseX, mouseY, 100, 100);
  ellipse(mouseX-10, mouseY, 10, 10);
  ellipse(mouseX+10, mouseY, 10, 10);
  ellipse(mouseX+1, mouseY+25, 20, 20);
  
  
}


