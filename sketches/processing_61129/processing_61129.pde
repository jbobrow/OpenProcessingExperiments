
/*
James Liu
David Situ
Joshua Zheng
3rd Period
 */

PImage city, dock, house, lexington;
PImage citymap, dockmap, housemap, lexingtonmap;
PImage npcdeath, TitleScreen;
PImage quest0, quest1, quest2a, quest2b, quest3a, quest3b1, quest3b2, quest4a, quest4b, quest5a, quest5b;
PImage letter, crate;
PImage gamemap, mapmode; // variables for maps
PFont font;
int time, timeDelay;
int massacretalknum;
int beginnum;
int lexingtontalknum;
int cratesmashed, numcratesmashed;
int hp,hpx;
float side;
float quest, questword;
float x, y, playerx, playery;
float scrollx, scrolly;
float screennumber;
float bulletspeed;
boolean goup, godown, goleft, goright;
boolean begintalk;
boolean massacre, massacretalk;
boolean lexingtonbattle, lexingtontalk, gunshot;
boolean dockin,housein;
npc []a;
crates []ship1, ship2;
soldier []brit, US;

void setup()
{
  size(800, 600);
  x=-150;
  y=-200;
  playerx=400;
  playery=300;
  scrollx=0;
  scrolly=0;
  screennumber=-2;    //testing
  massacretalknum=0;
  time=millis();
  timeDelay=5000 ;
  cratesmashed=0;
  numcratesmashed=20;
  hp=20;
  hpx=620;
  side=1.5;
  quest=0;
  questword=0;  //testing
  lexingtonbattle=false;
  lexingtontalknum=3;
  a=new npc[50];
  for (int i=0; i<50; i++)
  {
    a[i]=new npc();
    a[i].x=1170+round(random(9))*12;
    a[i].y=500+round(random(15))*12;
    a[i].savex=a[i].x;
    a[i].savey=a[i].y;
    a[i].direction=round(random(1, 3));
    if (a[i].direction!=2)
    {      
      a[i].fleey=random(680, 750);
    }
  }
  ship1=new crates[10];
  for (int i=0; i<10; i++)
  {
    ship1[i]=new crates();
    ship1[i].x=200+round(random(1, 34))*20;
    ship1[i].y=500+round(random(1, 9))*20;
    ship1[i].smashed=false;
  }
  ship2=new crates[10];
  for (int i=0; i<10; i++)
  {
    ship2[i]=new crates();
    ship2[i].x=200+round(random(1, 34))*20;
    ship2[i].y=100+round(random(1, 9))*20;
    ship2[i].smashed=false;
  }
  brit=new soldier[80];
  {
    for (int i=0; i<80; i++)
    {
      brit[i]=new soldier();      
      brit[i].x=(i-7)*20;
      brit[i].y=800;
      brit[i].savex=brit[i].x;
      brit[i].savey=brit[i].y;
      brit[i].bulletx=brit[i].x;
      brit[i].bullety=brit[i].y;
      brit[i].gotox=round(random(-150, 1450));
      brit[i].gotoy=round(random(-200, brit[i].y));
      brit[i].gunshot=false;
      brit[i].savetime=millis();
      brit[i].time=millis();
      brit[i].timedelay=3000;
      brit[i].savetimedelay=1000;
    }
  }
  US=new soldier[80];
  {
    for (int i=0; i<80; i++)
    {
      US[i]=new soldier();      
      US[i].x=(i-7)*20;
      US[i].y=400;      
      US[i].savex=US[i].x;
      US[i].savey=US[i].y;
      US[i].bulletx=US[i].x;
      US[i].bullety=US[i].y;
      US[i].gotox=round(random(-150, 1450));
      US[i].gotoy=round(random(US[i].y, 1000));
      US[i].gunshot=false;
      US[i].savetime=millis();
      US[i].time=millis();
      US[i].timedelay=3000;
      US[i].savetimedelay=1000;
    }
  }
  city=loadImage("city.jpg");
  dock=loadImage("dock.jpg");
  house=loadImage("house.jpg");
  lexington=loadImage("lexington.jpg");
  citymap=loadImage("citymap.jpg");
  dockmap=loadImage("dockmap.jpg"); 
  housemap=loadImage("housemap.jpg");
  lexingtonmap=loadImage("lexingtonmap.jpg");
  npcdeath=loadImage("death.png");
  quest0=loadImage("quest0.jpg");
  quest1=loadImage("quest1.jpg");
  quest2a=loadImage("quest2a.jpg");
  quest2b=loadImage("quest2b.jpg");
  quest3a=loadImage("quest3a.jpg");
  quest3b1=loadImage("quest3b1.jpg");
  quest3b2=loadImage("quest3b2.jpg");
  quest4a=loadImage("quest4a.jpg");
  quest4b=loadImage("quest4b.jpg");
  quest5a=loadImage("quest5a.jpg");
  quest5b=loadImage("quest5b.jpg");
  TitleScreen=loadImage("TitleScreen.jpg");
  crate=loadImage("crate.jpg");
  letter=loadImage("letter.jpg");
  font=loadFont("font2.vlw");
  smooth();
  gamemap=city;
  mapmode=citymap;
 //gamemap=lexington;
 //mapmode=lexingtonmap;
}

