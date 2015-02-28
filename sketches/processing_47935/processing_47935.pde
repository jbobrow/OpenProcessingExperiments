
//Edmond Chew + Kevin Nguyen
int screenNumber, lastHit, p0Bar, p1Bar, hp0, hp1, amountshot;
boolean winner1=false;
boolean winner2=false;
static int TITLE=0;
static int GAME=2;
static int WINNER=3;
ArrayList shots0, shots1;
Player[] player;
Glowsphere glowsphere;
hpBar lifeBar;
float timer0, timer1;

//Boolean
boolean flip;
//Floats
float cyber, valley;
float cybers, valleys;
float curtains;
float time;
float space, spaces;
//IMAGE
PImage S2Descriptions;
PImage S2Menu1;
PImage S2Menu2;
PImage S2Menucounter;
PImage S2;
PImage GWDoor1;
PImage GWDoor2;
PImage GWMenu;
PImage GWMenu2;
PImage GWMenu3;
PImage Player0;
PImage Player1;
PImage Glowsphere1;
PImage Glowsphere2;
PImage Glowsphere3;
PImage Glowsphere4;
PImage hpBar0;
PImage hpBar1;
PImage S4WinScreen;
PImage S5WinScreen;
PImage S3Gameboard;
PImage hpBarSymbol0;
PImage hpBarSymbol1;
PImage shot0;
PImage shot1;

