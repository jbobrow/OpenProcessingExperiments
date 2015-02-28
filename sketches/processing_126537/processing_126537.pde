
// Extra Features
// Scoreboard - keeps score
// Timer - Keeps track of how long you have been playing for
// Finish - Tells you the winner

PFont myFont;
 
String uI = "", pass = "pong";
boolean matched = false;

int x = 400, y = 300, speedX = 4, speedY = -4;
int l = 0, r = 0, s = 00, m = 0;
int yy = width/2;

void setup()
{
  size(800, 600);
  background (0);
  frameRate(60);
  myFont = loadFont("MonotypeCorsiva-48.vlw");
  textFont(myFont, 15);
}

//First the home screen, if the word PONG is entered, the game begins.
//All of the functions are then called upon until someone gets 5 goals.
//Then the finish function is called on and the game has to be reset to play gain.
void draw()
{
  pass();
  if (matched == true)
  {
    background(0, 255, 255);
    centerLine();
    drawPaddles();
    ballBounce();
    scoreBoard();
    timer();
    if (l == 5 || r == 5)
    {
      finish();
    }
  }
  
}

//This is the home screen.
//It displays the info about the game and the controls.

void pass ()
{
  background(255, 0, 255);
  textAlign(CENTER);
  textSize(32);
  fill(255);
  rect(30, 10, 480, 110);
  rect(310, 440, 480, 110);
  fill(0);
  rect(0, 400, 30, 60);
  rect(width-30, 200, 30, 60);
  ellipse(100, 350, 15, 15);
  text("Player 1", 260, 40);
  text("Paddle on the Left is controlled" ,260, 70);
  text("by the mouse moving up and down", 260, 100);
  fill(10);
  text("First to Five, Be ready!", width/2, height/2-90);
  fill(255);
  text("If you type ' pong ' you might get a game", width/2, height/2-30);
  text("Try it: " + uI, width/2, height/2 + 30);
  fill(0);
  text("Player 2", 540, 470);
  text("Paddle on the Right is controlled" ,540, 500);
  text("by the up and down arrow keys", 540, 530);
}

//This is the code for the user input.
//It is case sensitive.

void keyPressed()
{
  if (key != CODED)
  {
    uI += key;
  }
  if(uI.equals(pass))
  {
    matched = true;
  }
}

//This contains the code to make the ball bounce and move.
//The most challenging part was getting the ball to recognise that it had hit a paddle.
//Then I realised to to use a coordinate e.g. mouseY and work off that.

void ballBounce()
{
  ellipse(x, y, 20, 20);
  x = x + speedX;
  y = y + speedY;
  if (y > height || y < 0)
  {
    speedY = speedY * -1;
  }
  if (x > width || x < 0)
  {
    speedX = speedX * -1;
    x = width/2;
    y = height/2;
  }
  if(y > mouseY - 30 && y < mouseY + 30 && x == 20)
  {
    speedX = speedX * -1;
  }
  if(y > yy && y < yy + 60 && x == width-20)
  {
    speedX = speedX * -1;
  }
}

//The paddles were easy to do. Just had to mess around with the code for a bit
//to get the paddles to stay on the screen. Also judging the speed for the right
//paddle had to be considered.
void drawPaddles()
{
  fill(0);
  if (mouseY > height - 30) mouseY = height - 30;
  if (mouseY < 30) mouseY = 30;
  rectMode(CENTER);
  rect (10, mouseY, 20, 60);
  rectMode(CORNER);
  rect (width-20, yy, 20, 60);
  if (keyPressed)
  {
    if (key == CODED)
    {
        if (keyCode == UP)
        {
          yy = yy - 6;
        }
        if (keyCode == DOWN)
        {
          yy = yy + 6;
        }
        if (yy < 0) yy = 0;
        if (yy > height-60) yy = height-60;
      }
   }
  
}

//The center line is a simple for loop that provides lines that are
//10 pixles long with a gap of 10 in between them.

void centerLine()
{
  for(int i = 0; i < width; i = i + 20)
  {
    line (width/2, i, width/2, i + 10);
  }
}

//This feature displays the score on the top of the screen.
//It increses by one every time the x coordinate is equal to 0 or the width.
//Its displayed at the top middle

void scoreBoard()
{
  if (x == width) l = l+1;
  if (x == 0) r = r+1;
  textSize(64);
  textAlign(CENTER);
  fill(255);
  text ((l + ":" + r), width/2, 50);
}

//This feature tells you how long you have been playing for.
//The challenge I had was to keep a m:ss format. When the seconds were less then 10 it would be 
//displayed as 0:1 and I wanted 0:01. I persisted with it and used an if statement to make it work

void timer()
{
  if (frameCount % 60 == 0 ) 
  {
    s = s + 1;
  }
  if (s == 60)
  {
    s = 0;
    m = m + 1;
  }
  if (s < 10) 
  {
    textSize(64);
    textAlign(CENTER);
    fill(255);
    text ((m+":0"+s), width/2, height-50);
  }
  if (s >= 10)
  { 
    textSize(64);
    textAlign(CENTER);
    fill(255);
    text ((m+":"+s), width/2, height-50);
  }
}

//This indicates the winner at the end of the game.
//I had to use delay to slow down the end so that the game would not continue on.

void finish()
{
  background(0);
  if (l == 5)
  {
    fill(255);
    textAlign(CENTER);
    text("Player 1 wins!", width/2, height/2);
    delay(2000);
  }
  if (r == 5)
  {
    fill(255);
    textAlign(CENTER);
    text("Player 2 wins!", width/2, height/2);
    delay(2000);
  }
}

