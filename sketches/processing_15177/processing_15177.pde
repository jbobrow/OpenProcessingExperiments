
int ballno =40;
ball[] myballs = new ball[ballno];

void setup()
{ 
  smooth();
  size(450,450);
  noStroke();
  for (int i=0; i < ballno; i++)
  { 
    myballs[i]= new ball(5+random(40), 50+random(width-100),50+random(height-100),random(2)+1, random (2));
  }
}

void draw()
{
  background(30);
  for (int i=0; i<ballno; i++)
  {
    myballs[i].move();
  }
}
class ball
{
  float radius; //radius
  float xPos; //position
  float yPos;
  float velX; //tempo
  float velY;
  color col= color(30); //ball color

  ball(float r, float xp, float yp, float vx, float vy) //constructor with parameters
  {
    //switch values from global to local variable
    radius=r;
    xPos=xp;
    yPos=yp;
    velX=vx;
    velY=vy;
  }
  void move()
  { 
    draw(); //go to draw-function
    //if collision with window change color-function and go to 
    if (xPos+radius > width) 
    {
      changeColor();
      velX=-velX;
    }
    else if (xPos-radius < 0)
      {
        changeColor();
        velX=-velX;
      }
    if (yPos + radius > height)
    {
      changeColor();
      velY=-velY;
    }
    else if (yPos - radius < 0)
      {
        changeColor();
        velY=-velY;
      }
    xPos +=velX;
    yPos +=velY;
  }

  void changeColor()
  { 
    col = color(int(random(255)),int(random(255)),int(random(255)), int(random(100)));
  }


  void draw()
  {
    ellipseMode(CENTER);
    fill(col);
    ellipse(xPos,yPos, radius*2, radius*2);
  }
}

