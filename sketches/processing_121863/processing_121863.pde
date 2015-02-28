
PImage collisionImage;
PImage displayImage;
PImage man, man2, currentMan, fallingMan, fallingMan2, jumpingMan, jumpingMan2;
float r=250, g=250, b=250, countRed=5, countGreen=3, countBlue=7;
float score=0, time=20;
float posy=0;
float playerX = 100;
float playerY = 10;
float playerVelocityY = 0;
float playerVelocityX = 0;
float playerSpeed = 3;
float playerJumpSpeed = -5;
float playerSize = 40;
float upKey;
float rightKey;
float downKey;
float leftKey;
boolean onGround, gameover=false;
float gravity = .3;
int platNum=2500;
Plats[] forms= new Plats[2500];
int coinNum=1000;
Coin[] coins= new Coin[1000];
PImage plat1, plat2, plat3, plat4, plat5, money;
float startTextx, startTexty, transparent, arrow=35, arrparent1=0, arrparent2=0;
boolean started=false, helped=false, ending=false, starting=false, helping=false, movLeft=true, waved=true;
float endCount=0;
float armR=0, armL=0, legR=0, legL=0;
float manx, many;
//////////////////////////////////////////////////////////////////////////////////
void setup()
{
  size(800, 800);
  //textMode(CENTER);
  startTextx=width/2;
  startTexty=height/2;
  manx=width/2;
  many=height/2;
  transparent=0;
  money = requestImage("moneys1.png");
  man = requestImage("stickman.png");
  man2 = requestImage("stickman2.png");
  currentMan = requestImage("stickman.png");
  fallingMan = requestImage("crushed.png");
  fallingMan2 = requestImage("crushed2.png");
  jumpingMan = requestImage("jump.png");
  jumpingMan2 = requestImage("jump2.png");
  for (int i=0; i<platNum; i++)
  {
    forms[i] = new Plats();
    forms[i].Plats();
  }
  for (int i2=0; i2<coinNum; i2++)
  {
    coins[i2] = new Coin();
    coins[i2].Coin();
  }
  plat1=requestImage("platform1.png");
  plat2=requestImage("platform2.png");
  plat3=requestImage("platform3.png");
  plat4=requestImage("platform4.png");
  plat5=requestImage("platform5.png");
  keyCode=RIGHT;
}
//////////////////////////////////////////////////////////////////////////////////
void draw()
{
  if (!started&&!helped)
  {
    startScreen();
  }
  if (started)
  {
    play();
  }
  if (helped)
  {
    help();
  }
  if (ending)
  {
    quit();
  }
}
//////////////////////////////////////////////////////////////////////////////////
void play()
{
  if(!gameover)
  {
  //pushMatrix();
  //scale(2);
  fill(0);

  playerVelocityY += gravity;
  playerVelocityX = (rightKey - leftKey) * playerSpeed;
  float nextY = playerY + playerVelocityY;
  float nextX = playerX + playerVelocityX;

  //boolean tempOnGround = false;
  onGround = false;
  if (plat5.width > 0)
  {
    background(255);
    textSize(30);

    for (int p=0;p<platNum;p++)
    {
      forms[p].display();
    }
    for (int p2=0;p2<coinNum;p2++)
    {
      coins[p2].display();
    }
  }

  playerX += playerVelocityX;
  playerY += playerVelocityY;
  if (playerVelocityY<0)
  {
    if (currentMan==man)
    {
      image(jumpingMan, playerX-10, playerY-40, playerSize-10, playerSize);
    }
    else
    {
      image(jumpingMan2, playerX-10, playerY-40, playerSize-10, playerSize);
    }
  }
  if (playerVelocityY<=5 && playerVelocityY>=0)
  {
    image(currentMan, playerX-3, playerY-38, playerSize-30, playerSize);
  }
  if (playerVelocityY>5)
  {
    if (currentMan==man)
    {
      image(fallingMan, playerX-3, playerY-40, playerSize, playerSize-20);
    }
    else
    {
      image(fallingMan2, playerX-3, playerY-40, playerSize, playerSize-20);
    }
  }
  fill(r, g, b);
  textSize(30);
  text("Score: "+(int)score, 100, 30);
  text("Time: "+(int)time, 700, 30);
  if (time<=0||playerY>800)
  {
    gameover=true;
  }
  time-=.0138;
  }
  else
  {
    fill(r, g, b);
    textSize(50);
    text("GAME OVER!",width/2,height/2);
    text("Your Score: "+(int)score, width/2, height/2+50);
    text("Press r to restart",width/2,height/2+100);
    
  }
  
  r+=countRed;
  g+=countGreen;
  b+=countBlue;
  if (r>=255)
  {
    countRed*=-1;
  }
  if (r<=0)
  {
    countRed*=-1;
  }
  if (g>=255)
  {
    countGreen*=-1;
  }
  if (g<=0)
  {
    countGreen*=-1;
  }
  if (b>=255)
  {
    countBlue*=-1;
  }
  if (b<=0)
  {
    countBlue*=-1;
  }
  if (keyPressed&&key=='r')
  {
    gameover=false;
    score=0;
    for (int i3=0; i3<platNum; i3++)
  {
    forms[i3].Plats();
  }
  for (int i4=0; i4<coinNum; i4++)
  {
    coins[i4].Coin();
  }
    playerX=100;
    playerY=10;
    time=20;
  }
if (keyCode==BACKSPACE)
  {
    transparent=0;
    started=false;
    starting=false;
    keyCode=RIGHT;
  }
  
  //popMatrix();
  //posy--;
}

