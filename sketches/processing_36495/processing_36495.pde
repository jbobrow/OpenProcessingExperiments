
void setup(){
  size(900, 450);
  background(255,255,255,15);
  smooth();
}

void draw(){
    
//variable for rotation
  float angle = 16* radians(dist(pmouseX, pmouseY, mouseX, mouseY));
// Set origin to mouse position
  translate(mouseX, mouseY);
  scale(dist(pmouseX, pmouseY, mouseX, mouseY)/20);
  
//  objects
  fill(255, 0, 0, 15);
  rotate(angle);
  rect(0 ,0 ,40 ,60);
  noStroke();
  fill(0,0,225,14);
  ellipse(0,0, 20, 14);
}

// reset background
void mouseClicked(){
  background(255,255,255,55);
}

                
                
