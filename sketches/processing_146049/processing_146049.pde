
// Joe Moceri
// Pong

private boolean intro = true; 
private Player playerOne, playerTwo;
private Ball ball;

void setup()
{
  playerOne = new Player(1); // create our players with
  playerTwo = new Player(2); // an unique id 
  ball = new Ball();
  size(800, 600);
  frameRate(60);
}

void draw()
{
  updateGame();
  if(!intro) ball.update();
}

public void updateGame()
{
  background(0);
  playerOne.update();
  playerTwo.update();
  ball.drawBall();
}

public class Ball
{
  private int leftBounds, rightBounds; // our bounds determine where to check for hits
  private float bX, bY, yOffset, speed, multiplier;
  private boolean rightHit;
  
  public Ball()
  {
    rightHit = false;
    leftBounds = 20;
    rightBounds = 0;
    bX = 40;
    bY = 0;
    yOffset = 0;
    speed = 5;
    multiplier = 3;
  }
  
  public void drawBall()
  {
    fill(255, 0, 0);
    ellipse(bX, bY, 20, 20);
  }
  
  public void update()
  {
    bX = rightHit ? bX - speed : bX + speed; // move the ball left or right, depending on what was hit last
    bY += yOffset; // .. and depending on our yOffset, move it up or down every frame
  
    if(bX <= 0 || bX > 800) bX = 400; // reset if we go outside the screen x bounds ..
    if((bY - 10) <= 0 || (bY + 10) >= 600) yOffset *= -1; // or send it back if outside the screen y bounds

    checkForHit(rightHit ? playerOne : playerTwo); // pass in the player to check for depending on what was hit last
  }
  
  private void setBounds(int tLeft, int tRight)
  {
    leftBounds = tLeft;
    rightBounds = tRight;
  }
  
  private void checkForHit(Player p)
  {
    if(bY >= p.tY && bY <= p.bY && bX < leftBounds && bX > rightBounds) // if we're within range of the chosen player paddle..
    {
      float mid_point = p.tY + 30; // get the midpoint of the paddle
      speed = 5; // reset speed
      yOffset = (bY - mid_point) / multiplier; // based on the midpoint, get the yOffset (+/- determines direction)
      speed += abs(yOffset); // add in the value to our speed
      rightHit = p.id == 1 ? false : true; // set our hit flag dependent on the players unique id
      setBounds(rightHit ? 20 : 800, rightHit ? 0 : 780); // .. and set the bounds based on that flag
    }
  }
}

public class Player
{
  private float pX, tY, bY;
  public int id;

  public Player(int tId)
  {
    id = tId;
    pX = id == 1 ? 0 : 790; // set our x coord based on our unique id
    tY = 0;
    bY = 0;
  }

  public void update()
  {
    tY = mouseY;
    bY = mouseY + 60;
    fill(255);
    rect(pX, tY, 10, 60);
  }
}

void mouseMoved()
{
  if(intro) ball.bY = mouseY + 30;
}

void mouseDragged()
{
  if(intro) ball.bY = mouseY + 30;
}

void mouseReleased()
{
  if(intro)
  {
    intro = false; // once the game starts .. 
    ball.rightHit = true; // .. send the ball right for the first hit
  }
}


