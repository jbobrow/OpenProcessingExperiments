
int numFrames = 25;
int frame = 1;
PImage[] images = new PImage [numFrames];
PImage stage0;

//Hazards
PImage Enemy1;
float xh1=400;
float yh1=0;

PImage Enemy2;
float xh2=625;
float yh2=0;

PImage Enemy3;
float xh3=850;
float yh3=0;


void setup()
{
  size (1000, 700);
  noStroke();
  rectMode(CENTER);
  //  AWWWYEAHHH = loadImage("Instructions.png");
  stage0 = loadImage("stage0.jpg");
  MARKET = loadImage("stage1 copy.jpg");
  COFFEE = loadImage("stage2 copy.jpg");
  MONEY =  loadImage("stage3 copy.jpg");
  LevelUp = loadImage ("Level up.jpg");
  YOULOSE = loadImage ("youlose.jpg");
  YOUWIN = loadImage ("youwin.jpg");
  TRYAGAIN = loadImage ("tryagain.jpg");
  Enemy1 = loadImage ("enemy1.png");
  Enemy2 = loadImage ("enemy2.png");
  Enemy3 = loadImage ("enemy3.png");

  //Apples
  s1 = loadImage("s1.png");
  s2 = loadImage("s2.png");
  s3 = loadImage("s3.png");
  s4 = loadImage("s4.png");
  s5 = loadImage("s5.png");
  s6 = loadImage("s6.png");

  //Coffee Cups
  c1 = loadImage("c1.png");
  c2 = loadImage("c2.png");
  c3 = loadImage("c3.png");
  c4 = loadImage("c4.png");
  c5 = loadImage("c5.png");
  c6 = loadImage("c6.png");
  c7 = loadImage("c7.png");

  //Money Bags
  b1 = loadImage("m1.png");
  b2 = loadImage("m2.png");
  b3 = loadImage("m3.png");
  b4 = loadImage("m4.png");
  b5 = loadImage("m5.png");
  b6 = loadImage("m6.png");
  //b7 = loadImage("m7.png");



  //  Cart
  cart = loadImage("crosshair.png");
  /* {
   minim = new Minim(this);
   intro = minim.loadSample("nyancat.mp3", 5000); 
   intro.trigger();
   }
   */

  frameRate(15);
  images[0] = loadImage ("stage0_01.jpg");
  images[1] = loadImage ("stage0_02.jpg");
  images[2] = loadImage ("stage0_03.jpg");
  images[3] = loadImage ("stage0_04.jpg");
  images[4] = loadImage ("stage0_05.jpg");
  images[5] = loadImage ("stage0_06.jpg");
  images[6] = loadImage ("stage0_07.jpg");
  images[7] = loadImage ("stage0_08.jpg");
  images[8] = loadImage ("stage0_09.jpg");
  images[9] = loadImage ("stage0_10.jpg");
  images[10] = loadImage ("stage0_11.jpg");
  images[11] = loadImage ("stage0_12.jpg");
  images[12] = loadImage ("stage0_11.jpg");
  images[13] = loadImage ("stage0_10.jpg");
  images[14] = loadImage ("stage0_09.jpg");
  images[15] = loadImage ("stage0_08.jpg");
  images[16] = loadImage ("stage0_07.jpg");
  images[17] = loadImage ("stage0_06.jpg");
  images[18] = loadImage ("stage0_05.jpg");
  images[19] = loadImage ("stage0_04.jpg");
  images[20] = loadImage ("stage0_03.jpg");
  images[21] = loadImage ("stage0_02.jpg");
  images[22] = loadImage ("stage0_01.jpg");
  images[23] = loadImage ("stage0_00.jpg");
  images[24] = loadImage ("stage0_000.jpg");
}

