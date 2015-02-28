
void setup () {
   size (600,600);
   background (99,103,105);
   smooth();
   noCursor();
   ellipseMode(CENTER);
   
}
 
void draw () {
  if (mousePressed) {
    fill(80,30);
    stroke(0);
    strokeWeight(1);
 rect (random (0,100), random (0,100), random (0,200), random (0,200), mouseX, mouseY);   
} else {
  
 stroke (250);
  fill(230);
  ellipse(mouseX, mouseY,80,100);
  strokeWeight(1);
   
}
}

