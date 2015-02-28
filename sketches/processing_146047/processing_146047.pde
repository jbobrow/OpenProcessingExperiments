
// Joe Moceri
// Cycle Animation
/* 
  Key Numerics
   LEFT 37
   UP 38
   RIGHT 39
   DOWN 40
*/

private boolean moving = false, left = false, right = false, up = false, down = false;
private int maxFrames = 7, curDirection = 40;
private PImage[] topImg = new PImage[7], downImg = new PImage[7], leftImg = new PImage[7], rightImg = new PImage[7];
private Player player;

void setup()
{
  for(int i = 0; i < 7; i++) topImg[i] = loadImage("Top/Top" + "0" + (i+1) + ".png"); // store each animation direction
  for(int i = 0; i < 7; i++) downImg[i] = loadImage("Down/Down" + "0" + (i+1) + ".png"); // in an array
  for(int i = 0; i < 7; i++) leftImg[i] = loadImage("Left/Left" + "0" + (i+1) + ".png"); 
  for(int i = 0; i < 7; i++) rightImg[i] = loadImage("Right/Right" + "0" + (i+1) + ".png");
  
  size(400, 400);
  player = new Player();
  frameRate(60);
}

void draw()
{
  background(255);
  player.draw_player();
}

public class Player 
{
  private int pX, pY, curIndex, cycleRate;
  private PImage curImg;
  
  public Player()
  {
    cycleRate = 5;
    curIndex = 0;
    curImg = downImg[curIndex]; // we start off facing down
    pX = width / 2 - 75; // near the middle
    pY = height / 2 - 53; // of the screen
  }
  
  public void draw_player()
  {
    if(curDirection == 37) curImg = leftImg[curIndex]; // based on our key numeric ..
    if(curDirection == 39) curImg = rightImg[curIndex]; // switch to the image
    if(curDirection == 38) curImg = topImg[curIndex]; // that the player
    if(curDirection == 40) curImg = downImg[curIndex]; // forward direction is
    
    image(curImg, pX, pY); // and draw it
     
    cycleAnimation();
    
  }
  
  public void cycleAnimation()
  {
    if(!left && !right && !up && !down) curIndex = 0; // if no key is pressed, reset back to the first image
    else if(frameCount % cycleRate == 0) // .. otherwise cycle through at a rate of
    { // 60 / 5 = 20 frames per second
      curIndex++;
      if(curIndex == maxFrames) curIndex = 0; // and reset whenever we hit the last image
    }
  }
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == LEFT) left = true; // determine
    else if(keyCode == RIGHT) right = true; // which keys
    else if(keyCode == UP) up = true; // are currently
    else if(keyCode == DOWN) down = true; // being pressed,
    curDirection = keyCode; // and get the current numeric 
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == LEFT) left = false;
    else if(keyCode == RIGHT) right = false;
    else if(keyCode == UP) up = false;
    else if(keyCode == DOWN) down = false;
  } 
}


