
// sound
Maxim maxim;
AudioPlayer player;
int musicSpeed;

// images
PImage img;
PImage coin;

// variables for drawing rectangles
int Xcorners [];
int Ycorners [];
int widths [];
int heights [];
String type [];
int counter;
int maxRects;
boolean oneCycle;
boolean newRect;

// variables for game character
int charX;
int charY;
int xSpeed;
int ySpeed;
int charSize;
int floor;
int ceiling;
int leftWall;
int rightWall;
int jumpTimer;
int fallTimer;
boolean jumping;
int pcharX;
int pcharY;
int ppcharX;
int ppcharY;

// scoring
int score;
int coinSize;
int numCoins;
int coinsGotten = 0;
int timeBonus = 0;
int coinValue = 5;

// drawing
int oldCounter;
int oldPosX[];
int oldPosY[];
int oldPosRGB[][];
int followers;



boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;
boolean keyb = false;

boolean scoreSucker = false;
boolean fallen = false;
boolean gameComplete = false;
boolean first = true;

void setup() {
  
  // background music
  maxim = new Maxim(this);
  player = maxim.loadFile("WoofWoof.wav");
  player.setLooping(true);
  musicSpeed = 1;
  
  
  ellipseMode(CENTER);  // Set ellipseMode to CENTER
  size (800, 600);
  background(255);
  maxRects = 5;
  numCoins = 30;
  oldCounter = 0;
  followers = 40;
  
  // background & coin images
  img = loadImage("skyBG.jpg");
  coin = loadImage("Coin.png");
  
  
  // set up empty arrays
  oldPosX = new int[followers];
  oldPosY = new int[followers];
  oldPosRGB = new int[followers][3];
  Xcorners = new int[maxRects+numCoins];
  Ycorners = new int[maxRects+numCoins];
  widths = new int[maxRects+numCoins];
  heights = new int[maxRects+numCoins];
  type = new String[maxRects+numCoins];
  coinSize = 10;
  
  // fill type array
  for (int x = 0; x < maxRects+numCoins; x++)
  {
    if (x < maxRects)
    {
      type[x] = "platform";
    }
    else
    {
      type[x] = "coin";
    }
  }
  
  for (int x = maxRects; x < maxRects+numCoins; x++)
  {
    Xcorners[x] = random(10, width-20);
    Ycorners[x] = random(10, height-40);
    widths[x] = coinSize;
    heights[x] = coinSize;
  }
  
  // default variables
  counter = 0;
  oneCycle = false;
  newRect = false;
  charSize = 0;
  xSpeed = 5;
  ySpeed = 5;
  charX = width/2;
  charY = height;
  floor = height;
  ceiling = 0;
  leftWall = 0;
  rightWall = width;
  jumpTimer = 0;
  jumping = false;
  fallTimer = 0;
  
  score = 0;
}

