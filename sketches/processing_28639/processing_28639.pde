
PImage Background;
PImage [] run;
int x = 0;
int y = 400;
int frame = 1;
int x2 = 3;
int b = 175;
int a = 125;
int counter;
  
float rot=0;
float desiredRot = 0;
  
  
void setup()
{
  size (500,500);
   
  run = new PImage[3];
  for(int i = 0; i< run.length; i ++)
  {
  run[i]= loadImage("run" + (i+1) + ".png");
  }
  Background= loadImage("Background.jpg");
}
  
  
  
void draw()
{
    
 if(frame >= 2) frame = 0;
 
    
   
 image(Background, 0,0, 500, 500);
  
  pushMatrix();
  translate(x,y);
  rotate(rot);
  image(run[frame], -50,-50, a,b);
  popMatrix();
    
  x+=x2;
  
if(counter%20 == 0) 
  {
  frame++;
  }


   
 if (x>=500 || x<=0)
   {
    x2*=-1;
   }
  if(mousePressed)
  {
    a=175;
    b=125;  
  }
  
}

void keyPressed() 
{
  if(key == CODED)
 {
    if(keyCode == UP) 
    {
      y-= 5;
      desiredRot = PI;
      frame++;
    }
    else if (keyCode == DOWN) 
    {
      y+= 5;
      desiredRot = 0;
      frame++;
    }
  }
  counter++;
}


