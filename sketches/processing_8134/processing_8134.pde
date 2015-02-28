
void setup () {
  
  background(20);
  size(500, 500);
  strokeWeight(0.2);
  
}

void draw () {
  
  stroke(random(100, 255), 20);
  
  if (mousePressed==true){
    
    line(random(150, 350), random(150, 350), mouseX-50, mouseY-50);
    
  };
  
    
  if (keyPressed==true){
    
    saveFrame();
    background(20);
  };
  
}

