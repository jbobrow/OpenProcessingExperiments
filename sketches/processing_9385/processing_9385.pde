
void setup ()
{   size( 500, 500 );
    smooth();  
    background(255);
}
void draw ()
{  for ( float a = 0; a < 60; a=a+20 )  
      {rect(a,a,width-a-a/5, height-a-a/5);} 
   for ( float a = 60; a < 120; a=a+20 )  
      {rect(a,40+a/5, width-a-a/5, height-a-a/5);}      
   for ( float a = 120; a < 180; a=a+20 )  
      {rect(80+a/5,a/5+40, width-a-a/5, height-a-a/5);}   
   for ( float a = 180; a < 300; a=a+20 )  
      {rect(80+a/5,a-104, width-a-a/5, height-a-a/5);}  
   for ( float a = 300; a < 420; a=a+20 )  
      {rect(a-160,a-104, width-a-a/5, height-a-a/5);}  

noLoop();    }


