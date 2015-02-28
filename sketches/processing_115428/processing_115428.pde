
void setup() {
  size(400,400);
  background(36,2,198);}
  
  void draw() {
    rect(50,50,100,100);
    point(300,100);
    noStroke();
    fill(random(255),21,261,342);
    
    rect(width/8, 50,100,100);
    
    rect(width/8,height/8,100,100);
    
    rect(mouseX-100, mouseY-100, mouseX+100, mouseY+100);
  }
    
  
  
    



