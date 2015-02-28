
// Joe Moceri
// Smooth Movement

private Player player;
private boolean left = false, right = false; // keep track of which keys are pressed

void setup()
{
  size(700, 400);
  player = new Player();
  frameRate(60);
}

void draw()
{
  background(255);
  player.update();
}

public class Player
{
  private float pX, pY, pW, pH, speed, maxSpeed;
  public boolean slowDown, movingRight, moving;
  
  public Player()
  {
    slowDown = true; // whenever the player isn't moving, they need to slow down
    movingRight = false; // for keeping track of the player forward direction
    moving = false;
    speed = 0;
    maxSpeed = 5;
    pX = width / 2 - 15;
    pY = height - 70;
    pW = 30;
    pH = 60;
  }
  
  public void update()
  {
    if(!moving) // change our direction only when we're not moving
    { // .. flag occurs when switching keys (left-right)
      if(left) player.changeDirection(false);
      else if(right) player.changeDirection(true);
    }
    
    fill(0);
    rect(pX, pY, pW, pH);
    changeSpeed();
  }
  
  public void changeDirection(boolean choice)
  { // if we're changin direction and not simply reapplying in the same direction ..
    if(movingRight != choice && speed > 0.25) speed *= -1; // reverse our speed
    
    movingRight = choice; // and set our flags
    moving = true;
    slowDown = false;
  }
  
  public void stopMoving()
  { // whenever we stop moving, either by a change in direction or key release ..
    speed = 1.5; // set our speed to a low value so we come to a halt much quicker
    moving = false; // and set our flags
    slowDown = true;
  }
  
  private void changeSpeed()
  { // whenever changing speeds, if we're slowing down decrement our speed until we hit zero
    if(slowDown) speed = speed > 0 ? speed - 0.15 : speed < 0 ? 0 : speed; // otherwise ..
    else speed = speed < maxSpeed ? speed + 0.15 : speed > maxSpeed ? maxSpeed : speed; // increase our speed until we hit maxSpeed
    
    pX = movingRight ? pX + speed : pX - speed; // and if we're moving left or right, set our x coord accordingly
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == LEFT) left = true;
    if(keyCode == RIGHT) right = true;
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    switch(keyCode)
    {
      case LEFT: 
        left = false;
        player.stopMoving();
        break;
      case RIGHT:
        right = false;
        player.stopMoving();
        break;
    }
  }
}