void draw() {
  
  player.play();
  player.speed(musicSpeed);
  
  //////////// draw platforms and coins ////////////
  fill(255,249,249);
  noStroke();
  rect(0,0,width,height);
  // draw background image
  image(img, 0, 0, width, height);
 
  // draw rectangles and coins
  for (int x = 0; x < maxRects+numCoins; x++)
  {
    //fill(255-x*(255/(maxRects-1)));
    fill(0);
    stroke(0);
    // insures that the rectangle that will next be deleted is white
    if (((x == (counter)) && (oneCycle == true) && (newRect == false)) || ((mousePressed) && (x == (advanceCounter(counter)))))
    {
      fill(255);
    }
    // draw coins
    if (x >= maxRects)
    {
      fill (250, 250, 0);
      //ellipse(Xcorners[x],Ycorners[x],coinSize,coinSize);
      image(coin,Xcorners[x]-coinSize/2, Ycorners[x]-coinSize/2, coinSize, coinSize);
    }
    else
    {
      rect(Xcorners[x], Ycorners[x], widths[x], heights[x]);
    }
  }
  //////////////////////////////////////////////////
  
  // character drawing
  if (keyPressed) {
     if (keyb)
     {
      charX = mouseX;
      charY = mouseY;
      charSize = 50;
      jumpTimer = 0;
      if ((charX != width/2 || charY != height) && scoreSucker == false)
      {
        if (score < 5*coinValue)
        {
          score = 0;
        }
        else
        {
          score = score - 5*coinValue;
          scoreSucker = true;
        }
      }
    }
    if (!keyb)
    {
     if (keyleft)
      { left(); }
      if (keyright)
      { right(); }
      if (keyup)
      {
        if (jumpTimer == 0)
        {
          jumping = true;
        }
      }
    }
  }
  
  // gravity if not on floor
  if (!keyb)
    {
    if ((charY + charSize + ySpeed + fallTimer/(2*ySpeed)+1) < floor)
    {
      charY = charY + ySpeed + fallTimer/(2*ySpeed);
      fallTimer++;
    }
    else
    {
      fallTimer = 0;
      if ((charY + charSize) > (floor+1))
      {
        charY = charY-1;
        //charY = floor-charSize-1;
      }
    }
  }
  
  //reset horizontal walls every time
  floor = height;
  ceiling = 0;
  leftWall = 0;
  rightWall = width;
  
  
  //////////////////////// collision detection ////////////////////////
  for (int x = 0; x < maxRects; x++)
  {
    
    // set floor
    if (((charX > (Xcorners[x])) || ((charX+charSize) > Xcorners[x])) && (charX < (Xcorners[x]+widths[x])))
    {
      if (((charY+charSize) > (Ycorners[x])) && ((charY+charSize) < (Ycorners[x]+heights[x])))
      {
        //charY = charY - ySpeed;
        if (type[x] == "platform")
        {
          floor = Ycorners[x];
        }
      }
    }
    
    // set ceiling
    if (((charX > (Xcorners[x])) || ((charX+charSize) > Xcorners[x])) && (charX < (Xcorners[x]+widths[x])))
    {
      if ((charY+((ySpeed/((jumpTimer+1)/8)+2))) > (Ycorners[x] + heights[x]))
      {
        if (ceiling < Ycorners[x] + heights[x])
        {
          if (type[x] == "platform")
          {
            ceiling = Ycorners[x] + heights[x];
          }
        }
      }
    }
    
    // set right wall
    for (int y = 0; y <= xSpeed; y++)
    {
      if ((charX+charSize == Xcorners[x]-y) || (charX+charSize == Xcorners[x]+y))
      {
        if (((charY+charSize) > (Ycorners[x])) && (charY < (Ycorners[x]+heights[x])))
        {
          //charX -= xSpeed;
          if (type[x] == "platform")
          {
            rightWall = Xcorners[x];
            y = xSpeed+1;
          }
        }
      }
    }
    
    // set left wall
    for (int y = 0; y <= xSpeed; y++)
    {
      if ((charX == (Xcorners[x]+widths[x]-y)) || (charX == (Xcorners[x]+widths[x]+y)))
      {
        if (((charY+charSize) > (Ycorners[x])) && (charY < (Ycorners[x]+heights[x])))
        {
          //charX += xSpeed;
          if (type[x] == "platform")
          {
            leftWall = Xcorners[x]+widths[x];
            y = xSpeed+1;
          }
        }
      }
    }
  }
  // coins
  if (!keyb)
  {
    for (int x = maxRects; x < maxRects+numCoins; x++)
    {
      if ((charY < (Ycorners[x]+coinSize/2)) && (charY+charSize > (Ycorners[x]-coinSize/2)))
      {
        if ((charX < (Xcorners[x]+coinSize/2)) && (charX +charSize > (Xcorners[x]-coinSize/2)))
        {
          score += coinValue;
          Xcorners[x] = -20;
          coinsGotten++;
          // increase music speed for every coin acquired
          musicSpeed = musicSpeed + 1/(numCoins*2);
        }
      }
    }
  }
  ////////////////////////////////////////////////////////////////////////
  
  
  // jumping
  if (jumping)
  {
    if (charY > ceiling)
    {
      jump();
    }
    else
    {
      jumpTimer = 25;
    }
  }
  
  // draw character, text, etc.
  noStroke();
  fill(255, 30, 30);
  rect(charX, charY, charSize, charSize);
  fill(139, 69, 19);
  rect(0, height-15, width, 15);
  fill(0);
  
  // if hit bottom, can't jump & display stuck in mud
  if (charY+charSize >= height-15 && charSize != 0)
  {
    jumpTimer = 25;
    textSize(14);
    text("You're stuck in the mud!", 25, 50); 
    text("Press 'b' to replace your character (and lose 25 points)", 25, 100);
  }
  
  // instructional text before player starts playing
  if (charX==width/2 && charY == height)
  {
    textSize(14);
    text("Click and drag to create a platform", 25, 50);
    text("Then press 'b' to place your character", 25, 100); 
    text("You can create up to " + maxRects + " platforms at a time", 25, 150); 
    text("Try to collect all the coins!", 25, 200);
  }
  fill(0);
  textSize(32);
  text(score, width - 50, 35);
  
  pcharX=charX;
  pcharY=charY;
  ppcharX = pcharX;
  ppcharY = pcharY;
  
  if (oldCounter % 2 == 0)
  {
    oldPosX[oldCounter/2] = charX;
    oldPosY[oldCounter/2] = charY;
  }
  
  // draw red trail
  if (charSize != 0)
  {
    for (int x = 0; x < followers; x++)
    {
        //fill(oldPosRGB[x][0], oldPosRGB[x][1], oldPosRGB[x][2], 150-(150/20 * x));
        int alphaModifier = 1;
        alphaModifier = sqrt((abs(charX-oldPosX[x])/2 + abs(charY-oldPosY[x])/2))/1.5;
        fill(random(250,255), random(29,31), random(29,31), 255/alphaModifier);
        //fill(255/alphaModifier, 30/alphaModifier, 30/alphaModifier, 255/alphaModifier);
        if (keyleft)
        {
          ellipse(oldPosX[x]+charSize/2, oldPosY[x]+charSize/2, random(19,21), random(19,21));
        }
        else
        {
          ellipse(oldPosX[x]+charSize/2, oldPosY[x]+charSize/2,random(19,21), random(19,21));      
        }
    }
  }
  
  oldCounter++;
  if (oldCounter > (followers*2))
  {
    oldCounter = 0;
  }
  
  // check if all coins gotten
  if (coinsGotten == numCoins)
  {
    gameComplete = true;
  }
  
  // game win screen
  if (gameComplete)
  {
    fill(255,249,249);
    noStroke();
    rect(0,0,width,height);
    fill(0);
    textAlign(CENTER);
    textSize(64);
    text("You Won!", width/2, height/2-25); 
    textSize(32);
    if (first)
    {
      timeBonus = (int)(10000000/millis());
      score += timeBonus;
      first = false;
    }
    text("You got a time bonus of " + timeBonus + " points!", width/2, height/2+25);
    text("Your total score was: " + score + " points!", width/2, height/2+75);
  }
}