void draw()
{
  if (screennumber==-2)
  {
    background(TitleScreen);
    textFont(font, 48);
    fill(#F51E1E);
    text("Liberty Across the Land", 210, 60, 400, 200);
    fill(#2E57CE);
    ellipse(350, 353, 130, 60);
    rect(255, 445, 200, 50);
    fill(#F51E1E);
    text("Play", 309, 322, 200, 100);
    text("Instructions", 255, 443, 200, 100);
  }
  if (screennumber==-1)
  {
    background(0);
    fill(255);
    text("Controls", 20, 50);
    text("Up Arrow = Up", 20, 100);
    text("Down Arrow = Down", 20, 150);
    text("Left Arrow = Left", 20, 200);
    text("Right Arrow = Right", 20, 250);
    text("Q = Quest Log", 20, 300);
    text("T = Talk to people", 20, 350);
    text("M = Map", 20, 400);
    rect(650, 540, 140, 50);
    fill(255, 0, 0);
    text("Back", 670, 585);
  }
  if (screennumber==0)
  {
    imageMode(CORNER);
    if (gamemap!=house)
    {
      image(gamemap, x+scrollx, y+scrolly);
    }
    else
    {
      image(gamemap, 0, 0);
    }
    fill(0);
    ellipse(playerx, playery, 10, 10);
    npc();
    building();
    movement();
    actions();
    fill(100);
    rect(10, 540, 50, 50);
    rect(70, 540, 50, 50);
    textFont(font, 48);
    fill(255, 0, 0);
    text("Q", 15, 575); 
    text("M", 70, 580);
    textFont(font, 25);
    text("HP", 680, 580);
    rect(hpx, 580, hp*8, 20);
    if(hp*8<60)
    {
      background(0);
      text("How Could You Have Let Your Country Down!?",200,300);
    
      
    }
  }

  if (screennumber==1)
  {
    background(0);
    imageMode(CORNER);
    textFont(font);
    fill(0, 255, 0);
    questword();
  }
  if (screennumber==2)
  {
    imageMode(CORNER);
    background(0);
    fill(100);
    textFont(font);
    text("Quest Log", 290, 50);
    quest();
    rect(650, 540, 140, 50);
    fill(255, 0, 0);
    text("Back", 670, 585);
  }
  if (screennumber==3)
  {
    imageMode(CORNER);
    textFont(font);
    background(mapmode);
    fill(100);
    rect(650, 10, 140, 50);
    fill(255, 0, 0);
    text("Back", 670, 55);
    fill(0);
    text("Map", 370, 50);

    if (x+scrollx<0&&x+scrollx>-800&&y+scrolly<0&&y+scrolly>-600)
    {   
      ellipse(-(x+scrollx)/2+200, -(y+scrolly)/2+150, 10, 10);
    }
    else if (x+scrollx==0&&y+scrolly==0)
    {
      ellipse(playerx/2, playery/2, 10, 10);
    }
    else if (x+scrollx==-800&&y+scrolly==0)
    {
      ellipse(400+playerx/2, playery/2, 10, 10);
    }
    else if (x+scrollx==-800&&y+scrolly==-600)
    {
      ellipse(400+playerx/2, 300+playery/2, 10, 10);
    }
    else if (x+scrollx==0&&y+scrolly==-600)
    {
      ellipse(playerx/2, 300+playery/2, 10, 10);
    }
    else  if (y+scrolly==0)
    { 
      ellipse(-(x+scrollx)/2+200, playery/2, 10, 10);
    }
    else  if (y+scrolly==-600)
    { 
      ellipse(-(x+scrollx)/2+200, 300+playery/2, 10, 10);
    }
    else  if (x+scrollx==0)
    {
      ellipse(playerx/2, -(y+scrolly)/2+150, 10, 10);
    }
    else  if (x+scrollx==-800)
    {
      ellipse(400+playerx/2, -(y+scrolly)/2+150, 10, 10);
    }
  }
  //println(mouseX+","+mouseY);
  //println((scrollx)+","+(scrolly));
  //println(x+scrollx+","+(y+scrolly));
  //println(playerx+","+playery);
  //println(x+","+y);
  //println(time+","+millis());
  //println(massacretalk);
}

void keyPressed()
{
  if (screennumber==0)
  {
    if (keyCode == UP)
    {
      goup=true;
    }
    if (keyCode == DOWN)
    {
      godown=true;
    }
    if (keyCode == RIGHT)
    {
      goright=true;
    }
    if (keyCode == LEFT)
    {
      goleft=true;
    }
  }
}

void keyReleased()
{
  if (screennumber==0)
  {
    if (keyCode == UP)
    {
      goup=false;
    }
    if (keyCode == DOWN)
    {
      godown=false;
    }
    if (keyCode == RIGHT)
    {
      goright=false;
    }
    if (keyCode == LEFT)
    {
      goleft=false;
    }
    if (key =='q'||key == 'Q')
    {     
      screennumber=2;
    }
    if (key =='m'||key == 'M')
    {
      screennumber=3;
    }
  }  
  else if (screennumber==2)
  {
    if (key =='q'||key == 'Q')
    {
      exitdialogue();
      time=millis();
    }
  }
  else if (screennumber==3)
  {
    if (key =='m'||key == 'M')
    {
      exitdialogue();
      time=millis();
    }
  }
}

void mousePressed()
{
  if (screennumber==-2)
  {
    if (mouseX>280 && mouseX<420)
    {
      if (mouseY>320 && mouseY<380)
      {
        screennumber=0;
      }
    }
    if (mouseX>255 && mouseX<455)
    {
      if (mouseY>440 && mouseY<500)
      {
        screennumber=-1;
      }
    }
  }
  if (screennumber==-1)
  {

    if (mouseX>640 && mouseX<790)
    {
      if (mouseY>540 && mouseY<590)
      {
        screennumber=-2;
      }
    }
  }
  if (screennumber==0)
  {
    if (mouseX>10 && mouseX<60)
    {
      if (mouseY>540 && mouseY<590)
      {
        screennumber=2;
      }
    }

    if (mouseX>70 && mouseX<120)
    {
      if (mouseY>540 && mouseY<590)
      {
        screennumber=3;
      }
    }
  }
  if (screennumber==1)
  {
    questchoices();
  }
  if (screennumber==2)
  {
    if (mouseX>640 && mouseX<790)
    {
      if (mouseY>540 && mouseY<590)
      {
        exitdialogue();
      }
    }
  }
  if (screennumber==3)
  {
    if (mouseX>640 && mouseX<790)
    {
      if (mouseY>10 && mouseY<60)
      {
        exitdialogue();
      }
    }
  }
}
class npc
{
  int direction;
  float x, y, savex, savey, fleey;
  boolean death;
  void show()
  {
    fill(100);
    if (!death)
    {
      ellipse(x+scrollx, y+scrolly, 10, 10);
      if (!massacre)
      {
        if (x>savex)
        {
          x=x-round(random(0, 2));
        }
        if (x<savex)
        {
          x=x+round(random(0, 2));
        }
        if (y>savey)
        {
          y=y-round(random(0, 2));
        }
        if (y<savey)
        {
          y=y+round(random(0, 2));
        }
        if (y==savey)
        {
          savex=1170+round(random(0, 108));
          savey=450+round(random(0, 200));
        }
      }
      if (massacre)
      { 
        if (direction!=2)
        {
          if (y<fleey)
          {
            y=y+round(random(0, 2));
          }
          else
          {
            if (direction==1)
            {
              x=x-round(random(0, 2));
            }
            if (direction==3)
            {
              x=x+round(random(0, 2));
            }
          }
        }
        else
        {
          y=y+round(random(0, 2));
        }
      }
    }
    else
    {
      image(npcdeath, x-5+scrollx, y-5+scrolly, 15, 15);
    }
  }

  void mobactions()
  {
    for (int i=0; i<6; i++)
    {
      if (dist(1170+i*20+scrollx, 400+bulletspeed+scrolly, x+scrollx, y+scrolly)<5)
      {
        death=true;
      }
    }
  }
}
class crates
{
  float x, y;
  boolean smashed;
  void show()
  {
    if (!smashed)
    {
      imageMode(CENTER);
      image(crate, x+scrollx, y+scrolly);
      if (key ==' ')
      {
        if (dist(playerx, playery, x+scrollx, y+scrolly)<15)
        {
          smashed=true;
          cratesmashed++;
          numcratesmashed=20-cratesmashed;
        }
      }
    }
  }
}
class soldier
{
  float x, y, gotox, gotoy, savex, savey;
  float bulletx, bullety;
  float time, savetime, savetimedelay, timedelay;
  boolean enemyseen, gunshot;
  boolean shotup, shotdown, shotleft, shotright;
  boolean blockup, blockdown, blockleft, blockright;
  void show()
  {
    ellipse(x+scrollx, y+scrolly, 10, 10);
    if (!gunshot)
    {
      restartnpc();
      time=millis();
    }
    if (gunshot)
    {
      fill(0);
      ellipse(bulletx+scrollx, bullety+scrolly, 5, 5);
      if (bulletx==-150 || bulletx==1450 || bullety==-200 || bullety==1000)
      {
        restartnpc();
      }

      if (millis()>time + timeDelay)
      {
        restartnpc();
      }

      else
      {
        time=millis();
      }
      if (dist(bulletx, bullety, x, y)>150)
      {
        restartnpc();
      }
      if (shotup&&shotright)
      {
        bullety=bullety-2;
        bulletx=bulletx+2;
      }
      else if (shotup&&shotleft)
      {
        bullety=bullety-2;
        bulletx=bulletx-2;
      }
      else if (shotdown&&shotright)
      {
        bullety=bullety+2;
        bulletx=bulletx+2;
      }
      else if (shotdown&&shotleft)
      {
        bullety=bullety+2;
        bulletx=bulletx-2;
      }
      else if (shotup)
      {
        bullety=bullety-2;
      }
      else if (shotdown)
      {
        bullety=bullety+2;
      }
      else if (shotright)
      {
        bulletx=bulletx+2;
      }
      else if (shotleft)
      {
        bulletx=bulletx-2;
      }
    }
  }
  void soldieraction()
  {

    if (x>gotox)
    {
      blockleft=false;
    }
    if (x<gotox)
    {
      blockright=false;
    }
    if (y>gotoy)
    {
      blockup=false;
    }
    if (y<gotoy)
    {
      blockdown=false;
    }

    soldierbuilding();

    if (!blockleft)
    {

      x=x-round(random(1));
    }
    if (!blockright)
    { 

      x=x+round(random(1));
    }
    if (!blockup)
    {

      y=y-round(random(1));
    }
    if (!blockdown)
    {

      y=y+round(random(1));
    }
  }
  void restartnpc()
  {
    bulletx=x;
    bullety=y;
    gunshot=false;
    shotup=false;
    shotdown=false;
    shotleft=false;
    shotright=false;
    blockup=true; 
    blockdown=true;
    blockleft=true;
    blockright=true;
  }
  void soldierbuilding()
  {
    //top left building
    if (x<295&&y>-200&&y<-10)
    {
      blockleft=true;
      //  x++;
    }
    if (y<-10&&x>-150&&x<295)    
    {
      blockup=true;
      //  y++;
    }
    //top right building
    if (x>1005&&y>-200&&y<-10)
    {
      blockright=true;
      //  x--;
    }
    if (y<-10&&x>1005&&x<1450)
    {
      blockup=true;
      //  y++;
    }
    //well
    if (x>590&&x<600&&y>-160&&y<-20)
    {
      blockright=true;
      //  x--;
    }
    if (x<730&&x>710&&y>-160&&y<-20)
    {
      blockleft=true;
      //  x++;
    }
    if (y>-160&&y<-145&&x>590&&x<730)
    {
      blockdown=true;
      //  y--;
    }
    if (y<-20&&y>-15&&x>590&&x<730)
    {
      blockup=true;
      // y++;
    }
    // rest of buildings!
    if (133<y&&y<135 &&x<290 )
    {
      blockdown=true; 
      // y--;
    }
    if (133<y&&y<135 &&x>428&&x<879 )
    {
      blockdown=true; 
      // y--;
    }
    if (133<y&&y<135 && 998<x)
    {
      blockdown=true; 
      // y--;
    }
    if (300<y && y<304&&290>x)
    {
      blockup=true; 
      // y++;
    }
    if (300<y && y<304&&x>428&&x<879)
    {
      blockup=true;
      // y++;
    }
    if (y>300 && y<304&& x>998)
    {
      blockup=true; 
      // y++;
    }
    if (x>290&&x<292&&y>133&& y<304)
    {
      blockleft=true;
      // x++;
    }
    if (x>428&&x<430&&y>133&& y<304)
    {
      blockright=true; 
      // x--;
    }
    if (x>877&&x<879&&y>133&& y<304)
    {
      blockleft=true; 
      // x++;
    }
    if (x>998&&x<1000&&y>133&& y<304)
    {
      blockright=true; 
      //x--;
    }
  }
}

void exitdialogue()
{
  screennumber=0;
  goleft=false;
  goright=false;
  goup=false;
  godown=false;
}


