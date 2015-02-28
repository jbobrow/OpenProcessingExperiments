
int laysa = 6;
 
void setup() {
  
  size(600,600);
  background (random (0));
}
 
void draw() {
  
  ellipse(laysa+1, mouseX,mouseX,laysa-3);
  stroke(1+80,250,20);
  noFill ();
  ellipse(mouseY, mouseX,height,laysa);
  stroke(1+41,137,200);
  noFill ();
  
  laysa += 6;
  }
