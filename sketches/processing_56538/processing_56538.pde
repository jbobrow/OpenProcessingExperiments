
/*Project 6
Kathleen Cleary
cleary.katie@gmail.com
3.19.2012
Draw a cartoon space, draw a spaceship, move that spaceship 
within the confines of the window based on keyboard input*/

//declaring my global variables
int myWidth=800, myHeight=400;
int x=myWidth/2;
int y=myHeight/2;
int xSpeed=0;
int ySpeed=0;

void setup()
{
  //setup the output window display
  size(myWidth,myHeight);
  smooth();
}

void draw()
{
  drawBackground();
  addMotion();
  drawSpaceship();
  moveSpaceship();
  constrainSpaceship();
}

//draw a starfield with a few planets for the background
void drawBackground()
{ 
  noStroke();
  background(0);
  int y=10;
  for (int x=10; x<width+30; x+=30)
  {
    fill(255);
      beginShape();
      vertex(x,y);
      vertex(x+10,y);
      vertex(x+2,y+10);
      vertex(x+5,y-5);
      vertex(x+8,y+10);
      vertex(x,y);
      endShape();
    if (x>width && y<height)
    {
      x=-20;
      y+=30;
    }
  }
  fill(200,0,0);
  ellipse(width*.8,height*.2,100,100);
  fill(150,0,0,200);
  ellipse(width*.78,height*.25,20,20);
  ellipse(width*.82,height*.15,30,30);
  fill(0,150,200);
  arc(0,height,350,100,radians(-90),radians(0));
  fill(242,223,130);
  ellipse(width*.2,height*.4,200,200);
  fill(198,191,108,150);
  ellipse(width*.18,height*.48,75,60);
  ellipse(width*.25,height*.34,40,60);
}

//draw a spaceship
void drawSpaceship()
{
  fill(97,116,157);
  arc(x,y,60,100,radians(-90),radians(90));
  arc(x-60,y,40,60,radians(-90),radians(90));
    fill(150);
    stroke(0);
    arc(x,y,120,50,radians(0),radians(180));
    arc(x,y,120,50,radians(-180),radians(180));
    strokeWeight(3);
    line(x+50,y,x-60,y);
    strokeWeight(1);
    fill(255,0,0);
    arc(x+45,y,30,31,radians(-90),radians(90));
    fill(75,162,247);
    ellipse(x+15,y,30,30);
    fill(17,75,131);
    ellipse(x+15,y,20,20);    
}

//set x and y equal to their values plus whatever speed
void moveSpaceship()
{
  x=x+xSpeed;
  y=y+ySpeed;
}

//use conditionals to change x and y speed based on specific keys
void addMotion()
{
      if (keyPressed && keyCode==UP) 
      {
        ySpeed=-3;
      }
      else if (keyPressed && keyCode==DOWN) 
      {
        ySpeed=3;
      }
      else
      {
        ySpeed=0;
      }
      
      if (keyPressed && keyCode==RIGHT) 
      {
        xSpeed=3;
      }
      else if (keyPressed && keyCode==LEFT) 
      {
        xSpeed=-3;
      }
      else
      {
        xSpeed=0;
      }
}

//limit the x and y values for spaceship to the display window
void constrainSpaceship()
{
  x=constrain(x,0,width);
  y=constrain(y,0,height);
}

