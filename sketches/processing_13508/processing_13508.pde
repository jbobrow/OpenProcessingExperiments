
void setup() {
    size(800, 400);
    background(#ffffff);
  }
    
    
for draw() {
       strokeWeight(0.3);
       line(0, mouseY, 800, mouseX);
       strokeWeight(0.5);
       ellipse(400, 200, mouseY-400, mouseX-300);
        
        
           }

