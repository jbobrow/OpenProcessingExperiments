
float gray = 0.0;
int[] x = { 50, 61, 83, 69, 71, 50, 29, 31, 17, 39 };
int[] y=  { 18, 37, 43, 60, 82, 73, 82, 60, 43, 37 };


int x2[] = new int[5];
int y2[] = new int[5];

void setup()
{
  size(400,400);
  background(255);
  
  for (int i =0; i<5; i++)
  {
    x2[i] = (int)random(1, 50);
    y2[i] = (int)random(40, 100);
  }
}

void draw()
{
  //print
  for (int i = 0; i< 400; i++)

  { 
    float percent = (float)i/400;
    
    stroke(255 * percent, 0, 0);
    line(0, i, 400, i);
  }
  
  for ( int i = 0; i < 400; i += 40)
   {
     stroke(255);
    line(0, i, 400, i);
    line(i, 0, i, 400);
    
   }  
   
   pushMatrix();
   translate(100, 0);
   drawShapes(0, 0);
   popMatrix();
   
   pushMatrix();
   translate( 200, 0);
   drawShapes(100, 100);
   popMatrix();
   
   pushMatrix();
   translate( -100, 0);
   drawShapes(200, 200);
   popMatrix();
   
   pushMatrix();
   translate( -200, 0);
   drawShapes(300, 300);
   popMatrix();
   
   pushMatrix();
   rotate(radians(10));
   drawShapes(250, 250);
   popMatrix();
 
}
     

void drawShapes(float offset, float yoffset)
{
  beginShape();
   for (int i = 0; i < x.length; i++)
   {
     vertex(x[i] + offset, y[i] + yoffset);
   }  
   endShape(); 
   
   beginShape();
   for (int i = 0; i < x2.length; i++)
   {
     vertex(x2[i] + offset, y2[i] + yoffset);
   }  
   endShape(); 
}


