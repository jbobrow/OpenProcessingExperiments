
void setup() {
  background(252, 162, 51);
  size (750, 750);
}
  
//runs in a loop
  void draw (){
    
    fill(mouseX, mouseY, 198, 100);
    smooth();
    strokeWeight(10);
    stroke(197, 164, 214);
    ellipse(mouseX, mouseY, mouseX, mouseY);
    
    // (x1,  y1,  x2, y2)
 }