void setup()
{
  size(800, 800); 
  lifeBar= new hpBar();
  player= new Player[2];
  for (int i=0; i<2; i++)
  {
    player[i] = new Player();
    player[i].i = i;
    if (i==0)
    {
      player[i].x=100;
      player[i].y=height/2;
    }
    else if (i==1)
    {
      player[i].x=width-100;
      player[i].y=height/2;
    }
  }
  rectMode(CENTER);

  glowsphere= new Glowsphere();
  glowsphere.x=width/2;
  glowsphere.y=random(height/2-20, height/2+20);
  glowsphere.movingMotion=round(random(1, 2));
  screenNumber=TITLE;
  glowsphere.changex=3;
  glowsphere.changey=3;
  glowsphere.costume=round(random(1, 4));
  hp1=5;
  hp0=5;
  shots0 = new ArrayList();
  shots1 = new ArrayList();

  //Image
  S2Descriptions = loadImage("S2Descriptions.png");
  S2Menu1 = loadImage("S2Menu1.png");
  S2Menu2 = loadImage("S2Menu2.png");
  S2Menucounter = loadImage("S2Menucounter.png");
  S2 = loadImage("S2.png");
  GWDoor1 = loadImage("GWDoor1.png");
  GWDoor2 = loadImage("GWDoor2.png");
  GWMenu2 = loadImage("GWMenu2.png");
  GWMenu3 = loadImage("GWmenu3.png");
  Player0 = loadImage("S3Player0.png");
  Player1 = loadImage("S3Player1.png");
  Glowsphere1 = loadImage("S3Ball1.png");
  Glowsphere2 = loadImage("S3Ball2.png");
  Glowsphere3 = loadImage("S3Ball3.png");
  Glowsphere4 = loadImage("S3Ball4.png");
  hpBarSymbol0 = loadImage("S3symbol0.png");
  hpBarSymbol1 = loadImage("S3symbol1.png");
  S4WinScreen = loadImage("S4WinScreen.png");
  S5WinScreen = loadImage("s5WinScreen.png");
  S3Gameboard = loadImage("S3Gameboard.png");
  shot0 = loadImage("S3pebbles1.png");
  shot1 = loadImage("S3pebbles2.png");
}
void draw()
{
  if (screenNumber==TITLE) 
  {   
    for (int x=shots0.size()-1; x>=0; x--)
    {
      Shooting s = (Shooting) shots0.get(x);
      shots0.remove(x);
    }
    for (int x=shots1.size()-1; x>=0; x--)
    {
      Shooting s = (Shooting) shots1.get(x);
      shots1.remove(x);
    }
    glowsphere.changex=3;
    glowsphere.changey=3;
    glowsphere.x=width/2;
    glowsphere.y=random(height/2-20, height/2+20);
    glowsphere.movingMotion=round(random(1, 2));
    hp1=5;
    hp0=5;
    imageMode(CORNER);
    winner1=winner2=false;
    instruction();
    timer0=timer1=0;
    stepmeup();
    go();
    doors();
    movingdoors();

    if (dist(mouseX, mouseY, width/1.93, height/1.9)<160 && cyber == 0)
    {
      silk();
    }

    if (dist(mouseX, mouseY, width/1.93, height/1.9)<160 && mousePressed)
    {  
      flip = true;
    }

    if (time > 350)
    {  
      screenNumber=GAME;
    }
  }

  else if (screenNumber==GAME)
  {
    imageMode(CENTER);
    image(S3Gameboard, width/2, height/2);
    image(hpBarSymbol0, 25, 25);
    for (int x=0;x<hp0*30;x+=30)
    {
      lifeBar.x=x;
      lifeBar.healthBar0();
    }
    image(hpBarSymbol1, width-25, 25 );
    for (int x=0;x<hp1*30;x+=30)
    {
      lifeBar.x=x;
      lifeBar.healthBar1();
    }
    for (int i=0; i<2; i++)
    {

      if (i==0)
      {
        player[i].P0movement();
      }
      if (i==1)
      {
        player[i].P1movement();
      }


      if (player[0].y<15)
      {  
        wPressed = false;
      }
      if (player[0].y>height-15)
      {
        sPressed = false;
      }
      if (player[1].y<15)
      {  
        upPressed = false;
      }
      if (player[1].y>height-15)
      {
        downPressed = false;
      }
      player[i].show();

      for (int x=0; x<shots0.size() && i==0; x++)
      {
        Shooting s = (Shooting) shots0.get(x);
        if (dist(s.shotx, s.shoty, player[1].x, player[1].y)>7.5 || dist(s.shotx, s.shoty, player[1].x, player[1].y+10)>7.5 || dist(s.shotx, s.shoty, player[1].x, player[1].y-10)>7.5)
        {
          s.show0();
        }
        if (dist(s.shotx, s.shoty, player[1].x, player[1].y)<=7.5 ||dist(s.shotx, s.shoty, player[1].x, player[1].y+10)<=7.5 || dist(s.shotx, s.shoty, player[1].x, player[1].y-10)<=7.5 && player[1].stunned1==false)
        {
          shots0.remove(x);
          hp1-=1;
        }
        s.movement0();
      }

      for (int y=0; y<shots1.size() && i==1; y++)
      {
        Shooting s = (Shooting) shots1.get(y);
        if (dist(s.shotx, s.shoty, player[0].x, player[0].y)>7.5 || dist(s.shotx, s.shoty, player[0].x, player[0].y+10)>7.5 || dist(s.shotx, s.shoty, player[0].x, player[0].y-10)>7.5)
        {
          s.show1();
        }
        if (dist(s.shotx, s.shoty, player[0].x, player[0].y)<=7.5|| dist(s.shotx, s.shoty, player[0].x, player[0].y+10)<=7.5 || dist(s.shotx, s.shoty, player[0].x, player[0].y-10)<=7.5 && player[0].stunned0==false)
        {
          shots1.remove(y);
          hp0-=1;
        }
        s.movement1();
      }
      if (hp0<1)
      {
        player[0].stunned0=true;
      }
      if (hp1<1)
      {
        player[1].stunned1=true;
      }
      player[i].stun();
    }

    if ( dist(glowsphere.x, glowsphere.y, player[0].x, player[0].y) <=30 && player[0].stunned0==false)
    {
      glowsphere.changex=3;
      glowsphere.changey=3;
      glowsphere.costume=round(random(1, 4));
      glowsphere.movingMotion=glowsphere.NEXT;
      lastHit=0;
    }
    else if (dist(glowsphere.x, glowsphere.y, player[0].x, player[0].y+5)<30 && player[0].stunned0==false)
    {
      glowsphere.changex=3;
      glowsphere.changey=3;
      glowsphere.costume=round(random(1, 4));
      glowsphere.movingMotion=glowsphere.NEXT;
      lastHit=0;
    }

    else if (dist(glowsphere.x, glowsphere.y, player[0].x, player[0].y-5)<30 && player[0].stunned0==false)
    {
      glowsphere.changex=3;
      glowsphere.changey=-3;
      glowsphere.costume=round(random(1, 4));
      glowsphere.movingMotion=glowsphere.NEXT;
      lastHit=0;
    }
    if (dist(glowsphere.x, glowsphere.y, player[1].x, player[1].y)<=30 && player[1].stunned1==false)
    {
      glowsphere.changex=-3;
      glowsphere.changey=-3;
      glowsphere.costume=round(random(1, 4));
      glowsphere.movingMotion=glowsphere.NEXT;
      lastHit=1;
    }
    else if (dist(glowsphere.x, glowsphere.y, player[1].x, player[1].y-5)<30 && player[1].stunned1==false)
    {

      glowsphere.changex=-3;
      glowsphere.changey=-3;
      glowsphere.costume=round(random(1, 4));
      glowsphere.movingMotion=glowsphere.NEXT;
      lastHit=1;
    }

    else if (dist(glowsphere.x, glowsphere.y, player[1].x, player[1].y+5)<30 && player[1].stunned1==false)
    {
      glowsphere.changex=-3;
      glowsphere.changey=3;
      glowsphere.costume=round(random(1, 4));
      glowsphere.movingMotion=glowsphere.NEXT;
      lastHit=1;
    }


    Bounce();
    glowsphere.start();
    glowsphere.moving();
    glowsphere.winner();
    timer0++;
    timer1++;
  }
  else if (screenNumber==WINNER)
  {
    for (int i=0; i<2; i++)
    {
      player[i].end();
    }
    fill(0);
    if (winner1)
    {
      text("Player 1, You Win.", width/2, height/2);      
      image(S5WinScreen, 400, 400);
    }
    else if (winner2)
    {
      text("Player 2, You Win.", width/2, height/2);
      image(S4WinScreen, 400, 400);
    }
    glowsphere.restart();
    reset();
    playback();
    hp1=5;
    hp0=5;
  }
}

