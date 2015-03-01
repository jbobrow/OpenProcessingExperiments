
void setup() { 
  size(600,400);
}


void draw() {
  background(#FA8303);
 fill(250);
  strokeWeight(5); 
  fill(#AA052E);
  ellipse(mouseX, mouseY, 200, 200, 205, 195);
  stroke(235);
  fill(250);
  point(mouseX, mouseY, 275, 25);
  
  if (mousePressed) {
    println("I love Emergent Media");
    fill(250);
    ellipse(mouseX, mouseY, 125, 100, 130);  
} else {
  fill (55);
  ellipse(mouseX, mouseY, 200, 200, 205, 195);
  fill (75);  
}
    
}