void draw()
{
  background(0);
  noCursor();
  if (screenNumber == 0)
  {
    frame = (frame+1)% numFrames;
    background(255);
    image(stage0, 0, 0);
    image(images[frame], 255, 160);
    aScore = 0;
    if (mousePressed) screenNumber = 1;
  }
  else if (screenNumber == 1)
  {
    image(MARKET, 0, 0);
    movePlayers();
    drawPlayers();
    drawObjects();
    checkPosition();
    checkHazardsL1();
    moveHazards();
    drawHazards();
    //moving.close();
  }
  //Try Again Level 1
  else if (screenNumber == 2)
  {
    
    image(MARKET, 0, 0);
    image(TRYAGAIN, 0, 0);
    //    losing.trigger();
    /*  font = loadFont("KristenITC-Regular-20.vlw");
     textFont(font, 32);  
     fill(#2D19A5);
     text("Sorry Try Again!", 220, 200);
     fill(#F0F507);
     text("Click To Try Again", 225, 400);*/
    if (mousePressed) screenNumber = 1;
  }

  //Try Again Level 2
  else if (screenNumber == 11)
  {
    //    losing.trigger();
    /*    font = loadFont("KristenITC-Regular-20.vlw");
     textFont(font, 32);  
     fill(#2D19A5);
     text("Sorry Try Again!", 220, 200);
     fill(#F0F507);
     text("Click To Try Again", 225, 400);*/
    image(TRYAGAIN, 0, 0);
    if (mousePressed) screenNumber = 4;
  }

  //Try Again Level 3
  else if (screenNumber == 123)
  {
    //    losing.trigger();
    /*    font = loadFont("KristenITC-Regular-20.vlw");
     textFont(font, 32);  
     fill(#2D19A5);
     text("Sorry Try Again!", 220, 200);
     fill(#F0F507);
     text("Click To Try Again", 225, 400);*/
    image(TRYAGAIN, 0, 0);
    if (mousePressed) screenNumber = 6;
  }

  else if (screenNumber == 3)
  { 

    //background(#FF0000);
    /*
    font = loadFont("KristenITC-Regular-20.vlw");
     textFont(font, 32);
     fill(#2D19A5);
     text("Level Up!", 220, 200);
     fill(#F0F507);
     text("Continue", 225, 400);
     */
    image(LevelUp, 0, 0);
    if (mousePressed) screenNumber = 4;
  }
  else if (screenNumber == 4)
  {
    image(COFFEE, 0, 0);
    movePlayers();
    drawPlayers();
    drawObjectsL2();
    checkPositionL2();
    moveHazards();
    drawHazards();
    checkHazardsL2();
  }

  else if (screenNumber == 5)
  { 
    //background(#FF0000);
    /*
    font = loadFont("KristenITC-Regular-20.vlw");
     textFont(font, 32);
     fill(#2D19A5);
     text("Level Up!", 220, 200);
     fill(#F0F507);
     text("Continue", 225, 400);
     */
    image(LevelUp, 0, 0);
    if (mousePressed) screenNumber = 6;
  }

  else if (screenNumber == 6)
  {
    image(MONEY, 0, 0);
    movePlayers();
    drawPlayers();
    drawObjectsL3();
    checkPositionL3();
    moveHazards();
    drawHazards();
    checkHazardsL3();
  }

  else if (screenNumber == 7)
  { 
    //background(#FF0000);
    /*font = loadFont("KristenITC-Regular-20.vlw");
     textFont(font, 32);
     fill(#2D19A5);
     text("You Win!", 220, 200);
     fill(#F0F507);
     text("Play Again", 225, 400);*/
    image(YOUWIN, 0, 0);
    if (mousePressed) screenNumber = 0;
  }
}





void checkPosition()
{
  if (abs(x1 - playerx) < 30 && abs(y1 - playery) < 50)
  {
    //aScore += 20;
    x1=100;
    y1=100;
    if (abs(x1 - playerx) < 20 && abs(y1 - playery) < 50)
      screenNumber = 2;
  }
  if (abs(x2 - playerx) < 30 && abs(y2 - playery) < 50)
  {
    //aScore += 20;
    x2=100;
    y2=200;
    if (abs(x2 - playerx) < 20 && abs(y2 - playery) < 50)
      screenNumber = 2;
  }
  if (abs(x3 - playerx) < 30 && abs(y3 - playery) < 50)
  {
    //aScore += 20;
    x3=100;
    y3=300;
    if (abs(x3 - playerx) < 20 && abs(y3 - playery) < 50)
      screenNumber = 2;
  }
  if (abs(x4 - playerx) < 20 && abs(y4 - playery) < 50)
  {
    //aScore += 20;
    x4=100;
    y4=400;
    if (abs(x4 - playerx) < 20 && abs(y4 - playery) < 50)
      screenNumber = 3;
  }
  if (abs(x5 - playerx) < 20 && abs(y5 - playery) < 50)
  {
    //aScore += 20;
    x5=100;
    y5=500;
    if (abs(x5 - playerx) < 20 && abs(y5 - playery) < 50)
      screenNumber = 2;
  }
  if (abs(x6 - playerx) < 20 && abs(y6 - playery) < 50)
  {
    //aScore += 20;
    x6=100;
    y6=600;
    if (abs(x6 - playerx) < 20 && abs(y6 - playery) < 50)
      screenNumber = 2;
  }
}

