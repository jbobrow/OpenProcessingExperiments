
void setup() {
  size(600, 600);
  background(0);
  smooth();
}
//
void draw() {
  println(mouseX + " " + mouseY + " " + pmouseX + " " + pmouseY);
  
noStroke();
  fill(mouseX, 30, mouseY); 
  ellipse(pmouseX, pmouseY, mouseX-pmouseX, mouseY-pmouseY); 
} 

//size of paint splatter is dependent on movement of mouse and color on position

