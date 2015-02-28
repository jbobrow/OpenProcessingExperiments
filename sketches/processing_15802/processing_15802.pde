
// keypress tracking
//Stephanie Tom
//6th period
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;
boolean enterPressed;

// coordinates
int b;
int x, y;
int u, v;
float prizeX, prizeY;

// other stuff
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage circleimage, image2, image3, image4,bg1,bg2,bg3;

void setup()
{

  size(700, 700);
  smooth();
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  font = loadFont("LucidaSans-32.vlw");
  circleimage = loadImage ("circleimage.gif");
  image2 = loadImage("image2.gif");
  bg1= loadImage ("bg1.gif");
  bg2= loadImage ("bg2.gif");
  bg3= loadImage ("bg3.gif");






  image3 = loadImage("image3.gif");

  textFont(font, 32);

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = width/2;

  screenNumber = 0;
}

void draw()
{ 
  background(0);
  if (screenNumber == 0)
    //image(bg3, 350, 350);
  {
    displayInstructions();
    aScore = bScore = 0;
  }
  else if (screenNumber == 1)

  {
    image(bg2, 350, 350);
    //image(bg3, 350, 350);
    movePlayers();
    drawPlayers();

    checkPrize();
    drawPrize();

    checkPlayerOverlap();
    setSpeedLevel();
    displayScore();
  }
  else if (screenNumber == 2)

  {
    displayWinner();
    image(bg3, 350, 350);
    fill(0);
    text("WINNER WINNER WINNER!!!!", 220, 250);
    text("WINNER WINNER WINNER!!!!", 218, 250);
    text("WINNER WINNER WINNER!!!!", 216, 250);
    fill(50);
    text("WINNER WINNER WINNER!!!!", 215, 250);
    fill(0);
    text(" press enter to play again :3",200,300);
    text(" press enter to play again :3",198,300);
    text(" press enter to play again :3",196,300);

    fill(50);
    text(" press enter to play again :3",194,300);
  }
}

void displayWinner()
{
  aScore = 200;
  bScore = 200;
  fill(0, 200, 0);


  text("WINNER WINNER WINNER!!!!", 50, 100);

  if (enterPressed) screenNumber = 0;
}


void displayInstructions()
{
  //background(mouseX, mouseY);
  image(bg1,350,350);
  fill(0, 200, 0);
  text("Give Me That!!!", 150, 100);
  text("Give Me That!!!", 152, 100);
  text("Give Me That!!!", 154, 100);
  text("Give Me That!!!", 155, 100);
  fill(255);
  text("@Click to play@", 150, 300);
  text("@Click to play@", 152, 300);
  text("@Click to play@", 154, 300);
  text("@Click to play@", 155, 300);
  text("@Click to play@", 156, 300);
  fill(0,79,100);
  text(" Directions:",30,500);
  text("Kyoko Kime: W,A,S,D",240,500);
  text("Cuddles the monkey: UP,DOWN,RIGHT,LEFT", 10, 550);
  if (mousePressed) screenNumber = 1;
}

void displayScore()
{


  fill(0);
  text("Kyoko Kime: " + aScore, 10, 40);
  text("Cuddles: " + bScore, 400, 40);
}

void setSpeedLevel()
{
  speed = 4;
  if(aScore>50 || bScore>40) speed = 20;
  if(aScore>150 || bScore>150) speed = 30;
  if(aScore>200 || bScore>200) screenNumber = 2;
}

void checkPlayerOverlap()
{
  if (dist(x,y, u,v) < 16)
  {
    aScore--;
    bScore--;
  }
}

void drawPrize()
{
  fill(242,240,153);
  image(circleimage, prizeX-5,prizeY-5);
}

void checkPrize()
{
  if(abs(x - prizeX) < 100 && abs(y - prizeY) < 100)
  {
    aScore += 10;
    placePrizeRandomly();
  }
  if(abs(u - prizeX) < 100&& abs(v - prizeY) < 100)
  {
    bScore += 10;
    placePrizeRandomly();
  }
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
}

void drawPlayers()
{
  fill(255,50);

  image(image2, x,y);
  //rect(x,y,300,300);

  image(image3, u,v); 

  //rect(u,v,100,100);
}

void movePlayers()
{
  if (wPressed) y -= speed;
  if (aPressed) x -= speed;
  if (sPressed) y += speed;
  if (dPressed) x += speed;
  if (rightPressed) u += speed;
  if (leftPressed)  u -= speed;
  if (upPressed)    v -= speed;
  if (downPressed)  v += speed;
}

void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
  if (keyCode == ENTER) enterPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
  if (keyCode == ENTER) enterPressed = false;
}


