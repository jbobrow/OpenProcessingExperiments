
void setup() {  //setup function called initially, only once
  size(480, 800);
  background(255);
  
  
}

void draw() {  //draw function loops 
 stroke(0,50);
 strokeWeight(2.5);
 line(mouseX,mouseY, pmouseX,pmouseY);
 line(mouseX-3,mouseY-3, pmouseX-3,pmouseY-3);
 line(mouseX+3,mouseY+3, pmouseX+3,pmouseY+3);
  
}
  
