
/*Rachel Moeller
EMS2 Assignment 4 Schotter Reproduction
*/
int bufferSpace=50;
float r;
float i;


void setup()
{
  size(340,500);
  smooth();
  noLoop();
  rectMode(CORNER);
}

void draw()
{
 background(200);
  strokeWeight(1);
  noFill();
 
   
  for(int rows=bufferSpace;rows<=270;rows+=20)
  {
    i+=i;
    for(int cols=bufferSpace;cols<=410;cols+=20)
    {
      r=(cols)*random(-0.00009,0.00009);
      pushMatrix();
      translate(0,r*cols);
      
    
      rotate(r*(cols/100));
      rect(rows,cols,20,20);
      popMatrix();
    
    }
  }

 
     
    
     
    
    
  
}