void checkPositionL2()
{
  if (abs(xc1 - playerx) < 30 && abs(yc1 - playery) < 30)
  {
    //bScore += 20;
    xc1=100;
    yc1=85;
    if (abs(xc1 - playerx) < 30 && abs(yc1 - playery) < 30)
      screenNumber = 5;
  }
  if (abs(xc2 - playerx) < 30 && abs(yc2 - playery) < 30)
  {
    //bScore += 20;
    xc2=100;
    yc2=170;
    if (abs(xc2 - playerx) < 20 && abs(yc2 - playery) < 50)
      screenNumber = 5;
  }
  if (abs(xc3 - playerx) < 30 && abs(yc3 - playery) < 30)
  {
    //bScore += 20;
    xc3=100;
    yc3=255;
    if (abs(xc3 - playerx) < 20 && abs(yc3 - playery) < 50)
      screenNumber = 5;
  }
  if (abs(xc4 - playerx) < 30 && abs(yc4 - playery) < 30)
  {
    //bScore += 20;
    xc4=100;
    yc4=340;
    if (abs(xc4 - playerx) < 20 && abs(yc4 - playery) < 50)
      screenNumber = 11;
  }
  if (abs(xc5 - playerx) < 30 && abs(yc5 - playery) < 30)
  {
    //bScore += 20;
    xc5=100;
    yc5=425;
    if (abs(xc5 - playerx) < 20 && abs(yc5 - playery) < 50)
      screenNumber = 11;
  }
  if (abs(xc6 - playerx) < 30 && abs(yc6 - playery) < 30)
  {
    // bScore += 20;
    xc6=100;
    yc6=510;
    if (abs(xc6 - playerx) < 20 && abs(yc6 - playery) < 50)
      screenNumber = 11;
  }
  if (abs(xc7 - playerx) < 30 && abs(yc7 - playery) < 30)
  {
    //bScore += 20;
    xc7=100;
    yc7=590;
    if (abs(xc7 - playerx) < 20 && abs(yc7 - playery) < 50)
      screenNumber = 11;
  }
}

void checkPositionL3()
{
  if (abs(xb1 - playerx) < 30 && abs(yb1 - playery) < 30)
  {
    //aScore += 20;
    xb1=100;
    yb1=100;
    if (abs(xb1 - playerx) < 30 && abs(yb1 - playery) < 30)
      screenNumber = 123;
  }
  if (abs(xb2 - playerx) < 30 && abs(yb2 - playery) < 30)
  {
    //aScore += 20;
    xb2=100;
    yb2=200;
    if (abs(xb2 - playerx) < 30 && abs(yb2 - playery) < 30)
      screenNumber = 123;
  }
  if (abs(xb3 - playerx) < 30 && abs(yb3 - playery) < 30)
  {
    //aScore += 20;
    xb3=100;
    yb3=300;
    if (abs(xb3 - playerx) < 30 && abs(yb3 - playery) < 30)
      screenNumber = 7;
  }
  if (abs(xb4 - playerx) < 30 && abs(yb4 - playery) < 30)
  {
    //aScore += 20;
    xb4=100;
    yb4=400;
    if (abs(xb4 - playerx) < 30 && abs(yb4 - playery) < 30)
      screenNumber = 7;
  }
  if (abs(xb5 - playerx) < 30 && abs(yb5 - playery) < 30)
  {
    //aScore += 20;
    xb5=100;
    yb5=500;
    if (abs(xb5 - playerx) < 30 && abs(yb5 - playery) < 30)
      screenNumber = 123;
  }
  if (abs(xb6 - playerx) < 30 && abs(yb6 - playery) < 30)
  {
    //aScore += 20;
    xb6=100;
    yb6=600;
    if (abs(xb6 - playerx) < 30 && abs(yb6 - playery) < 30)
      screenNumber = 123;
  }
}

