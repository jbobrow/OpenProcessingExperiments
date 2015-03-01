
float i = 0;
float c = 0;

void setup()
{
  size(1000,1000);

  
}

void draw()
{
  background(75,163,255);
  
    if( c==1)
    {
      background(13,68,126);
      for (float x=0; x< width; x+=5) {
    
      float rainX = random(3,width);
      float rainSz = random(20,40);
      stroke(255);
      line( rainX + i, 1000-x, rainX,1000- (x + rainSz));
      }
    }
    
    else if ( c==2)
    {
     background(7,32,59); 
     i = 10;
     for (float x=0; x< width; x+=5) {
    
      float rainX = random(3,width);
      float rainSz = random(20,40);
      stroke(255);
      line( rainX + i, 1000-x, rainX,1000- (x + rainSz));
      
      }
    }
    else
    {
     c = 0;
     i = 0; 
    }
    
}


void mouseClicked( )
{
    c ++;
} 

