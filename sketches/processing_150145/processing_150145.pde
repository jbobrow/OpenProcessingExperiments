
/*****************************
* Akash Levy and Thomas Chang
* Jumpy Block
*
* Based on Flappy Bird.
*****************************/


//Define width and height of screen
final int screenWidth = 400, screenHeight = 600;

//Player who will be navigating the barriers
class Player
{
  public final static float x = 70, size = 50, jumpSpeed = 7, maxSpeed = 15, gravity = 0.3;
  public float y = 200, vSpeed = jumpSpeed;
  public boolean dead = false;
  
  void updatePosition()
  {
    //Update position and speed
    y -= vSpeed;
    vSpeed -= gravity;
    
    //Keep position and speed in check
    if (vSpeed < -maxSpeed)
      vSpeed = -maxSpeed;
    if (y < 0)
    {
      y = 0;
      vSpeed = 0;
    }
    
    //If hit ground, end game
    if ((y+size) >= screenHeight)
    {
      y = screenHeight - size;
      vSpeed = 0;
      mode = "end";
    }
  }
  
  void drawPlayer()
  {
    //Draw the player in red
    fill(255, 0, 0);
    rect(x, y, size, size);
  }
  
  void checkCollision(Barrier barrier)
  {
    boolean xInRange, yInTopRange, yInBottomRange;
    xInRange = (x+size) > barrier.x && x < (barrier.x + barrier.thickness);
    yInTopRange = y < barrier.gapY;
    yInBottomRange = (y + size) > (barrier.gapY + barrier.gapHeight);
    if (xInRange && (yInTopRange || yInBottomRange))
      dead = true;
  }
}

//Barriers that will be obstructing the player
class Barrier
{
  public final static float distanceBetweenBarriers = 300, gapBoundaryThreshold = 30;
  public final float gapHeight = 3.4*Player.size, thickness = 1.5*Player.size;
  public float x = screenWidth, gapY = 0, speed = 2.25;
  
  public Barrier()
  {
    //Set position of gap to a reasonable random value
    gapY = random(gapBoundaryThreshold, screenHeight-gapBoundaryThreshold-gapHeight);
  }
  
  void drawBarrier()
  {
    //Draw the top and bottom of the barrier in white
    fill(255, 255, 255);
    rect(x, 0, thickness, gapY);
    rect(x, gapY + gapHeight, thickness, screenHeight - gapY - gapHeight);
  }
  
  void updatePosition()
  {
    //Move barriers forward at a constant speed
    x -= speed;
  }
}

//Define objects and global variables
Player player;
ArrayList<Barrier> barriers;
int score;
String mode;

void setup()
{
  //Set up screen size, rectangle mode and frame rate
  size(400, 600);
  rectMode(CORNER);
  frameRate(60);
  
  //Initialize objects and global variables
  barriers = new ArrayList<Barrier>();
  barriers.add(new Barrier());
  score = 0;
  player = new Player();
  mode = "play";
}

void draw()
{
  //Set background to black
  background(0);
  
  //Act according to stage in game
  if (mode == "play")
    playGame();
  else if (mode == "end")
    {
    delay(1000);
    endGame();
  }
  else if (mode == "restart")
  {
    delay(2000);
    setup();
  }
  else
    throw new RuntimeException("Invalid mode.");
}

void keyPressed()
{
  //If you press the space bar, player jumps
  if (key == ' ' && !player.dead)
    player.vSpeed = player.jumpSpeed;
}

void playGame()
{
  //Reset score before counting
  score = 0;
  
  //Draw each of the barriers and check whether the player has hit one
  for (Barrier barrier : barriers)
  {
    if (!player.dead)
      barrier.updatePosition();
    barrier.drawBarrier();
    player.checkCollision(barrier);
    
    //Count how many barriers the player has gone past for scoring
    if (player.x > (barrier.x + barrier.thickness))
      score++;
  }
  
  //Update the position and draw the player
  player.updatePosition();
  player.drawPlayer();
  
  //Add new barriers if necessary
  addBarriers();
  
  //Display score
  displayScore();
}

void endGame()
{
  //Display "Wasted" on screen in large red letters
  textSize(64);
  fill(255, 0, 0);
  text("Wasted", screenWidth/2-32*3.5, screenHeight/2);
  mode = "restart";
}

void addBarriers()
{
  //If the newest barrier gets past a certain point on the screen, create a new barrier
  Barrier newestBarrier = barriers.get(barriers.size()-1);
  if (newestBarrier.x <= screenWidth-Barrier.distanceBetweenBarriers)
    barriers.add(new Barrier());
}

void displayScore()
{
  //Display the score in the top-left corner
  textSize(32);
  fill(0, 255, 0);
  text(score, 15, 40);
}


