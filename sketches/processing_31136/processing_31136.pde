
void setup() {
  size(500,500);
  smooth();
}
  void draw() 
  {
    background(mouseX,mouseY,115);
    
    fill(0);
    ellipse(mouseX,mouseY,200,200);
    
    fill(30,247,209);
    ellipse(mouseX,mouseY,80,80);
    
      fill(247,63,30);
      ellipse(mouseX,mouseY,40,40);
    
    fill(mouseX,mouseY,255);
    noStroke();
    ellipse(mouseX,mouseY,60,60);
  }

