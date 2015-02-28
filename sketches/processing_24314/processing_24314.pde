

int patternSeperationX = 55;
int patternSeperationY = 50;
 
 
void setup(){
  size(1000,500);
    background(0, 0, 0,80);
      
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
  fill(255, 38, 0, 50);
bezier(85, 20, 10, 10, 90, 90, 15, 80);
  fill(255, 64, 0);
  bezier(0, 10, 10, -10, 40, 30, 10, 0);
  bezier(10, 0, -10, 10, 40, 30, 0, 10);
  fill(255, 94, 0);
  bezier(20, 10, 0, 0, 50, 40, 10, 10);
  bezier(10, 20, 0, 0, 50, 40, 20, 20);
  fill(255, 126, 0);
  bezier(30, 20, 10, 10, 40, 40, 20, 30);
  bezier(20, 30, 10, 10, 40, 40, 30, 20);
  fill(225, 225, 225, 70);
  bezier(70, 10, 30, 30, 40, 40, 10, 70);
  bezier(20, 60, 30, 30, 40, 40, 60, 20);
  bezier(30, 50, 40, 40, 30, 30, 50, 30);


}

