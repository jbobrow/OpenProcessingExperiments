
/**
 *Nelson Liang 
 *10/29/10
 *alpha
 **/
//stuff

boolean rightpressed,leftpressed,downpressed,uppressed;
boolean wpressed,apressed,dpressed,spressed;
int trapspeed;
int trapspeed1;
int thunderSpeed;
int thunderSpeed1;
int screenNumber;
int ascore,bscore;
PImage Kart1;
PImage money;
PImage money1;
PImage thunder;
PImage yellow;
PImage pink;
PImage purple;
PImage fire;
PImage orage;
PImage bomb;
PImage k;
PImage l;
float x;
float p=35,q=120;
float y=35,z=450;
float g,f,h,i;
float TrapX=300,TrapY,TrapX1=300,TrapY1=300;
float thunderX=80,thunderY,thunderX1=80,thunderY1=300;
void setup()
{
  size (1000,600);
  smooth();
  imageMode(CENTER);
  rectMode(CENTER);
  Kart1 = loadImage("kart.gif");
  money = loadImage("money.gif");
  money1 = loadImage("mone.gif");
  thunder =loadImage("thunder.gif");
  yellow= loadImage("yellow.gif");
  pink= loadImage("pink.gif");
  purple = loadImage("purple.gif");
  fire = loadImage ( "fire.gif");
  orage = loadImage ("orange.gif");
  bomb = loadImage("bomb.gif");
  k= loadImage ("k.gif");
l = loadImage ("h.gif");
  screenNumber = 0 ;
  placeprizerandomly ();
  placeprizerandomly1();
  rectMode(CENTER);
  trapspeed=8;
  trapspeed1=2;
  thunderSpeed=8;
  thunderSpeed1=8;
  yellowSpeed=8;
  yellowSpeed1=8;
  pinkspeed=8;
  pinkspeed1=8;
  purplespeed=8;
  purplespeed1=8;
  firespeed=8;
  firespeed1=8;
  oragespeed=8;
  oragespeed1=8;
  bombspeed=8;
  bombspeed1=8;
  bombspeed2=8;
  bombspeed3=8;
  kspeed=8;
  kspeed1=8;
   lspeed=8;
 lspeed1=8;
lspeed2=8;
lspeed3=8;
}
void draw ()
{
  background (0);
  if (screenNumber==0)
  {
    display1();
    kart();
 
  }
  else if ( screenNumber == 1 )
  {
    iteam();
    move();
    money();
    money1();
    checkprize();
    score();
    images();
  }
  else if ( screenNumber ==2 )
  {
    textSize(100);
    text("Game Over",250,250);
    textSize(50);
    text("PINK OWN!!!=D",350,350);
    if(mousePressed) 
    {
     p=35;
     q=120;
      screenNumber = 1;
      bscore=0;
      ascore=0;
    }
  }
  else if (screenNumber==3)
  {
    fill(0,40,255);
    textSize(100);
    text("Game Over",250,250);
    textSize(50);
    text("BLUE OWN!!!=D",350,350);
    if(mousePressed)
    {
      y=35;
      z=450;
      screenNumber=1;
      ascore=0;
      bscore=0;
    }
  }
  else if (screenNumber==4)
  {
   fill(225);
  }
}
void display1()
{
  fill(255,255,255);
  //text 
  textSize(60);
  fill(145,143,240);
  text( "Go Kart!",random(400,410),random(100,120));
  fill(250,250,250);
  textSize(20);
  text("Click To",80,260);
  textSize(60);
  fill(255,2,2);
  text("START",80,320);
  if(mousePressed) screenNumber = 1 ;
}
//KART
void kart()
{
  fill(0,200,0);
  image(Kart1,x= x+1,300);
  if(x>748)
  {
   x=-200;
  }
 
}

