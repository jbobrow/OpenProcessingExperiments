
void setup() { 
  size(600,400);
}


void draw() {
  background(0,0,0);
 fill(250);
  strokeWeight(5); 
  fill(#13719B);
  ellipse(300, 200, 205, 195);
  fill(10);
  stroke(235);
  fill(55);
  rect(mouseX, 20, 55, 55, 3, 6, 12, 18);
  fill(250);
  point(100, 200);
  fill(250);
  point(120, 300);
  point(275, 25);
  
  if (mousePressed) {
    println("nah");
    fill(250);
    rect(mouseX, 20, 55, 55, 3, 6, 12, 18);  
} else {
  fill (55);
}
    
}
