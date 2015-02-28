
//BRENDAN M. COMPUTER PROGRAMMING 1, MODS 4-5

int x=30;
int y=250;
int o=570;
int p=250;
int co=570;
int cp=250;
int dir= RIGHT;
int dos= LEFT;
int codr= LEFT;
int menu=4;
boolean game= false;


void setup()
{
  size(600,700);
  background(0);
  
}


void draw()
{
  if (menu==4)
  {
    menu();
     keyPressed();
  if (key=='1')
  {
    background(0);
    menu=1;
    singleplayer();
  }
  else if (key=='2')
  { 
    background(0);
    menu=2;
    twoplayer();
  }
  }
  else if (menu==1)
  {
    singleplayer();
  }
  else if (menu==2)
  {
    twoplayer();
  }}
  
  //MENU
 void menu()
 {
   background(0);
  fill(random(255),random(255),random(255));
  textSize(90);
  textAlign(CENTER);
  text("TRON",300,200);
  textSize(35);
  fill(255);
  text("SINGLEPLAYER- PRESS 1",300,350);
  text("TWO PLAYER VERSUS- PRESS 2",300,450);
  textAlign(LEFT);
  textSize(15);
  text("Brendan M, Computer Programming 1, mods 4-5",10,650);
  keyPressed();
  if (key=='1')
  {
    background(0);
    menu=1;
    singleplayer();
  }
  if (key=='2')
  { 
    background(0);
    menu=2;
    twoplayer();
  }
 }

//SINGLEPLAYER

void singleplayer()
{
  menu=1;
  frameRate(180);
  stroke(255);
  line(0,0,600,0);
  line(0,0,0,500);
  line(0,500,600,500);
  line(600,500,600,0);  
  noStroke();
  fill(random(255),random(255),random(255));
  textSize(90);
  textAlign(CENTER);
  text("TRON",300,600);
  rect(155,630,300,10);
  stroke(255);
  
     if(get(x,y) != color(0))
  {
    dir = -1; 
    fill (255,150,255);
    textSize(20);
    textAlign(CENTER);
    text("COMPUTER PLAYER IS VICTORIOUS",300,150);
    game = false;
  } 
   if (get(co,cp) != color(0))
  {
    dos = -1;
    fill (255,150,255);
    textSize(20);
    textAlign(CENTER);
    text("HUMAN PLAYER IS VICTORIOUS",300,150);
    game = false;
  }
  
if (game == false && dir!=-1 && dos!=-1)
{
   textSize(30);
  fill(random(255),random(255),random(255));
   text("Press P to Start!",300,680);
}

else
{
  textSize(DOWN);
  fill(random(255),random(255),random(255));
  text("GAME OVER",300,680);
}
if (game==false && dir==-1 || dos==-1)
{
 textAlign(LEFT);
 text("BACK (PRESS B)",300,400);
   
   if (key=='b' || key=='B')
   {
     menu=4;
     x=30;
     y=250;
     o=570;
     p=250;
     co=570;
     cp=250;
     dir= RIGHT;
     dos= LEFT;
     codr= LEFT;
     game= false;
   }
}

keyPressed();
if (key=='p' || key=='P')
{
  game=true;
}

if (game == true)  
{
noStroke();
fill(0);
rect(0,650,600,100);
stroke(255);
  
  
  point(x,y);
if (dir==RIGHT)
  {
    x=x+1;
  }
else if (dir==LEFT)
  {
    x=x-1;
  }
else if (dir==UP)
  {
    y=y-1;
  }
else if (dir==DOWN)
  {
    y=y+1;
  }
  
  point (co,cp);
if (codr==RIGHT)
  {
    co=co+1;
    if (get(co+3,cp) != color(0))
    {
      codr=DOWN;
    }

  }
else if (codr==LEFT)
  {
    co=co-1;
    if (get(co-3,cp) != color(0))
    {
      codr=UP;
    }
  }
else if (codr==UP)
  {
    cp=cp-1;
    if (get(co,cp-3) != color(0))
    {
      codr=RIGHT;
    }
  }
else if (codr==DOWN)
  {
    cp=cp+1;
    if (get(co,cp+3) != color(0))
    {
      codr=LEFT;
    }
  }
keyPressed();
  
if (key=='w' && dir != DOWN)
    {
      dir=UP;
    }
    
if (key=='a' && dir != RIGHT)
    {
      dir=LEFT;
    }
    
if (key=='s' && dir != UP)
    {
      dir=DOWN;
    }
    
if (key=='d' && dir != LEFT)
    {
      dir=RIGHT;
    }  
}
}

//MULTIPLAYER

void twoplayer()
{
  menu=2;
  frameRate(150);
  stroke(255);
  line(0,0,600,0);
  line(0,0,0,500);
  line(0,500,600,500);
  line(600,500,600,0);  
  noStroke();
  fill(random(255),random(255),random(255));
  textSize(90);
  textAlign(CENTER);
  text("TRON",300,600);
  noStroke();
  rect(155,630,300,10);
  stroke(255);
 
  
     if(get(x,y) != color(0))
  {
    dir = -1; 
    fill (255,150,255);
    textSize(20);
    textAlign(CENTER);
    text("PLAYER 2 IS VICTORIOUS",300,150);
    game = false;
  } 
  
  if (get(o,p) != color(0))
  {
    dos = -1;
    fill (255,150,255);
    textSize(20);
    textAlign(CENTER);
    text("PLAYER 1 IS VICTORIOUS",300,150);
    game = false;
  } 
  
if (game == false && dir!=-1 && dos!=-1)
{
   textSize(30);
  fill(random(255),random(255),random(255));
   text("Press P to Start!",300,680);
}

else
{
   textSize(DOWN);
   fill(random(255),random(255),random(255));
   text("GAME OVER",300,680);
}
if (game==false && dir==-1 || dos==-1)
{
 textAlign(LEFT);
 text("BACK (PRESS B)",300,400);
   
   if (key=='b' || key=='B')
   {
     menu=4;
     x=30;
     y=250;
     o=570;
     p=250;
     co=570;
     cp=250;
     dir= RIGHT;
     dos= LEFT;
     codr= LEFT;
     game= false;
   }
}
keyPressed();
if (key=='p' || key=='P')
{
  game=true;
}

if (game == true)  
{
noStroke();
fill(0);
rect(0,650,600,100);
stroke(255);
    
point (o,p);
if (dos==RIGHT)
  {
    o=o+1;
  }
else if (dos==LEFT)
  {
    o=o-1;
  }
else if (dos==UP)
  {
    p=p-1;
  }
else if (dos==DOWN)
  {
    p=p+1;
  }

  
point(x,y);
if (dir==RIGHT)
  {
    x=x+1;
  }
else if (dir==LEFT)
  {
    x=x-1;
  }
else if (dir==UP)
  {
    y=y-1;
  }
else if (dir==DOWN)
  {
    y=y+1;
  }
keyPressed();
  
if (key=='w' && dir != DOWN)
    {
      dir=UP;
    }
    
if (key=='a' && dir != RIGHT)
    {
      dir=LEFT;
    }
    
if (key=='s' && dir != UP)
    {
      dir=DOWN;
    }
    
if (key=='d' && dir != LEFT)
    {
      dir=RIGHT;
    }   

if (keyCode==UP && dos != DOWN)
    {
      dos=UP;
    }
    
if (keyCode==LEFT && dos != RIGHT)
    {
      dos=LEFT;
    }
    
if (keyCode==DOWN && dos != UP)
    {
      dos=DOWN;
    }
    
if (keyCode==RIGHT && dos != LEFT)
    {
      dos=RIGHT;
    } 

}
}