void iteam()
{
  stroke(255);
  line(0,300,1000,300);
  image(thunder,thunderX,thunderY);
 thunderY= thunderY+thunderSpeed;
if(thunderY > 300 || thunderY<-20)
  {
    thunderSpeed = thunderSpeed*-1;
  }
  image(thunder,thunderX1,thunderY1);
 thunderY1= thunderY1+thunderSpeed1;
if(thunderY1 >600|| thunderY1<301)
  {
    thunderSpeed1 = thunderSpeed1*-1;
  }
  rect(TrapX,TrapY,10,10);
  TrapY = TrapY+trapspeed;
  if(TrapY >300|| TrapY<0)
  {
    trapspeed = trapspeed*-1;
  }
   rect(TrapX1,TrapY1,10,10);
  TrapY1 = TrapY1+trapspeed;
  if(TrapY1 >300|| TrapY1<0)
  {
    trapspeed1 = trapspeed1*-1;
  }
  fill(122,140,209);
  rect( p,q,20,20);
  if(q>279)
  {
   screenNumber=2;
  }
  fill(252,23,226);
  rect(y,z,20,20);
  if (z<301)
  {
    screenNumber=3;
  }
} 
void move()
{
  if (rightpressed) p+=4;
  if (leftpressed) p-=4;
  if (uppressed) q-=4;
  if (downpressed)q+=4;
  if (dpressed) y+=4;
  if (apressed) y-=4;
  if (wpressed) z-=4;
  if (spressed)z+=4;
}
void keyPressed()
{
  if(keyCode == RIGHT ) rightpressed = true;
  if(keyCode == LEFT)leftpressed = true;
  if(keyCode == UP) uppressed = true;
  if(keyCode == DOWN) downpressed = true;
  if (key == 'w') wpressed = true;
  if (key == 'a') apressed = true;
  if (key == 's') spressed = true;
  if (key == 'd') dpressed = true;
}
void keyReleased ()
{
  if(keyCode == RIGHT ) rightpressed = false;
  if (keyCode == LEFT)leftpressed = false;
  if(keyCode == UP) uppressed =false;
  if(keyCode== DOWN) downpressed = false;
   if (key == 'w') wpressed = false;
  if (key == 'a') apressed = false;
  if (key == 's') spressed = false;
  if (key == 'd') dpressed = false;
}
 void money ()
  {
    image(money,g,f);
  }
void money1()
{
  image(money1,h,i);
}
void checkprize()
{
  if(abs(p - g) < 15 && abs(q - f) < 15)
  {
    ascore+=1;    placeprizerandomly ();
  }
  if(abs(y - h) < 15 && abs(z - i) < 15)
  {
    bscore+=1; placeprizerandomly1();
  }
  if(ascore>5)
  {
    screenNumber=3;
  }
  if(bscore>5d)
  {
    screenNumber=2;
  }
}
void placeprizerandomly ()
{
  g= random(width);
  f = random (0,height/2);  
}
void placeprizerandomly1 ()
{
   h = random(0,1000);
 i = random(300,600);
}
void score ()
{
  textSize(20);
  fill(0,20,255);
  text("BLUE"+ascore,10,20);
  fill(255,0,209);
  text("PINK"+bscore,900,20);
  if(dist(p,q,TrapX,TrapY)<15)
  {
    screenNumber=2;
  }
   if(dist(y,z,TrapX1,TrapY1)<15)
  {
    screenNumber=3;
  }
   if(dist(p,q,orageX,orageY)<10)
  {
    screenNumber=2;
  }
    if(dist(y,z,orageX1,orageY1)<10)
  {
    screenNumber=3;
  }
     if(dist(p,q,fireX,fireY)<15)
  {
    screenNumber=2;
  }
      if(dist(y,z,fireX1,fireY1)<15)
  {
    screenNumber=3;
  }
       if(dist(p,q,purpleX,purpleY)<15)
  {
    screenNumber=2;
  }
        if(dist(y,z,purpleX1,purpleY1)<15)
  {
    screenNumber=3;
  }
         if(dist(p,q,pinkX,pinkY)<15)
  {
    screenNumber=2;
  }
          if(dist(y,z,pinkX1,pinkY1)<15)
  {
    screenNumber=3;
  }
           if(dist(p,q,yellowX,yellowY)<15)
  {
    screenNumber=2;
  }
          if(dist(y,z,yellowX1,yellowY1)<15)
  {
    screenNumber=3;
  }
    if(dist(p,q,thunderX,thunderY)<15)
  {
    screenNumber=2;
  }
          if(dist(y,z,thunderX1,thunderY1)<15)
  {
    screenNumber=3;
  }
            if(dist(p,q,bombX,bombY)<15)
  {
    screenNumber=2;
  }
             if(dist(p,q,bombX1,bombY1)<15)
  {
    screenNumber=2;
  }
               if(dist(y,z,bombX2,bombY2)<15)
  {
    screenNumber=3;
  }
                 if(dist(y,z,bombX3,bombY3)<15)
  {
    screenNumber=3;
  }
                   if(dist(p,q,kX,kY)<15)
  {
    screenNumber=3;
  }
                     if(dist(y,z,kX1,kY1)<15)
  {
    screenNumber=3;
  }
 
            if(dist(p,q,lX,lY)<15)
  {
    screenNumber=2;
  }
             if(dist(p,q,lX1,lY1)<15)
  {
    screenNumber=2;
  }
               if(dist(y,z,lX2,lY2)<15)
  {
    screenNumber=3;
  }
                 if(dist(y,z,lX3,lY3)<15)
  {
    screenNumber=3;
  }
  if(p<0)
  {
    p=p+10;
  }
  if(q<0)
  {
    q=q+10;
  }
  if(p>width)
  {
    p=p-10;
  }
  if(y<0)
  {
    y=y+10;
  }
  if(z>height)
  {
    z=z-10;
  }
  if(y>width)
  {
    y=y-10;
  }
}

