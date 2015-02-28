
void setup(){
  size(400,400);
  background(0,0,0);
  
}
  
  void draw(){
    stroke(mouseX,mouseY,225);
    strokeWeight(10);
    fill(225,0,0);
    rect(50,50,100,200);
    
    stroke(52,38,221);
    fill(mouseX,mouseY,225);
    rect(200,200,50,50);
    
    stroke(mouseX,mouseY,225);
    fill(225,0,0);
    rect(200,125,50,50);
    
    stroke(52,38,221);
    fill(mouseX,mouseY,225);
    rect(200,50,50,50);
    
  
    }


