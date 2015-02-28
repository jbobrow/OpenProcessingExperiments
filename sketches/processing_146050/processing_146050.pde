
// Joe Moceri
// Smooth Jump

private Player player;

void setup()
{
  size(600, 500);
  player = new Player(5, 5); // create our player with (jumpPower, fallingIntensity)
  frameRate(60);
  fill(0);
}

void draw()
{
  background(255);
  player.update();
}

public class Player
{ 
  private int pX, pY; // our coords
  private float jumpPower, fallingPower, fallingIntensity, ojPower; 
  public boolean jumping = false, grounded = true;

  public Player(float jP, float fI)
  {
    pX = width / 2 - 20;
    pY = height - 70;
    jumpPower = jP; // Jump Power is how high we can jump
    ojPower = jP;
    fallingPower = 0; // Falling Power is a container for when we begin to fall back down 
    fallingIntensity = fI; // Falling Intensity determines how fast we fall
  }
  public void update()
  {
    rect(pX, pY, 30, 60);
    updateJump();
  }
  
  private void updateJump()
  {
    if(jumping) // if we're jumping ..
    { // so long as we're above the negative value of our falling intensity ..
      if(jumpPower > -fallingIntensity) jumpPower -= 0.25; // reduce it by a quarter
      float power = jumpPower < 0 ? pow(jumpPower, 2) * -1 : pow(jumpPower, 2); // and whether or not we're +/- .. 
      player.pY -= power; // .. update our y coord accordingly
    }
    else // otherwise if we're falling back down (player choice) ..
    { 
      if(player.pY < height - 70) // if we haven't hit ground ..
      { // continue to fall using our updated fallingPower
        player.pY += pow(fallingPower, 2);
        if(fallingPower < fallingIntensity) fallingPower += 0.25; // until we hit the fallingIntensity (max)
      }
    }
    checkForGround(); // and finally, check for ground
  }
  
  private void updateFalling()
  { // if our jump power is in the negative, set our falling power equal to it, to match up smoothly
    if(jumpPower <= 0) fallingPower = abs(jumpPower);
  }
  
  private void checkForGround()
  {
    if(player.pY >= height - 70) // if we're at ground ..
    {
      jumpPower = ojPower; // reset our jumping power to it's original value
      fallingPower = 0; // reset our falling power
      grounded = true; // set our flag
      player.pY = height - 70; // and make sure we're at ground
    }
  }
}

void keyPressed()
{
  if(key == ' ' && player.grounded) // allow us to jump once
  { // and set our flags
    player.grounded = false;
    player.jumping = true;
  }
}

void keyReleased()
{
  if(key == ' ' && player.jumping) // and allow us to let go once 
  { // update our falling value, and set our flag
    player.updateFalling();
    player.jumping = false;
  }
}


