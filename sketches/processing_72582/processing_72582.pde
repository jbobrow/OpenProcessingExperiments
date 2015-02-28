
PImage map1;


void setup()
{
  size(800,800);
  
  frameRate(100);
}

int x = 114;
int y = 46;
int i = 0;


void draw()
{
  i++;
  
  background(255,255,255);
  map1 = loadImage("bts_map.gif");
  image(map1, 0, 0);
  

  fill(255,0,0);  
  
  if ( x < 115 && y < 335 )
  {
    ellipse(x, y, 20, 20);
    y++;
  }

  if ( y == 335 && x < 282 )
  {
    ellipse(x, y, 20, 20);
    x++;
    
  }
  

  
  if ( x > 281 && x < 478 && y < 523 )
  {
    ellipse(x, y, 20, 20);
    x++;
    y++;
    
  }
  if ( x == 478 || y == 523 )
  {
     x = 114;
     y = 46; 
     i = 0;
  }

}//end void draw()
  
  
  
  

    
    
    

    
    
  
  

  
  
  
  
  
  





