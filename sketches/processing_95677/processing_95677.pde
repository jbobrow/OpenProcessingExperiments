
int x = 0;
int y = 0;
int a = 470;
int b = 470;
int xdir = 0;
int ydir = 0;
int adir = 0;
int bdir = 0;
int boxx = 230;
int boxy = 230;
int speed = 1;
int speed2 = 1;
int score1 = 0;
int score2 = 0;
int running = 1;

void setup()
{
  background (0,0,255);
  size(500, 500);
  textFont (createFont("Verdana",16));
}

void draw()
{
  x=x+xdir;
  y=y+ydir;
  a=a+adir;
  b=b+bdir;
   fill (0,0,0);
  stroke (0,0,0);
  rect (x,y,30,30);
  fill (255,255,255);
  stroke (255,255,255);
  rect (a,b,30,30);
  fill (random(255),random(255),random(255));
  stroke (random(255),random(255),random(255));
  rect (boxx,boxy,20,20);

  if ( (a>boxx&&a<boxx+20&&b>boxy&&b<boxy+20) || (a+30>boxx&&a+30<boxx+20&&b+30>boxy&&b+30<boxy+20) || (a+30>boxx&&a+30<boxx+20&&b>boxy&&b<boxy+20) || (a>boxx&&a<boxx+20&&b+30>boxy&&b+30<boxy+20) )  {
    fill (0,0,255);
    stroke (0,0,255);
    rect (boxx,boxy,20,20);
    boxx = (int) random(480);
    boxy = (int) random(480);
    fill (0,0,255);
    text (score2,425,490);
     score2=score2+1;
    fill (random(255),random(255),random(255));

    
    
     
  }  
  if ( (x>boxx&&x<boxx+20&&y>boxy&&y<boxy+20) || (x+30>boxx&&x+30<boxx+20&&y+30>boxy&&y+30<boxy+20) || (x+30>boxx&&x+30<boxx+20&&y>boxy&&y<boxy+20) || (x>boxx&&x<boxx+20&&y+30>boxy&&y+30<boxy+20) )  {
    fill (0,0,255);
    stroke (0,0,255);
    rect (boxx,boxy,20,20);
    boxx = (int) random(480);
    boxy = (int) random(480);
    text (score1,105,20);
    score1=score1+1;
    fill (random(255),random(255),random(255));
  }
 if ( (a>boxx&&a<boxx+20&&b>boxy&&b<boxy+20) || (a+15>boxx&&a+15<boxx+20&&b+15>boxy&&b+15<boxy+20) || (a+15>boxx&&a+15<boxx+20&&b>boxy&&b<boxy+20) || (a>boxx&&a<boxx+20&&b+15>boxy&&b+15<boxy+20) )  {
    fill (0,0,255);
    stroke (0,0,255);
    rect (boxx,boxy,20,20);
    boxx = (int) random(480);
    boxy = (int) random(480);
    fill (0,0,255);
    text (score2,425,490);
     score2=score2+1;
    fill (random(255),random(255),random(255));

    
    
     
  }  
  if ( (x>boxx&&x<boxx+20&&y>boxy&&y<boxy+20) || (x+15>boxx&&x+15<boxx+20&&y+15>boxy&&y+15<boxy+20) || (x+15>boxx&&x+15<boxx+20&&y>boxy&&y<boxy+20) || (x>boxx&&x<boxx+20&&y+15>boxy&&y+15<boxy+20) )  {
    fill (0,0,255);
    stroke (0,0,255);
    rect (boxx,boxy,20,20);
    boxx = (int) random(480);
    boxy = (int) random(480);
    text (score1,105,20);
    score1=score1+1;
    fill (random(255),random(255),random(255));
  }    
   if (x>boxx&&x<boxx+20&&y>boxy&&y<boxy+20)  {
    fill (0,0,255);
    stroke (0,0,255);
    rect (boxx,boxy,20,20);
    boxx = (int) random(480);
    boxy = (int) random(480);
   }

   fill (0,0,255);
   stroke (0,0,255);
   rect (48,5,78,20); 
   fill (0,0,255);
   rect (367,475,78,20); 
   fill (random(255),random(255),random(255)); 
   text ("Score", 50, 20);
   text (score1,105,20);
   text ("Score", 370, 490);
   text (score2,425,490);
   
}

void keyPressed()
{
if (key == 'x')  {
    speed2=speed2-2;
  }
  if (key == 'd')  {
  xdir = speed2;
  ydir = 0;
  }
  if (key == 'a')  {
  xdir = -speed2;
  ydir = 0;
  }
  if (key == 'w')  {
  ydir = -speed2;
  xdir = 0;
  }
  if (key == 's')  {
  ydir = speed2;
  xdir = 0;
  }
  if (keyCode == RIGHT)  {
  adir = speed;
  bdir = 0;
  }
  if (keyCode == LEFT)  {
  adir = -speed;
  bdir = 0;
  }
  if (keyCode == UP)  {
  bdir = -speed;
  adir = 0;
  }
  if (keyCode == DOWN)  {
  bdir = speed;
  adir = 0;
  }
  if (key == 'm')  {
    speed = speed + 2;
  }
  
  if (key == 'z')  {
    speed2 = speed2+2;
  }
  
  if (score1>4&&score1<6)  {
    speed2=3;
  }
  if (score2>4&&score2<6)  {
    speed=3;
  }
   if (score1>9&&score1<11)  {
    speed2=5;
  }
  if (score2>9&&score2<11)  {
    speed=5;
  }
  if (score1>19&&score1<21)  {
    speed2=7;
  }
  if (score2>19&&score2<21)  {
    speed=7;
  }
  if (x<0)  {
    x=0;
  }
  if (x>470)  {
    x=470;
  }
  if (y<0)  {
    y=0;
  }
  if (y>470)  {
    y=470;
  }
  if (a<0)  {
    a=0;
  }
  if (a>470)  {
    a=470;
  }
  if (b<0)  {
    b=0;
  }
  if (b>470)  {
    b=470;
  }
  if (key == 'n')  {
    speed=speed-2;
  }
  if (score2>24&&score2<26)  {
    noLoop();
    running=0;
    fill (random(255),random(255),random(255));
    text ("Player Two Wins! Press R", 145,250);
  }
  if (score1>24&&score1<26)  {
    noLoop();
    running=0;
    fill (random(255),random(255),random(255));
    text ("Player One Wins! Press R", 145,250);
  }
    
  if (key == 'r'&&running<=0)  {
    loop();
    background (0,0,255);
    score1=0;
    score2=0;
    a=470;
    b=470;
    x=0;
    y=0;
    boxx=230;
    boxy=230;
    speed=1;
    speed2=1;
    xdir=0;
    ydir=0;
    adir=0;
    bdir=0;
  }
}  


void mousePressed()
{
  
}
  


