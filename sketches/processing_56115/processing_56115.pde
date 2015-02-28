

boolean upPressed, leftPressed, downPressed, rightPressed, spacePressed, zPressed;
boolean EnterPress, ShiftPress;
int screenNumber, scoring;
float time, prevx, prevy, x1, y1, slowxspeed, slowyspeed, spawntime, spawn;
Circle player;
PImage lifeOrb, troll;
int bosstimer, life, enemies;
int s, m, stage1, stage2, stage3;
Enemies[] enemy;

void setup()
{
  enemies=50;
  enemy = new Enemies[1000];
  for (int i=0; i<1000; i++)
  {
    enemy[i]= new Enemies();
    x1=enemy[i].x1;
    y1=enemy[i].y1;
    //enemy[i].rotation=random(0,2)+PI;
    enemy[i].spawn=round(random(0, 3));


    if (enemy[i].spawn==0)
    {
      enemy[i].x1=16;
      enemy[i].y1=random(16, 500);
      enemy[i].xspeed=random(1, 3);
      enemy[i].yspeed=random(-3, 3);
      if ( enemy[i].yspeed==0)
      {
        enemy[i].yspeed=random(-3, 3);
      }
          slowxspeed=enemy[i].xspeed/2;
    slowyspeed=enemy[i].yspeed/2;
    }
    if (enemy[i].spawn==1)
    {
      enemy[i].x1=589;
      enemy[i].y1=random(16, 500);
      enemy[i].xspeed=random(-3, -1);
      enemy[i].yspeed=random(-3, 3);
      if ( enemy[i].yspeed==0)
      {
        enemy[i].yspeed=random(-3, 3);
      }
          slowxspeed=enemy[i].xspeed/2;
    slowyspeed=enemy[i].yspeed/2;
    }
    if (enemy[i].spawn==2)
    {
      enemy[i].y1=16;
      enemy[i].x1=random(16, 500);
      enemy[i].yspeed=random(-3, 3);
      enemy[i].xspeed=random(1, 3);
      if ( enemy[i].yspeed==0)
      {
        enemy[i].yspeed=random(-3, 3);
      }
          slowxspeed=enemy[i].xspeed/2;
    slowyspeed=enemy[i].yspeed/2;
    }
    if (enemy[i].spawn==3)
    {
      enemy[i].y1=879;
      enemy[i].x1=random(16, 500);
      enemy[i].yspeed=random(-3, 3);
      enemy[i].xspeed=random(-3, -1);
      if ( enemy[i].yspeed==0)
      {
        enemy[i].yspeed=random(-3, 3);
      }
          slowxspeed=enemy[i].xspeed/2;
    slowyspeed=enemy[i].yspeed/2;
    }

  }

  imageMode(CENTER);
  lifeOrb= loadImage("yugioh-Ball.png");
  troll= loadImage("trolololololol.png");
  player=new Circle();
  
  size(900, 900);
  screenNumber=scoring=0;
  textAlign(CENTER);
  upPressed= leftPressed= downPressed= rightPressed= spacePressed= zPressed=false;
  m =0;
  s =00;
  spawntime=400;
  bosstimer=1;
}

void draw()
{

  background(0);
  //Lives();
  if (screenNumber == 0)
  {
    m=s=0;
    //bosstimer=1;
    fill(255);
    textSize(50);
    text("Causual Game", width/2, height/3);
    textSize(50);
    text("Click Enter to begin", width/2, 2*height/3);
    textSize(30);
    text("Shift to slow you, Arrows to move, z to slow enemy ", width/2, height/2);
    player.x=575/2;
    player.y=765/2;
    life=1;
    if (EnterPress)
    {
      screenNumber=1;
    }
  } 
  if (screenNumber == 1)
  {

    Lives();
    fill(255);

    if (s>300)
    {
      textSize(30);
      text("Time: "+m+":"+s/30, 695, 200);
    }
    else if (s<300)
    {
      textSize(30);
      text("Time: "+m+":0"+s/30, 695, 200);
    }
    s++;
    player.Player();

    if ( s == 1800)
    {
      m =m+1;
      s = 0;
      spawntime=200;
    }
    if (s>spawntime)
    {
      enemies+=2;
      spawntime=s+50;
      if (m==1)
      {
        enemies+=4;
        spawntime=s+50;
      }
      if (m==2)
      {
        enemies+=8;
        spawntime=s+50;
      }
    }

      
   
    player.Borders();

    for (int i=0; i<enemies; i++)
    {
      enemy[i].Restriction();
      enemy[i].EnemyMove();
      //enemy[i].Rotation();
      if (dist(player.x, player.y, enemy[i].x1, enemy[i].y1)<20 )
      {
        life-=1;
        Death();
      }
    }
  }
  if (screenNumber == 2)
  {
    for (int i=0; i<enemies; i++)
    {
      enemy[i].ReturnPos();
    }
    fill(255);
    enemies=50;
    textSize(50);
    if (s>300)
    {
      text("Time: "+m+":"+s/30, width/2, height/3);
    }
    else if (s<300)
    {
      text("Time: "+m+":0"+s/30, width/2, height/3);
    }
    text("Try Again? Press Enter.", width/2, height/2);
    rightPressed = false;
    leftPressed = false;
    upPressed = false;
    downPressed = false;
    ShiftPress = false;
    zPressed = false;
    if (EnterPress)
    {
      screenNumber=0;
    }
  }
  if (m>3)
  {
    text("You are the God, you're probably hacking though.", width/2, height/2);
  }
}

