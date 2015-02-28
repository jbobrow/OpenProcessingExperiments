
int count = 0;

void setup()
{
  size(500,500);
  background(0);
  
  stroke(255);
  line(0,0,0,height); //y-axis
  
  line(0,height-1,width,height-1); //x-axis
  
  //tick marks
  for(int i=0; i <= height; i+=height/40)
  {
    line(i,height-3,i,height);  //x ticks
    line(0,i,3,i);  //y ticks
  }
}

void draw()
{
  if (count <= 60)
  {
    graphline(count,count);
    count += 1;
  }
}

void graphline(int x,int y)
{
  frameRate(10);
  int scale = width / 40;
  line(x*scale, height, 0, y*scale);
}
