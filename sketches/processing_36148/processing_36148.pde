
void setup(){
  size(500,500);
  ellipse(mouseX,mouseY,59,59);
  background(0);
 }
  
  void draw(){
    
     
    float x = mouseX;
    float y = mouseY;
    strokeWeight(5);
   stroke(255,255,0,10);
   line(mouseX,mouseY,0,0);
   stroke(255,72,0,10);
   line(mouseX,mouseY,500,500);
      stroke(255,0,0,10);
   line(mouseX,mouseY,0,500);

   stroke(0,255,0,10);
   line(mouseX,mouseY,500,0);

  
}
                
                
