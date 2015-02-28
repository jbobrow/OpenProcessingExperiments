
size(200,200);
 
float y=10;


void setup()
{
  size(200,200);
}

void draw()
{
  for( int y=0; y<200; y=y+10 ) 
  {
    for( int x=0; x<200; x=x+10 )
    {
    fill(random(255),random(255),random(255));
      rect(random(200),random(200),random(30),random(30));
    }
  }
}


                
                                
