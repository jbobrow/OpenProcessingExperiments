
// Gayatri Krishnan
// July 8
// Basic drawing app 
// Reference: DMA

void setup () {
  background(0); 
  size (400, 400); 
  strokeWeight(5); 
  stroke(255);
}

void draw() {
  if (mousePressed == true) 
    line (pmouseX, pmouseY, mouseX, mouseY);

  println("mouseX: " + mouseX + " , mouseY: " + mouseY);
}
