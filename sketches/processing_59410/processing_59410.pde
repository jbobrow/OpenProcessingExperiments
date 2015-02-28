
//Mathville By: Raymond Fang, Mei Deng and Daniel Wong\\

boolean upPressed, leftPressed, downPressed, rightPressed;

//Objects
PImage s1;
float x1=random(125, 900);
float y1=random(75, 600);

PImage s2;
float x2=random(125, 900);
float y2=random(75, 600);

PImage s3;
float x3=random(125, 900);
float y3=random(75, 600);

PImage s4;
float x4=random(125, 900);
float y4=random(75, 600);

PImage s5;
float x5=random(125, 900);
float y5=random(75, 600);

PImage s6;
float x6=random(125, 900);
float y6=random(75, 600);

//Objects L2
PImage c1;
float xc1=random(125, 900);
float yc1=random(75, 600);

PImage c2;
float xc2=random(125, 900);
float yc2=random(75, 600);

PImage c3;
float xc3=random(125, 900);
float yc3=random(75, 600);

PImage c4;
float xc4=random(125, 900);
float yc4=random(75, 600);

PImage c5;
float xc5=random(125, 900);
float yc5=random(75, 600);

PImage c6;
float xc6=random(125, 900);
float yc6=random(75, 600);

PImage c7;
float xc7=random(125, 900);
float yc7=random(75, 600);

//Objects L3
PImage b1;
float xb1=random(125, 900);
float yb1=random(75, 600);

PImage b2;
float xb2=random(125, 900);
float yb2=random(75, 600);

PImage b3;
float xb3=random(125, 900);
float yb3=random(75, 600);

PImage b4;
float xb4=random(125, 900);
float yb4=random(75, 600);

PImage b5;
float xb5=random(125, 900);
float yb5=random(75, 600);

PImage b6;
float xb6=random(125, 900);
float yb6=random(75, 600);

/*
PImage b7;
float xb7=random(900);
float yb7=random(600);
*/

//Player
PImage cart;
float playerx=random(600);
float playery=random(600);

//float playerx2=random(600);
//float playery2=random(600);

PImage AWWWYEAHHH;
PImage MARKET;
PImage COFFEE;
PImage MONEY;
PImage LevelUp;


//Sound
 import ddf.minim.*;
 Minim minim;
 AudioSample intro;
 AudioSample losing;
 AudioSample winning;
 

//float prizeX, prizeY;

int screenNumber;
PFont font;
int aScore;
int bScore;

void setup()
{
  size(1000, 700);
  smooth();
  noStroke();
  rectMode(CENTER);
  smooth();
  AWWWYEAHHH = loadImage("Instructions.png");
  font = loadFont("KristenITC-Regular-20.vlw");
  textFont(font, 20);

  MARKET = loadImage("stage1 copy.jpg");
  COFFEE = loadImage("stage2 copy.jpg");
  MONEY =  loadImage("stage3 copy.jpg");
  LevelUp = loadImage ("Level up.png");

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


  //Cart
  cart = loadImage("cart.png");
   /*
   {
   minim = new Minim(this);
   intro = minim.loadSample("nyancat.mp3", 5000); 
   intro.trigger();
   }
   {
   minim = new Minim(this);
   losing = minim.loadSample("losing.mp3", 5000);
   }
   {
   minim = new Minim(this);
   winning = minim.loadSample("winning(1).mp3", 5000);  
   }
   */
  screenNumber = 0;
}

