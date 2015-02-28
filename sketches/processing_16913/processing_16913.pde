
/*
Prototype 
 Tani Koulikov
 Tiffany Mcknight
 Nelson Liang
 
 This shows a very basic layout of our game, and what it will do. 
 We have some of the base artwork done, and how the "car" will react
 when moved. Also it will show how the road wil move as the car 
 iteslf moves.
 */
Obstacle[] g;
int screenNumber;
int a=175,b=600;
int c,d=-650,e,f=-1300;
int life=600;
float a1,b1;
PImage bg,bg1;
void setup()
{
  size (350,650);
  rectMode(CENTER);
  screenNumber = 0;
  bg = loadImage ("bg.jpg");
bg1 = loadImage("bg.jpg");
  g = new Obstacle[11];
  for(int i=0; i<11; i++)
  {
    g[i] = new Obstacle();
    g[i].x = random(175,200);
    g[i].y = 0;
    g[i].h = (int)random(7,10);
    g[i].v = 0.01;
    g[i].show();
    g[i].energy();
  }
  g[1].x=random(80,200);
  g[2].x=random(80,200);
  g[3].x=random(80,200);
  g[4].x=random(80,200);
  g[5].x=random(80,200);
  g[6].x=random(80,200);
  g[7].x=random(80,200);
  g[8].x=random(80,200);
  g[9].x=random(80,200);
  g[10].x=random(80,200);
}
void draw ()
{
  background(0);
  if (screenNumber==0)
  {
    background(255,255,255);
    fill(22,3,252);
    textSize(20);
    text("Click to Start",150,200);
    textSize(15);
    fill(255,0,0);
    text("DO NOT FALL OFF THE SCREEN!!",100,250);
    display();
    
  }
  else if (screenNumber==1)
  {
    background(240,0,0);
    car();
    move();
    //life();
    for(int i=0; i<11; i++)
    {
      g[i].show();
      g[i].energy();
    }
  }
  else if (screenNumber==2)
  {
    textSize(20);
    text("GAME OVER",150,150);
  }
}
/*for(int i=0; i<4; i++)
 {
 g[i].show();
 g[i].energy();
 }*/
void display()
{
  if(mousePressed)screenNumber=1;
}
void car ()
{

  image(bg,c,d);
image(bg1,e,f);
  fill(116,41,131);
  rect(0,300,10,life);
  {
  }
  if(b<600)
  {
    println(d);
    f= f+1;
    d =d+1;
  }
  if(c>650)
  {
    c=0;
  }
  if(d >650)
  {
    d=-1300;
    d= d+1;
  }
  fill(32,102,125);
  rect(a,b,10,10);
  fill(255,13,17);
  rect(b1,a1,20,20);
  {
    a1=a1+5;
  }
  if(a1>650)
  {
    a1=0;
    b1=random(150,250);
  }
  if(a<75)
  {
    a=a+5;
  }
  if(a>275)
  {
    println(a);
    a=a-5;
  }
  if(b>650)
  {
    screenNumber=2;
  }
  if(b<0)
  {
    screenNumber=2;
  }
  if(dist(a,b,b1,a1)<15)
  {

    background(250,0,0);
    life=life-10;
  }
}

class Obstacle
{
  float x,y;
  int h;
  float v;

  void show()
  {
    ellipse(x,y,h,h);
    if(dist(a,b,x,y)<10)
    {
      background(250,0,0);
      println(life);
      life=life-10;
    }
    if(life<0)
    {
      screenNumber=2;
    }
    if(y>650)
    {
      x=random(70,280);
    }
    if(y>650)
    {
      y=0;
    }
  }

  void energy()
  {
    y+= (h + height/2)*v;
  }
}


