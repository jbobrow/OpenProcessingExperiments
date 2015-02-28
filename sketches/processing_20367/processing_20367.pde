
void setup() {
  size(700, 300);
  background(0);
  colorMode(HSB, 600, 250, 600); 
  smooth();
  noStroke();
}

void draw() {
  println(mouseX + " " + mouseY);
  fill(mouseX, 60, mouseY);  
  rect(0, 0,mouseX, random(600)); 
}




