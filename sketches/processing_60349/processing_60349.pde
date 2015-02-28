
void setup () {
   size (400,400);
   background (241,241,241);
   smooth();
   noCursor();
   ellipseMode(CENTER);
  
}

void draw () {
  if (mousePressed) {
    fill(80,30);
    stroke(0);
    strokeWeight(1);
    triangle(random (0,400), random (0,400), random (0,400), random (0,400), mouseX, mouseY);
    

} else {

  fill(230);
  ellipse(mouseX, mouseY,50,50);
  strokeWeight(1.5);
  
}
}
