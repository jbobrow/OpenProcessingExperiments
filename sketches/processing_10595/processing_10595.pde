
void setup ()
{
   
  size (400, 400);
  background (255);
  

  noStroke();
  smooth(); 
  
  
}

void draw ()
{
 smooth();
  
  
  for ( int i = 0 ; i <10; i++ )
  {
fill(i*20);
 rect(0,0,height/2,i*2);
    translate (0,i*3);
     rect(0,width/2+i,height/2,i*2);
    translate (0,i*3);
  
    
    rect(0,0,i*2,width/2);
    translate (i*3,0);
    rect(height/2+i,0,i*2,width/2);
    translate (i*3,0);

  }
  
}

