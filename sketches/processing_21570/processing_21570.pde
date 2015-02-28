
void setup() {
  size(600, 600);
  background(255, 255, 255);
  smooth();
}
//
void draw() {
  
  println(mouseX + " " + mouseY + " " + pmouseX + " " + pmouseY);
   
noStroke();
  fill(mouseX, 297, mouseY);
  
ellipse (mouseX-10, mouseY-22, 60, 90);
}
 
//size of paint splatter is dependent on movement of mouse and color on position

