
//Derek Chan, Tron,CP 1 Mods 14-15
//http://derek-lhs.webs.com/Tron.html
//* @pjs globalKeyEvents="true"; */
int x = 200;
int y = 400;
int direction=UP;
int robotX = 400;
int robotY = 400;
int robotDirection = UP;
int randomDirection = int(random(1, 3));
PImage disappoint;
PImage honor;
boolean gameover=false;
boolean Rgameover=false;
void setup()
{
  size(600, 600);
  background(0);
  disappoint = loadImage("http://derek-lhs.webs.com/Disappoint.jpg");
  honor = loadImage("http://derek-lhs.webs.com/Good.jpg");
  frameRate(50);
}
void draw()
{
  if (gameover==true)
  {
    image(disappoint, 0, 0, 600, 600);
  }
  else if (Rgameover==true)
  {
    image(honor, 0, 0, 600, 600);
  }
  if (gameover==false && Rgameover==false)
  {
    human();
    enemy();
  }
}

void human()
{
  if (get(x, y) != color(0))
  {
    gameover=true;
  }
  stroke(0, 255, 0);
  fill(0, 255, 0);
  rect(x, y, 3, 3);
  if (direction==UP)
  {
    y-=4;
  }
  else if (direction==DOWN)
  {
    y+=4;
  }
  else if (direction==LEFT)
  {
    x-=4;
  }
  else if (direction==RIGHT)
  {
    x+=4;
  } 
  keyPressed();
}
void enemy()
{
  if (get(robotX, robotY) != color(0))
  {
    Rgameover=true;
  }
  stroke(255, 0, 0);
  fill(255, 0, 0);
  rect(robotX, robotY, 3, 3);
  if (robotDirection==LEFT)
  {
    robotX-=4;
    if (get(robotX-4, robotY) !=color(0) && randomDirection==1)
    {
      robotDirection=DOWN;
    }
    else if (get(robotX-4, robotY) !=color(0) && randomDirection==2)
    {
      robotDirection=UP;
    }    
  }
  else if (robotDirection==RIGHT)
  {
    robotX+=4;
    if (get(robotX+4, robotY) !=color(0) && randomDirection==1)
    {
      robotDirection=UP;
    }
    else if (get(robotX+4, robotY) !=color(0) && randomDirection==2)
    {
      robotDirection=DOWN;
    }
  }
 else if (robotDirection==UP)
  {
    robotY-=4;
    if (get(robotX, robotY-4) !=color(0) && randomDirection==1)
    {
      robotDirection=LEFT;
    }
    else if (get(robotX, robotY-4) !=color(0) && randomDirection==2)
    {
      robotDirection=RIGHT;
    }
  }   
else if(robotDirection==DOWN)
  {
    robotY+=4;
    if (get(robotX, robotY+4) !=color(0) && randomDirection==1)
    {
      robotDirection=RIGHT;
    }
    else if (get(robotX, robotY+4) !=color(0) && randomDirection==2)
    {
      robotDirection=LEFT;
    }
  }
}
void keyPressed()
{
  if (keyCode==UP)
  {
    direction = UP;
  }
  else if (keyCode==DOWN)
  {
    direction = DOWN;
  }
  else if (keyCode==LEFT)
  {
    direction=LEFT;
  }
  else if (keyCode==RIGHT)
  {
    direction=RIGHT;
  }

}
