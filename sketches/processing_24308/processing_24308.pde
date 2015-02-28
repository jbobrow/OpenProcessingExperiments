


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
  fill(255, 38, 0);
  bezier(50, 0, -20, -20, 70, 70, 0, 50);
  bezier(0, 50, -20, -20, 70, 70, 50, 0);
  fill(255, 64, 0);
  bezier(50, 0, -10, -10, 60, 60, 0, 50);
  bezier(0, 50, -10, -10, 60, 60, 50, 0);
  fill(255, 94, 0);
  bezier(50, 0, 0, 0, 50, 50, 0, 50);
  bezier(0, 50, 0, 0, 50, 50, 50, 0);
  fill(255, 126, 0);
  bezier(50, 0, 10, 10, 40, 40, 0, 50);
  bezier(0, 50, 10, 10, 40, 40, 50, 0);
  fill(225, 225, 225, 70);
  bezier(70, 10, 30, 30, 40, 40, 10, 70);
  bezier(20, 60, 30, 30, 40, 40, 60, 20);
  bezier(20, 60, 40, 40, 30, 30, 60, 20);


}

