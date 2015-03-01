
void setup() {
background(255)
  size(600, 600);
}
    
void draw() {
  if (mousePressed) {
   
      fill(random(90),random(145),220);
     
  } else {
      
    fill(400,12,280);
    noStroke()
  }
    
   
  ellipse(mouseX, mouseY, 80, 80);
  stroke(0)
}

