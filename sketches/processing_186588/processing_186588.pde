
void setup() {
background(0,240,0)
  size(600, 600);
}
  
void draw() {
  if (mousePressed) {
 
      fill(random(130),random(145),220);
   
  } else {
    
    fill(130,0,220);
    noStroke()
  }
  
 
  ellipse(mouseX, mouseY, 80, 80);
  stroke(130)
}