///////////////////////////////////////////
void mousePressed() {
  Xcorners[counter] = mouseX;
  Ycorners[counter] = mouseY;
  widths[counter] = 0;
  heights[counter] = 0;
  newRect = true;
}

void mouseDragged() {
  widths[counter] = mouseX-Xcorners[counter];
  heights[counter] = mouseY-Ycorners[counter];
}

void mouseReleased() {
  if (widths[counter] < 0)
  {
    Xcorners[counter] = Xcorners[counter]+widths[counter];
    widths[counter] = widths[counter] * -1;
  }
  
  if (heights[counter] < 0)
  {
    Ycorners[counter] = Ycorners[counter]+heights[counter];
    heights[counter] = heights[counter] * -1;
  }
  
  counter = advanceCounter(counter);
  if (counter == 0)
  { oneCycle = true; }
  newRect = false;
}


// processing multiple keys presses from http://wiki.processing.org/w/Multiple_key_presses
void keyPressed() {
   if (key == CODED) {
    if (keyCode == UP) keyup = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true; 
  } 
  if (key == 'b' || key == 'B') 
  {
    keyb = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false; 
  }
  if (key == 'b' || key == 'B') 
  {
    keyb = false;
    scoreSucker = false;
  }
}

int advanceCounter(int counter)
{
  int output = counter;
  if ((output+1) < maxRects)
  {
    output ++;
  }
  else
  {
    output = 0;
  }
  return output;
}

void jump()
{
  /*if (jumpTimer == 0)
  {
    beforeJumpX = charX;
    beforeJumpY = charY;
    prevBeforeJumpX = charX;
  }
  if (jumpTimer == 20)
  {
    midJumpX = charX;
    midJumpY = charY;
  }*/
  if (jumpTimer < 25)
  {
    charY -= ySpeed/((jumpTimer+1)/8)+2;
    jumpTimer++;
  }
  if (((charY + charSize) > floor) && (jumpTimer > 24))
  {
    jumpTimer = 0;
    jumping = false;
    //afterJumpX = charX;
    //afterJumpY = charY;
  }
}

void left()
{
  if (charX-xSpeed > leftWall)
  {
    charX -= xSpeed;
  }
  else
  {
    charX = leftWall+1;
  }
}

void right()
{
  if (charX+charSize+xSpeed < rightWall)
  {
    charX += xSpeed;
  }
  else
  {
    charX = rightWall-1-charSize;
  }
}


