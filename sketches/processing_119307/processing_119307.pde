

int x=152;
int y=8;
boolean fault= false;
float hit;

PImage maze;

void setup()
{
  size(322,322);
  maze= loadImage("Maze1.png");
  frameRate(60);
}

void draw()
{
  background(maze);
 
  println(mouseX+","+mouseY);  //for debug
 
  hit= red(get(x,y));
  
  if(hit==0)
  {
    x=168;
    y=318;
  }
  
  pushMatrix();
  translate(x,y);
  fill(255,0,0);
  ellipse(0,0,5,5);
  popMatrix();
  
 if(x>148&&x<158)
 {
   if(y<2)
   {
   fill(0);
   text("You WIN!",50,150,200,50);
   }
 }
}

void keyPressed()
{
  if(key==CODED)
  {
    if(keyCode==UP)
    {
      y=y-1;
    }
    if(keyCode==DOWN)
    {
      y=y+1;
    }
    if(keyCode==LEFT)
    {
      x=x-1;
    }
    if(keyCode==RIGHT)
    {
      x=x+1;
    }
  }
}

  
  

