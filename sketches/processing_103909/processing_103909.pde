
class Projectile
{
  float xPos=2000;
  float yPos=random(0, 750);
  float radius;
  color ballColor=color(118, 66, 47);
  float vx=random(-7, -2);
  float vy=0;

  Projectile(float x, float y, float r, color c)
  {
    xPos=x;
    yPos=y;
    radius=r;
    ballColor=c;
  }

  void moveProjectile()
  {
    xPos=xPos+vx;
    yPos=yPos+vy;

    //respawn projectile
    if (xPos<0-10)
    {
      xPos=width+10;
    }
  }
  void drawProjectile()
  {
    
    fill(ballColor);
    ellipse(xPos, yPos, radius, radius);
  }
  boolean collision(float humanX, float humanY)
  {
    if (humanX>xPos&&humanX;<xPos+radius)
    {
      if (humanY>yPos&&humanY;<yPos+radius)
      {
        return true;
      }
    }
    return false;
  }
}










class Human
{
  PImage hero;
  float xPos;
  float yPos;
  float vy=10;

  Human(float x, float y)
  {
    xPos=x;
    yPos=y;
    hero=loadImage("superHero copy copy.png");
  }

  void move()
  {
    if (keyPressed && keyCode == UP)
    {
      yPos=yPos-vy;
    }
    if (keyPressed&&keyCode;==DOWN)
    {
      yPos=yPos+vy;
     }
     if(keyPressed&&keyCode;==LEFT)
     {
       xPos=xPos-vy;
     }
     if(keyPressed&&keyCode;==RIGHT)
     {
       xPos=xPos+vy;
     }
      
     yPos=constrain(yPos,0,665);
     
  }
  
  void draw()
  {
    image(hero, xPos, yPos);
  }
}







Human human;
final int NUMBER_OF_PROJECTILES=18;
ArrayList<Projectile>projectileList;
boolean  isCollisionWithHuman; 



void setup()
{

  size(1920, 750);
  projectileList=new ArrayList<Projectile>();
  for (int i=0;i<NUMBER_OF_PROJECTILES; i++)
  {
    human=new Human(50, height/2);
    Projectile newProjectile= new Projectile(random(480, 1920), random(0, 750), 70, color(255, 0, 222));
    projectileList.add(newProjectile);
  }
}

void draw()
{
  background(0); 
  {
    human.move();
    human.draw();
  }
  for (int i=0;i<projectileList.size();i++)
  {
    Projectile projectile=projectileList.get(i);
    projectile.moveProjectile();
    projectile.drawProjectile();

    if (human.xPos>width)
    {
      background(0, 255, 0);
      textSize(100);
      fill(0);
      text("YOU WIN!", 750, height/2);
    }


    if (projectile.collision(human.xPos, human.yPos) == true)
    {
      isCollisionWithHuman = true;
    }
    if (projectile.xPos<0)
    {
      projectile.vx=-projectile.vx;
    }
    if (projectile.xPos>width)
    {
      projectile.vx=-projectile.vx;
    }
  }



  if (isCollisionWithHuman==true)
  {
    background(0);
    textSize(100);
    fill(255);
    text("GAME OVER", 750, height/2);
  }
}
