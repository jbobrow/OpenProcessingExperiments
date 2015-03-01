
int counter;
 
void setup() {  //setup function called initially, only once
  size(250, 250);
smooth();
}
 
void draw() {  //draw function loops
if (mousePressed) {
  fill(0);
  } else {
fill(255)
 
}
 
ellipse(mouseX, mouseY, 80, 80);
 
}
