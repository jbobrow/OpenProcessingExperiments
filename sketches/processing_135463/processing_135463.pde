
background (0,0,0);
  size(1000,800);
 
float s = 0;
void setup() {
  
}
  
void draw() {
 float v = dist(mouseX,mouseY,pmouseX,pmouseY);
 noFill ();
  stroke(41,137,200,80);
 ellipse(mouseY,mouseX,s+mouseX,s+mouseX);
  s = s+2+(v/50);
stroke(80,250,20,50);
  noFill ();
ellipse(mouseX, mouseX,s+mouseX,s-mouseY);

  }
