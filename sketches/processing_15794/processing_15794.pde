
/**
 * Hippie Man! The Adventures Of The Hippie Crusader!
 * by Savannah Franklin
 * 11/2/10
 */


// keypress tracking
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;

// coordinates
int x, y;
int u, v;
float prizeX, prizeY;

// other stuff
int screenNumber;
int aScore, bScore;
int speed;
PFont font;
PImage hippieman;
PImage woodstock;
PImage surrealism;
PImage surrealismpuppies;
void setup()
{
  //println("start of setup");

  size(600, 600);
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("LucidaSans-32.vlw");
  hippieman = loadImage("hippieman.gif");
  woodstock = loadImage("woodstock.gif");
  surrealism = loadImage("surrealism.gif");
  surrealismpuppies = loadImage("surrealismpuppies.gif");

  textFont(font, 32);

  x = y = width/4;
  u = v = 3*width/4;
  prizeX = prizeY = width/2;

  screenNumber = 0;

  //println("end of setup");
}

void draw()
{ 
  //println("start of draw");
  background(0);
  if (screenNumber == 0)
  {
    image(woodstock, 0, 0);
    displayInstructions();
  }
  else if (screenNumber == 1)
  {
   image(surrealism, 1, 1);
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
    image(surrealismpuppies, 0, 0);
    displayWinner();
  }
}

void displayWinner()
{
  aScore = 100;
  bScore = 100;
  //fill(0, 200, 0);
  surrealismpuppies = loadImage("surrealismpuppies.gif");
  text("You're A Hippie!", 50, 100);
  if (mousePressed) screenNumber = 1;
}

void displayInstructions()
{
  fill(0, 200, 0);
  text("Hippie Man: The Hippie Crusader", 50, 100);
  fill(0, 179, 0);
  text("Click To Begin Adventure...", 50, 200);
  //Orange H
  fill(255, 173, 4);
  text("H", 25, 300);

  //Lime Green I
  fill(184, 255, 4);
  text("I", 100, 300);

  //Purple P
  fill(184, 0, 212);
  text("P", 150, 300);

  //Blue P
  fill(0, 0, 255);
  text("P", 200, 300);

  //Light Blue I
  fill(0, 255, 255);
  text("I", 250, 300);

  //Pink E
  fill(255, 43, 212);
  text("E", 300, 300);

  //Red S
  fill(255, 43, 0);
  text("S", 375, 300);

  //Bright Yellow T
  fill(255, 255, 0);
  text("T", 425, 300);

  //Orange Y
  fill(255, 133, 0);
  text("Y", 465, 300);

  //Bubblegum Pink L
  fill(255, 133, 181);
  text("L", 500, 300);

  //Teal E
  fill(0, 128, 255);
  text("E", 550, 300);

  if (mousePressed) screenNumber = 1;
}

void displayScore()
{
  fill(255);
  text("Lava Lamp: " + aScore, 10, 100);
  text("Hippie Man: " + bScore, 300, 100);
}

void setSpeedLevel()
{
  speed = 2;
  if(aScore>50 || bScore>50) speed = 15;
  if(aScore>100|| bScore>100) speed = 20;
  if(aScore>125 || bScore>125) speed = 25;
  if(aScore>150 || bScore>150) screenNumber = 2;
}

void checkPlayerOverlap()
{
  if (dist(x,y, u,v) < 15)
  {
    aScore--;
    bScore--;
  }
}

void drawPrize()
{
  fill(0,200,0);
  rect(prizeX, prizeY, 20, 20);
}

void checkPrize()
{
  if(abs(x - prizeX) < 15 && abs(y - prizeY) < 15)
  {
    aScore += 10;
    placePrizeRandomly();
  }
  if(abs(u - prizeX) < 15 && abs(v - prizeY) < 15)
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

  image(hippieman,u,v);
  //rect(x,y,300,300);
  //prizeX, prizeY);
  //prizeX-5, prizeY-5);

  /*EVIL LAVA LAMP
   fill(255, 105, 18);
   ellipse(x,y, 12,12);
   fill(255, 105, 18);
   */

  //orange
  fill(255, 112, 0);
  ellipse(x+random(-18,18), y+random(-15,15), 120,20);

  //pp yellow
  fill(255, 232, 0);
  ellipse(x+random(-18,181), y+random(-15,15), 20,120);

  //purple
  fill(90, 33, 179);
  ellipse(x+random(-18,18), y+random(-15,115), 20,20);

  //magenta
  fill(255, 0, 186);
  ellipse(x+random(-118,18), y+random(-115,15), 20,20);

  //seafoam green
  fill(194, 255, 186);
  ellipse(x+random(-18,18), y+random(-15,15), 120,20);

  //neon green
  fill(194, 255, 0);
  ellipse(x+random(-18,181), y+random(-115,15), 20,20);

  //red
  fill(255, 0, 1);
  ellipse(x+random(-18,18), y+random(-15,15), 20,210);

  //light blue
  fill(55, 200, 255);
  ellipse(x+random(-18,181), y+random(-15,115), 120,20);

  //pink
  fill(255, 200, 255);
  ellipse(x+random(-181,18), y+random(-115,15), 20,210);
  
  fill(255, 112, 0);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //pp yellow
  fill(255, 232, 0);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //purple
  fill(90, 33, 179);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //magenta
  fill(255, 0, 186);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //seafoam green
  fill(194, 255, 186);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //neon green
  fill(194, 255, 0);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //red
  fill(255, 0, 1);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //light blue
  fill(55, 200, 255);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

  //pink
  fill(255, 200, 255);
  ellipse(x+random(-18,18), y+random(-15,15), 20,20);

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
}


