
//Problem Set 2 - Question 2
//Vanessa Faienza
 
void setup() {
  size (400, 400);
  background (255);
  noStroke();
  smooth();
   
}
void draw () {
if (mousePressed && (mouseButton==LEFT)) {
  paintbrush (mouseX, mouseY);
}
}
 
void paintbrush (int x, int y) {
  fill (mouseX, mouseY, 180, 50);
  rectMode(CENTER);
  rect(mouseX, mouseY, 25, 75);
  rect(mouseX, mouseY, 75, 25);
  ellipse(mouseX, mouseY, 100, 25);
  ellipse(mouseX, mouseY, 25, 100);
}
     
                
