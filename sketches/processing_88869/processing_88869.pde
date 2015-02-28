
// Projekt namn: Dodging game
// Name: The nine circles of Bullethell!

float _time_ratio = 1;
boolean _blur_enable = true;
boolean _p_slowdown = true; // Player not immune to time changes!

float tempDir = 0;
float timer = 0;
float shootAt = 1;

ColorControl colors;
Player player;
Projectiles projectiles;

void setup()
{
  size(480, 620);
  frameRate(60);
  noSmooth();
  
  colors = new ColorControl(2);
  player = new Player(width / 2, height / 2 + 50);
  projectiles = new Projectiles();
}

void draw()
{ 
  println("fps: " + str(round(frameRate)) + " time ratio: " + str(_time_ratio)  + " bullets: " + str(projectiles.bullets.size()));
  
  // Movement and collision checking!
  player.move();
  projectiles.moveAll();
  
  // Creation of new projectiles.
  if (_time_ratio > 0)
  {
     if (timer < shootAt)
     {
       timer +=  _time_ratio;
     }
     else
     {
       projectiles.createBullet(width / 2 + 100, 100, 180 + tempDir, 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       projectiles.createBullet(width / 2 + 100, 100, 180 + (180 + tempDir), 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       projectiles.createBullet(width / 2 + 100, 100, 180 + (90 + tempDir), 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       projectiles.createBullet(width / 2 + 100, 100, 180 + (270 + tempDir), 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       
       projectiles.createBullet(width / 2 - 100, 100, 180 - tempDir, 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       projectiles.createBullet(width / 2 - 100, 100, 180 - (180 + tempDir), 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       projectiles.createBullet(width / 2 - 100, 100, 180 - (90 + tempDir), 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       projectiles.createBullet(width / 2 - 100, 100, 180 - (270 + tempDir), 0, random(10, 15), 0.2, ceil(random(6, 7)), random(-0.2, 0.2));
       timer = 0;
       tempDir += 1.34;
     }
  }
  
  
  // Changing Color over time!
  colors.step();
  
  // Draw events!
  drawBackground();
  player.draw();
  projectiles.drawAll();
}

void drawBackground()
{
  float opacityRatio = 1;
  pushStyle(); 
  if (_blur_enable)
  {
    opacityRatio = 0.4;
    if (_time_ratio == 0)
    {
      opacityRatio = 0;
    }
  }
  fill(colors.background, opacityRatio * 255);
  noStroke();
  rect(0, 0, width, height);
  popStyle();
}

boolean circleCollision(float x1, float y1, float x2, float y2, float radius1, float radius2)
{
  float distance = dist(x1, y1, x2, y2);
  return radius1/2 + radius2/2 > distance;
}
class Bullet
{
  private float direction;
  private float directionAcc;
  private float speed;
  private float acceleration;
  private float speedLimit;
  private float hitRadius;
  
  private PVector position;
  private PVector velocity;
  private PVector finalVelocity;
  
  private boolean destroy = false;
  
  Bullet(float _x, float _y, float _dir, float _spd, float _size, float _acc, float _spdLimit, float _diracc)
  {
    direction = radians(_dir);
    directionAcc = radians(_diracc);
    speed = _spd;
    acceleration = _acc;
    speedLimit = _spdLimit;
    hitRadius = _size;
    
    position = new PVector(_x, _y);
    velocity = new PVector(cos(direction) * speed, -sin(direction) * speed);
    finalVelocity = new PVector(0, 0);
  } 
  
  public boolean collisionWithPlayer()
  {
    float distance = dist(position.x, position.y, player.position.x, player.position.y);
    return player.hitRadius + hitRadius / 2 > distance;
  }
  
  public boolean outsideRoom()
  {
    return position.x + hitRadius / 2 < 0 || position.x - hitRadius / 2 > width || position.y + hitRadius / 2 < 0 || position.y - hitRadius / 2 > height;
  }
  
  public void move()
  {
    // Changing direction
    direction += directionAcc * _time_ratio;
    
    // Acceleration
    if (acceleration != 0)
    {
      if (acceleration < 0)
      {
        if (speed > speedLimit)
        {
          speed += acceleration * _time_ratio;
        }
        else
        {
          speed = speedLimit;
        }
      }
      else if (acceleration > 0)
      {
        if (speed < speedLimit)
        {
          speed += acceleration * _time_ratio;
        }
        else
        {
          speed = speedLimit;
        }
      }
    }
    
    velocity.set(cos(direction) * speed, -sin(direction) * speed, 0);
    
    // Update Velocity
    finalVelocity.set(velocity.x * _time_ratio, velocity.y * _time_ratio, 0);
    
    // Move
    position.add(finalVelocity);
  }
  
  // Outline and Fill
  public void drawLayer1()
  {
    pushStyle();
    ellipseMode(CENTER);
    fill(colors.fill);
    stroke(colors.outline);
    ellipse(position.x, position.y, hitRadius, hitRadius);
    popStyle();
  }
  
  // Fill
  public void drawLayer2()
  {
    pushStyle();
    ellipseMode(CENTER);
    fill(colors.fill);
    noStroke();
    ellipse(position.x, position.y, hitRadius - 1, hitRadius - 1);
    popStyle();
  }
}
class ColorControl
{
  private int duration = 30;
  private float mergePerStep = 1 / float(duration);
  private float amount = 0;
  
  private color background;
  private color fill;
  private color outline;
  
  private color[][] colorLib = new color[3][3];
  
  public boolean changeColor = false;
  public int newColorIndex = 0;
  public int oldColorIndex = 0;
  
  ColorControl(int _colorIndex)
  {
    newColorIndex = _colorIndex;
    
    // Color Set 1 Andreas Blue
    colorLib[0][0] = #2F2D3E; // Background
    colorLib[0][1] = #50596C; // Fill
    colorLib[0][2] = #FCF2C6; // Outline
    
    // Color Set 2 Blue & pink
    colorLib[1][0] = #1C1A16;
    colorLib[1][1] = #444444;
    colorLib[1][2] = #ffffff;
    
    // Color Set 3 Strange
    colorLib[2][0] = #1C1A16;
    colorLib[2][1] = #855D00;
    colorLib[2][2] = #F7AD00;
    
    background = colorLib[newColorIndex][0];
    fill = colorLib[newColorIndex][1];
    outline = colorLib[newColorIndex][2];
    oldColorIndex = newColorIndex;
  }
  
  public void changeColor(int _colorIndex)
  {
    if (!changeColor && newColorIndex != _colorIndex)
    {
      oldColorIndex = newColorIndex;
      newColorIndex = _colorIndex;
      changeColor = true;
      amount = 0;
    }
  }
  
  public void step()
  {
    if (changeColor)
    {
      background = lerpColor(colorLib[oldColorIndex][0], colorLib[newColorIndex][0], amount);
      fill = lerpColor(colorLib[oldColorIndex][1], colorLib[newColorIndex][1], amount);
      outline = lerpColor(colorLib[oldColorIndex][2], colorLib[newColorIndex][2], amount);
        
      amount += mergePerStep;
      
      if (amount >= 1)
      {
        background = colorLib[newColorIndex][0];
        fill = colorLib[newColorIndex][1];
        outline = colorLib[newColorIndex][2];
        
        changeColor = false;
      } 
    }
  }
}
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      player.setMove(0, true);
    }
    else if (keyCode == DOWN)
    {
      player.setMove(1, true);
    }    
    else if (keyCode == LEFT)
    {
      player.setMove(2, true);
    }
    else if (keyCode == RIGHT)
    {
      player.setMove(3, true);
    }  
  }
  if (key == 'z' || key == 'Z')
  {
    player.setFocusMode(true);
  }
  if (key == 'x' || key == 'X')
  {
    colors.changeColor(floor(random(3)));
  }
}

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      player.setMove(0, false);
    }
    else if (keyCode == DOWN)
    {
      player.setMove(1, false);
    }    
    else if (keyCode == LEFT)
    {
      player.setMove(2, false);
    }
    else if (keyCode == RIGHT)
    {
      player.setMove(3, false);
    }  
  }
  if (key == 'z' || key == 'Z')
  {
    player.setFocusMode(false);
  }
}

void mouseDragged()
{
  _time_ratio = (mouseY / float(height));
  if (_time_ratio < 0)
  {
    _time_ratio = 0;
  }
  else if (_time_ratio > 1)
  {
    _time_ratio = 1;
  }
}
class Player
{
  private float hitRadius = 2;

  private PVector position;
  private PVector velocity;
  
  private float normalSpd = 5;
  private float focusSpd = 2.5;
  private float speed = normalSpd;
  
  private boolean moveUp = false;
  private boolean moveDown = false; 
  private boolean moveLeft = false; 
  private boolean moveRight = false; 
  
  Player(int _x, int _y)
  {
    position = new PVector(_x, _y);
    velocity = new PVector(0, 0);
  }
  
  public void setMove(int dir, boolean set)
  {
    switch (dir)
    {
      case 0:
        moveUp = set;
        break;
      case 1:
        moveDown = set;
        break;
      case 2:
        moveLeft = set;
        break;
      case 3:
        moveRight = set;
        break;
    }
  }
  
  public void setFocusMode(boolean focusMode)
  {
    if (focusMode)
    {
      speed = focusSpd;
    }
    else
    {
      speed = normalSpd;
    }
  }
  
  public void move()
  {
    float spd = speed;
    float dx = 0;
    float dy = 0;
    if (_p_slowdown)
    {
      spd *= _time_ratio;
    }
    
    if (!(moveUp && moveDown))
    {
      if (moveUp)
      {
        if ((position.y - hitRadius) - speed > 0)
        {
          dy = -spd;
        }
        else
        {
          position.y = 0 + hitRadius;
        }
      }
      if (moveDown)
      {
        if ((position.y + hitRadius) + speed < height)
        {
          dy = spd;
        }
        else
        {
          position.y = (height - 1) - hitRadius;
        }
      }
    }
    if (!(moveLeft && moveRight))
    {
      if (moveLeft)
      {
        if ((position.x - hitRadius) - speed > 0)
        {
          dx = -spd;
        }
        else
        {
          position.x = 0 + hitRadius;
        }
      }
      if (moveRight)
      {
        if ((position.x + hitRadius) + speed < width)
        {
          dx = spd;
        }
        else
        {
          position.x = (width - 1) - hitRadius;
        }
      }
    }
    velocity.set(dx, dy, 0);
    position.add(velocity);
  }
  
  public void draw()
  {
    pushStyle();
    ellipseMode(CENTER);
    fill(colors.fill);
    stroke(colors.outline);
    ellipse(position.x, position.y, (hitRadius * 2), (hitRadius * 2));
    noFill();
    ellipse(position.x, position.y, speed * (hitRadius * 2) * 2, speed * (hitRadius * 2) * 2);
    popStyle();
  }
}
class Projectiles
{
  public ArrayList bullets = new ArrayList();
  
  public void createBullet(float _x, float _y, float _dir, float _spd, float _size, float _acc, float _accLimit, float _diracc)
  {
    bullets.add(new Bullet(_x, _y, _dir, _spd, _size, _acc, _accLimit, _diracc));
  }
  
  public void destroyAll()
  {
    for (int i = bullets.size() - 1; i >= 0; i--)
    {
      bullets.remove(i);
    }
  }
  
  // This moves and checks collision with player for all projectiles!
  public void moveAll()
  {
    for (int i = bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = (Bullet) bullets.get(i);
      b.move();
      
      // Check wether to destroy or not!
      if (b.outsideRoom() || b.collisionWithPlayer())
      {
        bullets.remove(i);
      }
    }
  }
  
  public void drawAll()
  {
    // Drawing Bullets
    for (int i = 0; i < bullets.size(); i++)
    {
      Bullet b = (Bullet) bullets.get(i);
      b.drawLayer1();
    }  
    for (int i = 0; i < bullets.size(); i++)
    {
      Bullet b = (Bullet) bullets.get(i);
      b.drawLayer2();
    }  
  }
}


