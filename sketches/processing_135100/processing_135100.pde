
int laysa = 6;
 
void setup() {
  
  size(600,600);
  background (random (0));
  color (HSB);
}
 
void draw() {
  
  ellipse(laysa+1, mouseX,mouseX,laysa-3);
  stroke(1+80,250,255-laysa);
  noFill ();
  ellipse(laysa+1, mouseX,mouseX/width,laysa-3);
  stroke(1+80,250,random (255)-laysa);
  noFill ();
 
  
  laysa += 6;
  }


