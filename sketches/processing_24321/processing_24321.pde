

int patternSeperationX = 50;
int patternSeperationY = 60;
 
 
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
   

  noStroke();
  smooth();
  
     fill(255, 94, 0,85);
  bezier(100, 50, 25, 25, 75, 75, 100, 50);
  bezier(50, 100, 75, 75, 25, 25, 50, 100);
  
  fill(255, 38, 0,95);
  bezier(90, 40, 15, 15, 65, 65, 90, 40);
  bezier(40, 90, 65, 65, 15, 15, 40, 90);
  
  fill(255, 64, 0,90);
    bezier(80, 30, 5, 5, 55, 55, 80, 30);
  bezier(30, 80, 55, 55,5, 5, 30, 80);
  
  

  
  fill(225, 225, 225);
    bezier(70, 20, -5, -5, 45, 45, 70, 20);
  bezier(20, 70, 45, 45, -5, -5, 20, 70);
  
  
    fill(255,126,0);
ellipse(25, 20, 10, 10);


}

