
int [] posX = {0, 30, height/2, 100, 200};
int [] posY = new int [5];
int Col;

void setup()
{
  size(400, 400);
  smooth();
}
void draw()
{
  background(255);
   if ((mouseX > width-20 || mouseX < 20)||(mouseY > height - 20))  

  { 
    for (int i = 0; i < posX.length; i ++)
    {
      posX [i] = i*width/4;
      
      for (int j = 0; j < posY.length; j++)
      {
        posY [j] = j*height/2;
        
        
    Col = (int) random(posY.length - 1);
         
      
      fill(posY[Col], posY[Col], 0);
      ellipse(posX[i], posY[j]*0.5, 20, 20);
    
    
    
   }
  }
}
}
