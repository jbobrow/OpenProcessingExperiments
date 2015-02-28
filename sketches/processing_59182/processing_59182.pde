
/*
THINGS TO DO
 -Crunch TIME!
 -lexington. quest people, and ai.
 -concord
 */

PImage city, dock, house, lexington;
PImage citymap, dockmap, housemap, lexingtonmap;
PImage npcdeath, TitleScreen;
PImage quest0, quest1, quest2a, quest2b;
PImage letter, crate;
PImage gamemap, mapmode; // variables for maps
PFont font;
int time, timeDelay;
int massacretalknum;
int beginnum;
int lexingtontalknum;
int cratesmashed, numcratesmashed;
float side;
float quest, questword;
float x, y, playerx, playery;
float scrollx, scrolly;
float screennumber;
float bulletspeed;
boolean goup, godown, goleft, goright;
boolean begintalk;
boolean massacre, massacretalk;
boolean lexingtonbattle, lexingtontalk;
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
  side=1;
  quest=0;
  questword=0;  //testing
  lexingtonbattle=false;
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
    }
  }
  US=new soldier[80];
  {
    for (int i=0; i<80; i++)
    {
      US[i]=new soldier();      
      US[i].x=(i-7)*20;
      US[i].y=400;
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
  TitleScreen=loadImage("TitleScreen.jpg");
  crate=loadImage("crate.jpg");
  letter=loadImage("letter.jpg");
  font=loadFont("font2.vlw");
  smooth();
  gamemap=city;
  mapmode=citymap;
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
    text("W = Up", 20, 100);
    text("S = Down", 20, 150);
    text("A = Left", 20, 200);
    text("D = Right", 20, 250);
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
  }

  if (screennumber==1)
  {
    background(0);
    imageMode(CORNER);
    textFont(font);
    fill(0, 255, 0);
    if (questword==0)
    {
      background(quest0);
      String npc = "Hey son, can you go to the market to get some apples?";
      text(npc, 0, 50, 450, 200);
      text("Of course!", 0, 300);
      text("No thanks.", 0, 400);
    }
    else if (questword==1)
    {
      background(quest1);
      String npc = "That was bloody. What do you think about it?";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("Finally! They put down the rebels.(Join the British)", 0, 300, 800, 200);
      text("That was a MASSACRE!(Join the American)", 0, 420, 800, 200);
    }
    else if (questword==2)
    {
      background(quest2a);
      String npc = "Hello Chap! Do you wish to join the Royal Army?";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("Yes! For his Majesty, King George III!", 0, 300, 800, 200);
      text("Hmm I have to think about it.", 0, 420, 800, 200);
    }
    else if (questword==2.5)
    {
      background(quest2b);
      String npc = "Do you want to help fight in this war against the tyrant?";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("YES! FOR THE REVOLUTION", 0, 300, 800, 200);
      text("No. Not yet.", 0, 420, 800, 200);
    }
    else if (questword==3)
    {
      String npc = "Soldier! Report to the dock immediately!";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("I will head there immediately!", 0, 300, 800, 200);
      text("I will go soon.", 0, 420, 800, 200);
    }
    else if (questword==3.5)
    {
      String npc = "Them British are taxing our tea.";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("Oh NO! We must stop them! ", 0, 300, 800, 200);
      text("So?", 0, 420, 800, 200);
    }
    else if (questword==3.51)
    {
      String npc = "That's right! That's why we are gong to the harbor to smash the tea.Do you want to come?";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("SMASH THE TEA! ", 0, 300, 800, 200);
      text("I don't have time right now.", 0, 420, 800, 200);
    }
    else if (questword==3.52)
    {
      String npc = "So?! They are taking our money and giving it to some fat king!";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("Taking my money! SMASH THE TEA!", 0, 300, 800, 200);
      text("I am fine with it.", 0, 420, 800, 200);
    }
    else if (questword==4)
    {
      String npc = "Men came on board and destroyed crates of tea.";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("That is outrageous!", 0, 300, 800, 200);
      text("It is only crates of tea.", 0, 420, 800, 200);
    }
    else if (questword==4.1)
    {

      String npc = "We must stop this! Go to Lexington. We are going to end this!";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("Onward!", 0, 300, 800, 200);
      text("Meet you later.", 0, 420, 800, 200);
    }
    else if (questword==4.2)
    {

      String npc = "Only crates of tea?! They destroyed the King's property! Meet me at Lexington.";
      text(npc, 0, 50, 500, 300);
      textFont(font, 30);
      text("NO! NOT the King's things! Stop them!", 0, 400, 800, 200);
      text("Not sure yet if I want to go.", 0, 520, 800, 200);
    }
    else if (questword==4.5)
    {
      String npc = "Good job son. Go to Lexington. We are going to arm you now.";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("May the revolution live on!", 0, 300, 800, 200);
      text("I will take a break for now.", 0, 420, 800, 200);
    }
    else if (questword==5)
    {
      String npc = "Here's a gun. Line up and wait for my signal.";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("I am ready", 0, 300, 800, 200);
    }
    else if (questword==5.5)
    {
      String npc = "It is time. The world is looking at us. Wait for my signal.";
      text(npc, 0, 50, 400, 200);
      textFont(font, 30);
      text("I will not fall.", 0, 300, 800, 200);
    }
  }
  if (screennumber==2)
  {
    imageMode(CORNER);
    background(0);
    fill(100);
    text("Quest Log", 290, 50);
    if (quest==0)
    {
      text("Go to Dad.", 0, 100);
    }
    if (quest==1)
    {
      if (!massacre)
      {
        text("Go to Market for apples.", 0, 100);
      }
      else
      {
        text("Talk to the man.", 0, 100);
      }
    }
    if (quest==2)
    {
      text("Go to the Loyalist Recuirting Center.", 0, 100);
    }
    if (quest==2.5)
    {
      text("Go to the Continetal Army Center.", 0, 100);
    }
    if (quest==3)
    {
      text("Go home and rest.", 0, 100);
    }
    if (quest==3.5)
    {
      text("Meet your leader at the Market.", 0, 100);
    }
    if (quest==4)
    {
      text("Go to dock and talk to the Officer. ", 0, 100);
    }
    if (quest==4.5)
    {
      if (numcratesmashed!=0)
      {
        text("Go to the harbor and smash the tea!", 0, 100);
        text("Tea left: "+numcratesmashed, 0, 200);
      }
      else
      {
        text("Meet the boston tea party leader.", 0, 100);
      }
    }
    if (quest==5)
    {
      text("Go to Lexington and meet John Pitcairn", 0, 100);
    }
    if (quest==5.5)
    {
      text("Go to Lexington and meet John Parker.", 0, 100);
    }
    if (quest==6)
    {
      text("Line up with army.", 0, 100);
    }
    if (quest==6.5)
    {
      text("Line up with your friends.", 0, 100);
    }
    rect(650, 540, 140, 50);
    fill(255, 0, 0);
    text("Back", 670, 585);
  }
  if (screennumber==3)
  {
    imageMode(CORNER);
    background(mapmode);
    fill(100);
    rect(650, 10, 140, 50);
    fill(255, 0, 0);
    text("Back", 670, 55);
    fill(0);
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
  println(x+scrollx+","+(y+scrolly));
  println(playerx+","+playery);
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
    if (key =='q')
    {     
      screennumber=2;
    }
    if (key =='m')
    {
      screennumber=3;
    }
  }  
  else if (screennumber==2)
  {
    if (key =='q')
    {
      exitdialogue();
      time=millis();
    }
  }
  else if (screennumber==3)
  {
    if (key =='m')
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
    if (questword==0) 
    {
      if (mouseX>0 && mouseX<255)
      {
        if (mouseY>260 && mouseY<300)
        {
          exitdialogue();
          quest=1;
        }
        if (mouseY>360 && mouseY<400)
        {
          exitdialogue();
        }
      }
    }
    if (questword==1) 
    {
      if (mouseX>0 && mouseX<570)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=2;
        }
      }
      if (mouseX>0 && mouseX<510)
      {
        if (mouseY>425 && mouseY<455)
        {
          exitdialogue();
          quest=2.5;
        }
      }
    }
    if (questword==2) 
    {
      if (mouseX>0 && mouseX<440)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=3;
          side=1;
        }
      }
      if (mouseX>0 && mouseX<340)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    if (questword==2.5) 
    {
      if (mouseX>0 && mouseX<420)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=3.5;
          side=0.5;
        }
      }
      if (mouseX>0 && mouseX<140)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    else if (questword==3) 
    {
      if (mouseX>0 && mouseX<330)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=4;
        }
      }
      if (mouseX>0 && mouseX<160)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    if (questword==3.5) 
    {
      if (mouseX>0 && mouseX<320)
      {
        if (mouseY>300 && mouseY<330)
        {
          questword=3.51;
        }
      }
      if (mouseX>0 && mouseX<46)
      {
        if (mouseY>425 && mouseY<450)
        {
          questword=3.52;
        }
      }
    }
    else if (questword==3.51) 
    {
      if (mouseX>0 && mouseX<250)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=4.5;
        }
      }
      if (mouseX>0 && mouseX<310)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    else if (questword==3.52) 
    {
      if (mouseX>0 && mouseX<465)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=4.5;
        }
      }
      if (mouseX>0 && mouseX<185)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    if (questword==4) 
    {
      if (mouseX>0 && mouseX<220)
      {
        if (mouseY>300 && mouseY<330)
        {
          questword=4.1;
        }
      }
      if (mouseX>0 && mouseX<235)
      {
        if (mouseY>425 && mouseY<450)
        {
          questword=4.2;
        }
      }
    }
    else if (questword==4.1) 
    {
      if (mouseX>0 && mouseX<105)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=5;
        }
      }
      if (mouseX>0 && mouseX<165)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    else if (questword==4.2) 
    {
      if (mouseX>0 && mouseX<455)
      {
        if (mouseY>400 && mouseY<430)
        {
          exitdialogue();
          quest=5;
        }
      }
      if (mouseX>0 && mouseX<305)
      {
        if (mouseY>525 && mouseY<550)
        {
          exitdialogue();
        }
      }
    }
    else if (questword==4.5) 
    {
      if (mouseX>0 && mouseX<300)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=5.5;
        }
      }
      if (mouseX>0 && mouseX<305)
      {
        if (mouseY>425 && mouseY<450)
        {
          exitdialogue();
        }
      }
    }
    else if (questword==5) 
    {
      if (mouseX>0 && mouseX<300)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=6;
        }
      }
    }
    else if (questword==5.5) 
    {
      if (mouseX>0 && mouseX<300)
      {
        if (mouseY>300 && mouseY<330)
        {
          exitdialogue();
          quest=6.5;
        }
      }
    }
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
  float x, y;
  void show()
  {
    ellipse(x+scrollx, y+scrolly, 10, 10);
  }
  void soldieraction()
  {
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