class Player
{
  float x, y, i;
  float limits=5;
  float stuntime0=0;
  float stuntime1=0;
  boolean stunned=false;
  boolean stunned0=false;
  boolean stunned1=false;
  void show()
  {
    if (i==0 && stunned0==false) image(Player0, x, y);
    if (i==1 && stunned1==false) image(Player1, x, y);
  }
  void P0movement()
  {
    if (wPressed) y-=4;
    if (sPressed) y+=4;
    if (spacePressed && timer0>30) 
    {
      shots0.add(new Shooting(x, y));
      timer0=0;
    }
  }
  void P1movement()
  {
    if (upPressed) y-=4;
    if (downPressed) y+=4;
    if (enterPressed && timer1>30) 
    {
      shots1.add(new Shooting(x, y));
      timer1=0;
    }
  }
  void stun()
  {
    if (stunned0 && i==0)
    {
      if (stuntime0==limits && limits<120)
      {
        image(Player0, x, y);
        limits+=5;
        if (limits>=115)
        {
          hp0=5;
          stunned0=false;
          limits=5;
        }
      }
      stuntime0++;
    }
    if (stunned1 && i==1)
    {
      if (stuntime1==limits && limits<120)
      {
        image(Player1, x, y);
        limits+=5;
        if (limits>=115)
        {
          hp1=5;
          stunned1=false;
          limits=5;
        }
      }
      stuntime1++;
    }
  }

  void end()
  {
    if (i==0)
    {
      x=100;
      y=height/2;
      limits=5;
    }
    else if (i==1)
    {
      x=width-100;
      y=height/2;
      limits=5;
    }
  }
}
class Glowsphere
{
  float x, y, movingMotion, changex, changey, wherebounce, costume;
  int NEXT=1;
  int BOUNCY=3;
  int vup=0;
  int FIRST=1;

  void start()
  {
    if (costume==1) image(Glowsphere1, x, y, 50, 50);
    if (costume==2) image(Glowsphere2, x, y, 50, 50);
    if (costume==3) image(Glowsphere3, x, y, 50, 50);
    if (costume==4) image(Glowsphere4, x, y, 50, 50);
  }
  void moving()
  {
    if (movingMotion==1)
    {
      x+=FIRST;
      y-=FIRST;
    }

    if (movingMotion==2)
    {
      x-=FIRST;
      y+=FIRST;
    }
    if (movingMotion==NEXT && x<width/2)
    {
      x+=changex;
      y+=changey;
    }
    if (movingMotion==NEXT && x>width/2)
    {
      x+=changex;
      y+=changey;
    }
    if (movingMotion==BOUNCY)
    {
      x+=changex;
      y+=changey;
    }
  }

