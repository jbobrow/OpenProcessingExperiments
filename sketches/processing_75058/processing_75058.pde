
void setup() {
  
  size(400, 400, P2D);
  background(0);
  smooth();
}

void draw() {
 
    background(random(mouseY));
    noStroke();
    fill(mouseX*255/400, random(mouseX), random(mouseX));
 
    ellipse(width/2, height/2, mouseX, mouseX);
    
    if(mousePressed) {
      
      noFill();
      stroke(255);
      strokeWeight(10);
      ellipse(width/2, height/2, mouseX, mouseY);
      ellipse(width/2, height/2, mouseY, mouseX);
      
      
    }
  
  
}
