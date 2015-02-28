
void setup ()
{
    size( 400, 400 );
}


void draw ()
{
spalte (4,1);
spalte (8,2);
spalte (16,3);
spalte (32,4);
}  
  
void spalte ( float quadrate, float reihe ) {  
 
  for (int q=0; q < quadrate; q++)
  {
    rect ((reihe-1)*(width/4),q*(width/quadrate),width/4,width/4);
  } 
  
}

