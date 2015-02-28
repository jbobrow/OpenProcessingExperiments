
void setup() { 
  size(980, 620); 
  smooth();
  background(237,255,62);
}

void draw() { 
  if (mousePressed) {
  fill(242,137,206);

} else {
  fill(0,137,206); 
  fill(226,181,57); 

}  
  rect(mouseX, mouseY, 30, 30); 
  line(mouseX,mouseY,60,30); }
  
  

