
float gray = 0.0;
int[] x = { 50, 61, 83, 69, 71, 50, 29, 31, 17, 39 };
int[] y = { 18, 37, 43, 60, 82, 73, 82, 60, 43, 37 };


int[] x2 = new int[5];
int[] y2 = new int[5];

void setup()
{
  size(400, 400);
  background(225);
  
  for (int i = 0; i < 5; i++)
  {
   x2[i] = (int)random(100, 200);
   y2[i] = (int)random(150,200);
  } 
}

void draw()
{
  for (int i = 0; i <400; i++) 
    {  
    float percent = (float)i / 400; 
    
    stroke(225 * percent, 0, 0);
    line(0, i, 400, i);
    }  
    
 
    
  for (int i = 0; i < 400; i += 40)
    {
     stroke(225);
     line(0, i, 400, i); 
     line(i, 0, i, 400);
     
     
     
     pushMatrix();
     translate(50, 50);
     drawShapes(0);
     popMatrix();
     
     pushMatrix();
     translate(100, 100);
     drawShapes(0);
     popMatrix();
     
     pushMatrix();
     translate(200, 80);
     rotate(radians(100));
     drawShapes(0);
     popMatrix();
     
     pushMatrix();
     translate(300, 40);
     drawShapes(0);
     popMatrix();
     
     pushMatrix();
     translate(0, 80);
     drawShapes(0);
     popMatrix();
     


 
    }
    
} 

void drawShapes(float offset)
{
  beginShape();  
  for (int i = 0; i < x.length; i++)
    {
     vertex(x[i] + offset, y[i]); 
    }  
  endShape();  
  
    beginShape();  
  for (int i = 0; i < x2.length; i++)
    {
     vertex(x2[i] + offset, y2[i]); 
    }  
  endShape(); 
  
  
}