////////////////////////////////////////////////////////////////////////////////////

void startScreen()
{
  noStroke();
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  fill(255, 0, 0, transparent);
  textAlign(CENTER);
  textSize(40);
  text("Stick Man: The Adventure - Part 1", startTextx, startTexty-50);
  fill(0, 0, 0, transparent-100);
  textSize(20);
  text("Start", startTextx, startTexty);
  text("Help", startTextx, startTexty+50);
  text("Quit", startTextx, startTexty+100);
  transparent++;
  if (mousePressed)
  {
    transparent=255;
    if (mouseX>startTextx-25&&mouseX<startTextx+25&&mouseY<startTexty+5&&mouseY>startTexty-20)
    {
      started=true;
    }
    if (mouseX>startTextx-25&&mouseX<startTextx+25&&mouseY<startTexty+55&&mouseY>startTexty+30)
    {
      helped=true;
    }
    if (mouseX>startTextx-25&&mouseX<startTextx+25&&mouseY<startTexty+105&&mouseY>startTexty+80)
    {
      ending=true;
    }
  }
  if (keyCode==UP)
  {
    starting=true;
    helping=false;
  }
  if (keyCode==DOWN)
  {
    helping=true;
    starting=false;
  }
  if (keyCode==BACKSPACE||mousePressed)
  {
    starting=false;
    helping=false;
    keyCode=RIGHT;
  }
  if (starting)
  {
    fill(255, 0, 0, arrparent1);
    beginShape();
    vertex(startTextx-arrow, startTexty-15);
    vertex(startTextx-arrow+10, startTexty-8);
    vertex(startTextx-arrow, startTexty);
    endShape();
    arrparent1+=3;
    if (arrow<=35)
    {
      movLeft=true;
    }
    if (arrow>=45)
    {
      movLeft=false;
    }
    if (movLeft)
    {
      arrow+=.2;
    }
    if (!movLeft)
    {
      arrow-=.2;
    }
    if (keyCode==ENTER)
    {
      started=true;
    }
  }
  if (!starting)
  {
    arrparent1=0;
  }
  if (helping)
  {
    fill(255, 0, 0, arrparent2);
    beginShape();
    vertex(startTextx-arrow, startTexty+35);
    vertex(startTextx-arrow+10, startTexty+42);
    vertex(startTextx-arrow, startTexty+50);
    endShape();
    arrparent2+=3;
    if (arrow<=35)
    {
      movLeft=true;
    }
    if (arrow>=45)
    {
      movLeft=false;
    }
    if (movLeft)
    {
      arrow+=.2;
    }
    if (!movLeft)
    {
      arrow-=.2;
    }
    if (keyCode==ENTER)
    {
      transparent=0;
      helped=true;
    }
  }
  if (!helping)
  {
    arrparent2=0;
  }
}
//////////////////////////////////////////////////////////////////////////////////
void quit()
{
  background(255);
  wave();
  stroke(0);
  fill(255);
  ellipse(manx, many-10, 10, 10);
  line(manx, many, manx, many+30);
  pushMatrix();
  translate(manx, many);
  rotate(armR);
  line(0, 0, 20, 10);
  popMatrix();
  line(manx, many, manx-20, many+10);
  line(manx, many+30, manx+10, many+70);
  line(manx, many+30, manx-10, many+70);
  endCount++;
  if (endCount > 100)
  {
    exit();
  }
  if (keyCode==BACKSPACE)
  {
    transparent=0;
    started=false;
    starting=false;
    keyCode=RIGHT;
  }
}
//////////////////////////////////////////////////////////////////////////////////
void wave()
{
  if (armR<=radians(-90))
  {
    waved=false;
  }
  if (armR>=radians(0))
  {
    waved=true;
  }
  if (waved)
  {
    armR+=radians(-10);
  }
  else
  {
    armR+=radians(10);
  }
}
//////////////////////////////////////////////////////////////////////////////////
void help()
{
  fill(255, 255, 255, 10);
  rect(0, 0, width, height);
  fill(r, g, b, transparent);
  r+=countRed;
  g+=countGreen;
  b+=countBlue;
  if (r>=255)
  {
    countRed*=-1;
  }
  if (r<=0)
  {
    countRed*=-1;
  }
  if (g>=255)
  {
    countGreen*=-1;
  }
  if (g<=0)
  {
    countGreen*=-1;
  }
  if (b>=255)
  {
    countBlue*=-1;
  }
  if (b<=0)
  {
    countBlue*=-1;
  }
  text("Use the arrow keys to move, space to jump", width/2, startTexty-100);
  text("Climb the floating platforms to avoid the Void", width/2, startTexty);
  text("Collect coins for points", width/2, startTexty+100);
  text("The backspace key always returns to the menu", width/2, startTexty+200);
  transparent++;
  if (keyCode==BACKSPACE)
  {
    transparent=0;
    helped=false;
    helping=false;
    keyCode=RIGHT;
  }
}

