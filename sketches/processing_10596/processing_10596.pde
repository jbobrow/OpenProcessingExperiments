
void setup ()
{
   
  size (600, 400);
  background (255);
  
  //fill(i);
  noStroke();
  smooth(); 
    fill(0);
  
}

void draw ()
{
pushMatrix();
  for ( int i = 0 ; i <50; i++ )
  {  
 rect(0,0,15,height-i*30);
 translate(50,0); 
  }
   popMatrix();
  
   
 pushMatrix();
  for ( int k = 0 ; k <30; k++ )
  {  
   
 rect(0,0,width-k*70,15);
translate(0,50); 
  }
  popMatrix();
}

