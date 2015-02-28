
void setup ()
{
   
  size (400, 400);
  background (0);
  
  //fill(i);
  noStroke();
  smooth(); 
  
  
}

void draw ()
{
 smooth();
  
 // irgendwie hab ich den abnehmenden keil auf der rechte seite noch net hingekriegt.
     
  pushMatrix();
  for ( int i = 0 ; i <20; i++ )
  {

  triangle(0,0,5,height,5+i,0);
    translate (5+i*2,0);
  }
  popMatrix();
  
}

