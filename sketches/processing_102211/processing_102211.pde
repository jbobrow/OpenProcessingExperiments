
//Maxim maxim;
//AudioPlayer player;

boolean release = false;

Ball one;
Brick [] bricks = new Brick [10];

int xAxis = 500;
int yAxis = 500;

boolean mouseClicked = false;



float randomPosition()
{
  float rPosition = random(640);
  return rPosition;
}

Brick two = new Brick(2, 2);
void setup()
{
  size(xAxis, yAxis);
  noCursor();
  //maxim = new Maxim(this);
  //player = maxim.loadFile("snd_background.wav");
  //player.play();
  //player.setLooping(true);
  rectMode(CENTER);
  one = new Ball();
  release = false;
  one.setVelocity(1);
  int k = 0;
 
  for(int i = 50; i < width; i = i + 55)
  {
    bricks [k] = new Brick(i, 50);
     k++;
  }
}

void createShooters()
{
  fill(0);
  strokeWeight(3);
  stroke(120, 0, 120);
  rect(mouseX, yAxis - 20, 50, 20);
}

void draw()
{
  background(0);

  two.drawBricks(bricks);
  one.checkEdges(bricks);
  one.drawBall(release); 
 
  createShooters();
}

void keyPressed()
{
  mouseClicked = true;
  release = true;
}



class Ball
{
  PVector location;
  PVector velocity;

  Ball()
  {
    location = new PVector(mouseX, yAxis - 40);
    velocity = new PVector(0, -8);
  }

  void setVelocity(float mmX)
  {
    velocity = new PVector(mmX, -8);
  }

  void drawBall(boolean release)
  {
    if (!release)
    {

      location = new PVector(mouseX, yAxis - 40);
      fill(0);
      strokeWeight(2);
      stroke(100, 100, 255);
      ellipse(location.x, location.y, 15, 15);
    }
    else
    {
      location.add(velocity);
      fill(0);
      strokeWeight(2);
      stroke(100, 100, 255);
      ellipse(location.x, location.y, 15, 15);
    }
  }

  void checkEdges(Brick [] bricks)
  {

    for(int i = 0; i < bricks.length; i++)
    {
      if(bricks[i].getSolid() != false)
      if(location.x > bricks[i].getBrickPosition().x - 30 && location.x < bricks[i].getBrickPosition().x + 30 && location.y < 70)
      {
        bricks[i].setSolid(false);
        velocity.y = velocity.y * -1;
      }
    }
    
    if (location.x < 0 || location.x > width)
    {
      velocity.x = velocity.x * -1;
      velocity.y = velocity.y * 1;
    }
    else if (location.y < 0)
    {
      velocity.x = velocity.x * 1;
      velocity.y = velocity.y * -1;
    }

    else if ((location.x > (mouseX - 30) && location.x < (mouseX - 20) || 
      location.x  < (mouseX + 30) && location.x > (mouseX + 20)) && location.y > (yAxis - 40))
    {
      velocity.x = velocity.x * 1.3;
     
    if(velocity.x > 5)
    {
     velocity.x = 5;
    }

      velocity.y = velocity.y * -1;
    }

    else if ((location.x > mouseX - 20 && location.x  < mouseX + 20) && location.y > yAxis - 40)
    {
      velocity.x = velocity.x * 1;
      velocity.y = velocity.y * -1;
    }

    else if (location.y > yAxis - 40)
    {
      setup();
    }
  }

  void angle()
  {
    PVector newAngle = new PVector(1, 1);
    velocity.mult(newAngle, 1);
  }
}

class Brick
{
  boolean solid;
  PVector brickPosition;

  Brick(int i, int k)
  {
    solid = true;
    brickPosition = new PVector(i, k);
  }

  PVector getBrickPosition()
  {
    return brickPosition;
  }

  void setSolid(boolean value)
  {
    solid = value;
  }
  
  boolean getSolid()
  {
return solid;
  }
  
  void drawBricks(Brick [] bricks)
  {
    strokeWeight(2);
    stroke(255, 0, 0);
    for (int i = 0; i < bricks.length; i++)
    {
      if(bricks[i].solid != false)
      rect(bricks[i].brickPosition.x, bricks[i].brickPosition.y, 50, 20);
    }
  }
}