void keyPressed()
{
  if (screenNumber==1)
  {
    if (key == 'z') zPressed = true;
    if (key == ' ' ) spacePressed = true;
    if (keyCode == RIGHT) rightPressed = true;
    if (keyCode == LEFT)  leftPressed = true;
    if (keyCode == UP)    upPressed = true;
    if (keyCode == DOWN)  downPressed = true;
    if (keyCode == SHIFT)  ShiftPress = true;
  }
  if (keyCode == ENTER)  EnterPress = true;
}

void keyReleased()
{
  if (screenNumber==1)
  {
    if (key == 'z') zPressed = false;
    if (key == ' ' ) 
    {
      prevx=player.x;
      prevy=player.y;
      spacePressed = false;
    }
    if (keyCode == RIGHT) rightPressed = false;
    if (keyCode == LEFT)  leftPressed = false;
    if (keyCode == UP)    upPressed = false;
    if (keyCode == DOWN)  downPressed = false;
    if (keyCode == SHIFT)  ShiftPress = false;
  }
  if (keyCode == ENTER)  EnterPress = false;
}

class Circle
{
  float x, y, x1, y1; 
  float playershoty1, playershoty2=5;      
  boolean hit, death;
  int life;
  int stage1, stage2, stage3, scoring;
  float spawn, movement;
  int pspeed=6;

  void Player()
  {
    fill(255, 0, 0);
    ellipse(x, y, 20, 20);
    if (ShiftPress)
    {
      pspeed=2;
    }
    else if (ShiftPress==false)
    {
      pspeed=6;
    }
    if (x<590)
    { 
      if (rightPressed) x += pspeed;
    }
    if (x>15)
    { 
      if (leftPressed)  x -= pspeed;
    }
    if (y<height-20)
    { 
      if (downPressed)  y += pspeed;
    }
    if (y>15)
    { 
      if (upPressed)  y -= pspeed;
    }
  }

  void Borders()
  {
    fill(155);
    rect(0, 0, 10, height);
    rect(600, 0, 10, height);
    rect(0, 0, 2*width/3, 10);
    rect(0, 890, 2*width/3, 10);
  }
}

class Enemies
{
  float x1, y1, xspeed, yspeed; 
  boolean death;
  float spawn, movement, rotation;
  void Restriction() 
  {
    if (x1<590 || x1>15 || y1<height-20 || y1>15)
    {
      ellipse(x1, y1, 20, 20);
      image(troll, x1, y1, 20, 20);
    }
    if (x1>590)
    {
      x1=16;
    }
    if (x1<15 )
    {
      x1=589;
    }
    if (y1<15)
    {
      y1=879;
    }
    if (y1>height-20)
    {
      y1=16;
    }
  }

  void EnemyMove()
  {
    if (movement==0)
    {
      if (zPressed)
      {
        x1+=xspeed/2;
        y1+=yspeed/2;
      }
      else {
        x1+=xspeed;
        y1+=yspeed;
      }
    }
    if (movement==1)
    {
      if (zPressed)
      {
        x1+=xspeed/2;;
        y1+=yspeed/2;
      }
      else {
        x1+=xspeed;
        y1+=yspeed;
      }
    }
    if (movement==2)
    {
      if (zPressed)
      {
        x1+=xspeed/2;;
        y1+=yspeed/2;
      }
      else
      {
        x1+=xspeed;
        y1+=yspeed;
      }
    }
    if (movement==3)
    {
      if (zPressed)
      {
        x1+=xspeed/2;;
        y1+=yspeed/2;
      }
      else {
        x1+=xspeed;
        y1+=yspeed;
      }
    }
    if (dist(prevx-5, prevy-5, x1, y1) < 10 || dist(prevx, prevy, x1, y1) < 10 || dist(prevx+5, prevy+5, x1, y1) < 10)
    {
      death=true;
    }
  }
  void ReturnPos()
  {
    if (screenNumber==2 && spawn==0)
    {
      x1=16;
    }
    if (screenNumber==2 && spawn==1)
    {
      x1=589;
    }
    if (screenNumber==2 && spawn==2)
    {
      y1=16;
    }
    if (screenNumber==2 && spawn==3)
    {
      y1=879;
    }
  }
}

void Lives()
{
  fill(255);
  textSize(30);
  text("Lives: ", 667, 240);
  for (int i=20; i<life+21; i++)
  {
    image(lifeOrb, 695+i, 233, 20, 20);
  }
  /*if (dist(player.x, player.y, enemy[i].x1, enemy[i].y1)<20 )
   {
   life-=1;
   }*/
   
}

void Death()
{
  if (life<1)
  {
    screenNumber=2;
  }
}