//////////////////////////////////////////////////////////////////////////////////

void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 0;
      currentMan=man2;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 0;
      currentMan=man;
    }
    if (keyCode == UP)
    {
      upKey = 0;
    }
    if (keyCode == DOWN)
    {
      downKey = 0;
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////
void keyPressed()
{
  if (key == ' ')
  {
    if (onGround == true)
    {
      playerVelocityY = playerJumpSpeed;
    }
  }


  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      leftKey = 1;
      currentMan=man2;
    }
    if (keyCode == RIGHT)
    {
      rightKey = 1;
      currentMan=man;
    }
    if (keyCode == UP)
    {
      upKey = 1;
    }
    if (keyCode == DOWN)
    {
      downKey = 1;
    }
  }
}

////////////////////////////////////////////////////////////////////////////

class Plats
{
  float x, y, drop;
  int numb;
  void Plats()
  {
    numb=int(random(1, 5));
    x=random(1, 790);
    y=random(-10000, 800);
    drop=random(.1, .5);
  }
  void display()
  {
    if (numb==1)
    {
      image(plat1, x, y);
      if (playerX < x+64 && playerX >= x && playerVelocityY > 0 && playerY > y && playerY < y+13)
      {
        playerVelocityY = 0;
        onGround = true;
      }
    }
    else if (numb==2)
    {
      image(plat2, x, y);
      if (playerX < x+44 && playerX >= x && playerVelocityY > 0 && playerY > y && playerY < y+14)
      {
        playerVelocityY = 0;
        onGround = true;
      }
    }
    else if (numb==3)
    {
      image(plat3, x, y);
      if (playerX < x+44 && playerX >= x && playerVelocityY > 0 && playerY > y && playerY < y+14)
      {
        playerVelocityY = 0;
        onGround = true;
      }
    }
    else if (numb==4)
    {
      image(plat4, x, y);
      if (playerX < x+44 && playerX >= x+12 && playerVelocityY > 0 && playerY > y && playerY < y+11)
      {
        playerVelocityY = 0;
        onGround = true;
      }
      if (playerX < x+11 && playerX >= x && playerVelocityY > 0 && playerY > y+11 && playerY < y+21)
      {
        playerVelocityY = 0;
        onGround = true;
      }
      if (playerX < x+11 && playerX >= x && playerVelocityY == 0 && playerVelocityX > 0)
      {
        playerVelocityX = 0;
      }
    }
    else if (numb==5)
    {
      image(plat5, x, y);
      if (playerX < x+44 && playerX >= x+32 && playerVelocityY > 0 && playerY > y+11 && playerY < y+21)
      {
        playerVelocityY = 0;
        onGround = true;
      }
      if (playerX < x+32 && playerX >= x && playerVelocityY > 0 && playerY > y && playerY < y+11)
      {
        playerVelocityY = 0;
        onGround = true;
      }
      if (playerX < x+11 && playerX >= x && playerVelocityY == 0 && playerVelocityX > 0)
      {
        playerVelocityX = 0;
      }
    }
    else if (numb==0)
    {
      image(man, x, y);
    }
    y+=drop;
  }
}

////////////////////////////////////////////////////////////////////

class Coin
{
  int alpha=255;
  float x, y, drop;
  boolean dead=false;
  void Coin()
  {
    x=random(1, 790);
    y=random(-10000, 800);
    drop=random(.1, .5);
  }
  void display()
  {
    if (!dead)
    {
      image(money, x, y);
      if (playerX < x+20 && playerX >= x && playerY > y && playerY < y+50)
      {
        score+=50;
        dead=true;
      }
      y+=drop;
    }
    else
    {
      fill(0, 0, 0, alpha);
      textSize(20);
      text("+50", x, y);
      alpha-=5;
    }
  }
}



