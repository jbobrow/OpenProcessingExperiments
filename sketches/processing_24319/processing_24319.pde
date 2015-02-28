


int patternSeperationX = 55;
int patternSeperationY = 50;
 
 
void setup(){
  size(1000,500);
    background(10, 10, 10,80);
      
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
        
 
}

 
      }
  }
   

 
 
void draw()
{
 
  fill(mouseX,mouseY,0);
}
 
 
void yourFunction(){
   
 smooth();
   
  noStroke();
  fill(0, 0, 0, 50);
ellipse(85, 20, 10, 10);

  fill(255, 64, 0);
  bezier(40, 50, 50, -50, 80, 70, 50, 40);
  bezier(50, 40, -50, 50, 40, 30, 0, 50);
  
  fill(255, 94, 0);
  bezier(60, 40, -50, 50, 100, 60, 40, 40);
  bezier(40, 60, 50, -50, 50, 40, 60, 60);
  

  
  fill(225, 225, 225, 70);
  bezier(10, 40, 20, 20, 60, 60, 20, 10);
  bezier(40, 40, 40, 40, 40, 40, 40, 40);
  fill(255,255,255,35);
  bezier(0, 20, 100, 100, 50, 50, 20, 0);


}