void drawObjects()
{ 
  image(s1, x1, y1);
  image(s2, x2, y2);
  image(s3, x3, y3);
  image(s4, x4, y4);
  image(s5, x5, y5);
  image(s6, x6, y6);
}

void drawObjectsL2()
{
  image(c1, xc1, yc1);
  image(c2, xc2, yc2);
  image(c3, xc3, yc3);
  image(c4, xc4, yc4);
  image(c5, xc5, yc5);
  image(c6, xc6, yc6);
  image(c7, xc7, yc7);
} 

void drawObjectsL3()
{
  image(b1, xb1, yb1);
  image(b2, xb2, yb2);
  image(b3, xb3, yb3);
  image(b4, xb4, yb4);
  image(b5, xb5, yb5);
  image(b6, xb6, yb6);
} 

void drawHazards()
{
  image(Enemy1, xh1, yh1);
  image(Enemy2, xh2, yh2);
  image(Enemy3, xh3, yh3);
}

void moveHazards()
{
  yh1 = yh1 + 15;
  yh2 = yh2 + 30;
  yh3 = yh2 + 25;
  if (yh1 > 700)
  {
    yh1 = 0;
  }
  if (yh2 > 700)
  {
    yh2 = 0;
  }
  if (yh3 > 700)
  {
    yh3 = 0;
  }
  if (yh1 > 700)
  {
    yh1 = yh1 + 0.5;
  }
  if (yh2 > 700)
  {
    yh2 = yh2 + 0.5;
  }
  if (yh3 > 700)
  {
    yh3 = yh3 + 0.5;
  }
}

void checkHazardsL1()
{
  if (abs(xh1 - playerx) < 50 && abs(yh1 - playery) < 50)
  {
    screenNumber = 2;
  }
  if (abs(xh2 - playerx) < 50 && abs(yh2 - playery) < 50)
  {
    screenNumber = 2;
  }
  if (abs(xh3 - playerx) < 50 && abs(yh3 - playery) < 50)
  {
    screenNumber = 2;
  }
}

void checkHazardsL2()
{
  if (abs(xh1 - playerx) < 50 && abs(yh1 - playery) < 50)
  {
    screenNumber = 11;
  }
  if (abs(xh2 - playerx) < 50 && abs(yh2 - playery) < 50)
  {
    screenNumber = 11;
  }
  if (abs(xh3 - playerx) < 50 && abs(yh3 - playery) < 50)
  {
    screenNumber = 11;
  }
}

void checkHazardsL3()
{
  if (abs(xh1 - playerx) < 50 && abs(yh1 - playery) < 50)
  {
    screenNumber = 123;
  }
  if (abs(xh2 - playerx) < 50 && abs(yh2 - playery) < 50)
  {
    screenNumber = 123;
  }
  if (abs(xh3 - playerx) < 50 && abs(yh3 - playery) < 50)
  {
    screenNumber = 123;
  }
}

void movePlayers()
{
  playerx = (mouseX);
  playery = (mouseY);
}

void drawPlayers()
{      
  image(cart, playerx, playery);
  if (playerx > 1000)
  {
    playerx = 1000 ;
  }

  if (playery > 1000 )
  {
    playery = 1000;
  }

  if (playerx < 0)
  {
    playerx = 0;
  }

  if (playery < 0)
  {
    playery = 0;
  }
}


/*void keyPressed()
 {
 if (keyCode == RIGHT) rightPressed = true;
 if (keyCode == LEFT)  leftPressed = true;
 if (keyCode == UP)    upPressed = true;
 if (keyCode == DOWN)  downPressed = true;
 }
 
 void keyReleased()
 {
 if (keyCode == RIGHT) rightPressed = false;
 if (keyCode == LEFT)  leftPressed = false;
 if (keyCode == UP)    upPressed = false;
 if (keyCode == DOWN)  downPressed = false;
 }*/





