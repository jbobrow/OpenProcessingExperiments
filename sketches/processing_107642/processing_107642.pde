
void setup() {
noCursor();
  size(800,800);
   background(0);
   
}

void draw() {
   fill (0);
  if (mousePressed == true) {
    background(67,240,247);
  
    
    ellipse(mouseX, mouseY, 20, 20);
    
    
  }
else { background(0); 
fill(254);
ellipse (mouseX,mouseY, pmouseX, pmouseY);
}
 }
