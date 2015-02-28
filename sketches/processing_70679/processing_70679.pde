
//homework for processing
//bettymcui
//september 15th

int x;
int y;
int diameter=300;
int xSpeed=0;
int ySpeed=0;
int position=0;
int counter=0;
boolean inCircle=false;
void setup()
{
  size(800, 800);
  x=200;
  y=200;
  xSpeed=1;
  ySpeed=1;
  position=1;
}
void draw()
{
  background(200);
  if ( dist(x, y, mouseX, mouseY) < diameter/2 ) {
    fill(32, 178, 170);
    inCircle = true;
  }     
  else
  {
   inCircle=false; 
  }
  if (position==1)
  {
    fill(255, 215, 0);
    if(counter==200)
    {
    position=2;
    counter=0;
    }
    counter++;
    xSpeed=1;
    ySpeed=0;
  }
  else if (position==2)
  {
    fill(218,0,218);
    if(counter==200)
    {
    position=3;
    counter=0;
    }
    counter++;
    xSpeed=0;
    ySpeed=1;
    
  }
  else if (position==3)
  {
    fill(0,255,0);
    if(counter==200)
    {
    position=4;
    counter=0;
    }
    counter++;
    xSpeed=-1;
    ySpeed=0;
  }
  else
  {
    fill(238,118,0);
    if(counter==200)
    {
    position=1;
    counter=0;
    }
    counter++;
    xSpeed=0;
    ySpeed=-1;
  }
  if(inCircle)
  {
   fill(0,0,255); 
  }
  
  if (mousePressed&&inCircle)
  {  
    fill(139, 0, 0);
  }
  

  x=x+xSpeed*2;
  y=y+ySpeed*2;
  line(x, y, mouseX, mouseY);
  ellipse(mouseX, mouseY, 25, 25);
  ellipse(x, y, diameter, diameter);
}


