
void setup() {
 size(500,500);

 
  }
  void draw() {
 background(100);    
    for(int y=50;y<500;y+=80) {
      for(int x=50;x<500;x+=80) {
      
      noStroke();
      fill(255);
      
  ellipse(x,y,50,50);
 
    }
    }
    pushMatrix();
    
 
   
 translate(50,50);
 
 
 fill(0,255,179);
   ellipse(mouseX,mouseX,50,50);
   fill(100);
   ellipse(mouseX,0,50,50);
   
   ellipse(0,mouseY,50,50);
   
    
 popMatrix();
 resetMatrix();
  
  }
