
//Candice Ferreira; Problem Set 2. Question 2.
void setup() {
  size (600, 600);
  background (0);
  noStroke();
  smooth();
   
}
void draw () {
if (mousePressed && (mouseButton==LEFT)) {
  paintbrush (mouseX, mouseY);
}
}
 
void paintbrush (int x, int y) {
  fill (mouseX, mouseY, 200, 16);
  rectMode(CENTER);
  ellipse(mouseX, mouseY, 80, 18);
  ellipse(mouseX, mouseY, 18, 80);
  ellipse(mouseX, mouseY, 100,50); 
  
}


