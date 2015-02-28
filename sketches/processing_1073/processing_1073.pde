
float counter = 0;

void setup()
{
  size(400,400);
  colorMode(HSB,400,100,100,100); // hsb color mode with 
  frameRate(30);
}


void draw()
{
  counter+=0.8;
  
  for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      // calculate distance between this pixel and two points
      float distance = dist(x,y,width/3,height/3);
      float distance2 = dist(x,y,width*2/3,height*2/3);
      
      // calculate the color value with some odd equation
      int clr = (int)((sin(distance/200)*sin(distance2/200)*400)+counter);
      
      // if color value is larger or smaller than the min/max, loop it around
      while(clr>=400)
      {
        clr-=400; 
      }
      while(clr<0)
      {
        clr+=400; 
      }
      
      stroke(clr,100,100,100);
      point(x,y);
    }
  }
}

