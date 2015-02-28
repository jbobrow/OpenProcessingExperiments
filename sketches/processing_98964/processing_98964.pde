
int Elements = 5;
int mida = 5;
  
float [] pX = new float [Elements];
float [] pY = new float [Elements];
float [] vX = new float [Elements];
float [] vY = new float [Elements];
 
void setup() {
  size(250,250);
  stroke(255,0,0);
   
  for (int i=0; i <Elements; i++){
  pX [i] = random (height);
  pY [i] = random (width);
  vX [i] = random (-8,8);
  vY [i] = random (-8,8);
  }
  
 
}
void draw() {
  background(#2E36BF);
  for (int i = 0; i <= height; i = i +5) {
    line(mouseX,mouseY,width,i);
    line(mouseX,mouseY,0,i);
    line(mouseX,mouseY,i,0);
    line(mouseX,mouseY,i,height);
  
      }
      for (int i=0; i <Elements; i++){
      
      pX [i] = pX [i] + vX[i];
      pY [i] = pY [i] + vY[i];
        
      if (pX [i] < 0 ||pX [i] > width)  {
         vX [i] = -vX [i];
      }  
        
        
        if (pY [i] < 0 ||pY [i] > height)  {
          vY [i] = -vY [i];
           
      } 
      
      ellipse(pX[i],pY[i],15,15);
       
      ellipse(pY[i],pX[i],15,15);
      triangle(pY[i],pX[i],125, 125, 125, 125);
       
       
       
       
      }
}