  void restart()
  {
    glowsphere.x=width/2;
    glowsphere.y=random(height/2-20, height/2+20);
  }

  void winner()
  {
    if (x<25)
    {
      screenNumber=WINNER;
      winner2=true;
    } 
    if (x>width-25)
    {
      screenNumber=WINNER;
      winner1=true;
    }
  }
}

class hpBar
{
  float x, y;
  void healthBar0()
  {
    noStroke();
    fill(145, 35, 35);
    rect(x+65, 25, 30, 20);
  }
  void healthBar1()
  {
    noStroke();
    fill(35, 81, 145);
    rect(height-65-x, 25, 30, 20);
  }
}

class Shooting
{
  float shotx, shoty;
  Shooting(float x, float y)
  {
    shotx=x;
    shoty=y;
  }
  void show0()
  {
    fill(255);
    image(shot0, shotx, shoty);
  }
  void show1()
  {
    image(shot1, shotx, shoty);
  }
  void movement0()
  {
    shotx++;
  }
  void movement1()
  {
    shotx--;
  }
}

void Bounce()
{
  if (glowsphere.y<25 && lastHit==1)
  {
    glowsphere.movingMotion=glowsphere.BOUNCY;
    glowsphere.changex=abs(glowsphere.changex)*-1;
    glowsphere.changex-=glowsphere.vup;
    glowsphere.changey=abs(glowsphere.changey);
    glowsphere.changey+=glowsphere.vup;
  } 
  if (glowsphere.y>height-25 && lastHit==1)
  {
    glowsphere.movingMotion=glowsphere.BOUNCY;
    glowsphere.changex=abs(glowsphere.changex)*-1;
    glowsphere.changex-=glowsphere.vup;
    glowsphere.changey=abs(glowsphere.changey)*-1;
    glowsphere.changey-=glowsphere.vup;
  }
  if (glowsphere.y<25 && lastHit==0)
  {
    glowsphere.movingMotion=glowsphere.BOUNCY;
    glowsphere.changex=abs(glowsphere.changey);
    glowsphere.changex+=glowsphere.vup;
    glowsphere.changey=abs(glowsphere.changey);
    glowsphere.changey+=glowsphere.vup;
  } 
  if (glowsphere.y>height-25 && lastHit==0)
  {
    glowsphere.movingMotion=glowsphere.BOUNCY;
    glowsphere.changex=abs(glowsphere.changey);
    glowsphere.changex+=glowsphere.vup;
    glowsphere.changey=abs(glowsphere.changex)*-1;
    glowsphere.changey-=glowsphere.vup;
  }
}

void doors()
{
  image(GWDoor1, cyber, valley); 
  image(GWDoor2, cybers, valleys);
}

void movingdoors()
{ 
  if (flip==true)
  {
    cyber = cyber - 3;
    cybers = cybers + 3;
  }
}
void reset()
{
  cyber = 0;
  valley = 0;
  cybers = 0;
  valleys = 0;
  curtains = 0;
  time = 200;
}

boolean wPressed, sPressed, spacePressed;
boolean upPressed, downPressed, enterPressed;
void keyPressed()
{
  //Player 0
  if (key == 'w' ) wPressed = true;
  if (key == 's') sPressed = true;
  if (key == ' ') spacePressed = true;
  //Player 1
  if (keyCode == UP )    upPressed = true;
  if (keyCode == DOWN )  downPressed = true;
  if (keyCode == ENTER) enterPressed = true;
}
void keyReleased()
{
  //Player 0
  if (key == 'w') wPressed = false;
  if (key == 's') sPressed = false;
  if (key == ' ') spacePressed = false;
  //Player 1
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
  if (keyCode == ENTER) enterPressed = false;
}

void instruction()
{
  image(S2Menu1, 0, 0); 
  image(S2Menu2, 0, 0);
}
void go()
{
  image(S2Menucounter, 350, time + 200);
  if (cybers > 150)
  {
    time = time + 3;
  }
}

void stepmeup()
{
  image(S2Descriptions, 500, 500);
  image(S2, 500, 200);
}
void playback()
{
  if (mousePressed)
  {
    screenNumber = TITLE;
  }
}

void silk()
{
  image(GWMenu3, 0, 0);
}


