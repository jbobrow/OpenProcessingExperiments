
void setup(){
  size(400,400);
 
  
}
  
  void draw(){
    background(0,0,0);
    strokeWeight(10);
    stroke(225,0,0);
    line(50,50,50,200);
    line(300,300,300,200);
    
    noStroke();
    fill(mouseX,mouseY,225);
    ellipse(mouseX,mouseY,20,20);
    ellipse(mouseX+40, mouseY+40,20,20);
    ellipse(mouseX-40,mouseY-40,20,20);
    
    
        
  
    }
    
 