void draw()
{ 
  background(0);
  if (screenNumber == 0)
  {
    displayInstructions();
    aScore = 0;
  }
  else if (screenNumber == 1)
  {
    image(MARKET, 0, 0);
    movePlayers();
    drawPlayers();
    drawObjects();
    displayScore();
    checkPosition();
    //moving.close();
  }
  else if (screenNumber == 2)
  {
    //    losing.trigger();
    font = loadFont("KristenITC-Regular-20.vlw");
    textFont(font, 32);  
    fill(#2D19A5);
    text("You Lose!", 220, 200);
        minim.stop();
        super.stop();
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
    displayScoreL2();
    checkPositionL2();
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
    displayScoreL3();
    checkPositionL3();
  }

  else if (screenNumber == 7)
  { 
    //background(#FF0000);
    font = loadFont("KristenITC-Regular-20.vlw");
    textFont(font, 32);
    fill(#2D19A5);
    text("You Win!", 220, 200);
    fill(#F0F507);
    text("Play Again", 225, 400);
    //if (mousePressed) screenNumber = 1;
  }
}




  void displayInstructions()
  {
    image(AWWWYEAHHH, 0, 0);

    if (mousePressed) screenNumber = 1;
  }

  void displayScore()
  {
    fill(#FF0000);
    textFont (font, 20);
    text("Collect all the apples then find the mean of all the apples!", 10, 70);
    if (aScore > 119)
    {
      screenNumber = 3;
    }
  }

  void displayScoreL2()
  {
    fill(#FF0000);
    textFont (font, 20);
    text("Collect all the coffee cups then find the median of all the coffee cups!", 10, 70);
    if (bScore > 199)
    {
      screenNumber = 5;
    }
  }

  void displayScoreL3()
  {
    fill(#FF0000);
    textFont (font, 20);
    text("Collect all the money bags then find the median of all the money bags!", 10, 70);
    if (bScore > 199)
    {
      screenNumber = 7;
    }
  }

  void checkPosition()
  {
    if (abs(x1 - playerx) < 30 && abs(y1 - playery) < 50)
    {
      //aScore += 20;
      x1=100;
      y1=100;
      //screenNumber = 2;
    }
    if (abs(x2 - playerx) < 30 && abs(y2 - playery) < 50)
    {
      //aScore += 20;
      x2=100;
      y2=200;
      //screenNumber = 2;
    }
    if (abs(x3 - playerx) < 30 && abs(y3 - playery) < 50)
    {
      //aScore += 20;
      x3=100;
      y3=300;
      //screenNumber = 2;
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
      //screenNumber = 2;
    }
    if (abs(x6 - playerx) < 20 && abs(y6 - playery) < 50)
    {
      //aScore += 20;
      x6=100;
      y6=600;
      //screenNumber = 2;
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
        screenNumber = 6;
    }
    if (abs(xc2 - playerx) < 30 && abs(yc2 - playery) < 30)
    {
      //bScore += 20;
      xc2=100;
      yc2=170;
    }
    if (abs(xc3 - playerx) < 30 && abs(yc3 - playery) < 30)
    {
      //bScore += 20;
      xc3=100;
      yc3=255;
    }
    if (abs(xc4 - playerx) < 30 && abs(yc4 - playery) < 30)
    {
      //bScore += 20;
      xc4=100;
      yc4=340;
    }
    if (abs(xc5 - playerx) < 30 && abs(yc5 - playery) < 30)
    {
      //bScore += 20;
      xc5=100;
      yc5=425;
    }
    if (abs(xc6 - playerx) < 30 && abs(yc6 - playery) < 30)
    {
      // bScore += 20;
      xc6=100;
      yc6=510;
    }
    if (abs(xc7 - playerx) < 30 && abs(yc7 - playery) < 30)
    {
      //bScore += 20;
      xc7=100;
      yc7=590;
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
        screenNumber = 7;
    }
    if (abs(xb2 - playerx) < 30 && abs(yb2 - playery) < 30)
    {
      //aScore += 20;
      xb2=100;
      yb2=200;
    }
    if (abs(xb3 - playerx) < 30 && abs(yb3 - playery) < 30)
    {
      //aScore += 20;
      xb3=100;
      yb3=300;
    }
    if (abs(xb4 - playerx) < 30 && abs(yb4 - playery) < 30)
    {
      //aScore += 20;
      xb4=100;
      yb4=400;
    }
    if (abs(xb5 - playerx) < 30 && abs(yb5 - playery) < 30)
    {
      //aScore += 20;
      xb5=100;
      yb5=500;
    }
    if (abs(xb6 - playerx) < 30 && abs(yb6 - playery) < 30)
    {
      //aScore += 20;
      xb6=100;
      yb6=600;
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



  void keyPressed()
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
  }


