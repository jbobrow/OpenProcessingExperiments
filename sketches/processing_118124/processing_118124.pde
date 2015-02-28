
PImage gameover;
PImage rumskib;
float xPrik;
float yPrik;
int move;
int bombeSpeedMin;
int bombeSpeedMax;
int cirkelStorrelse;
float spawn;
float spawnHastighed;
ArrayList bombeList;
boolean rumskibAlive;
int liv;
int a;
int b;
int c;
int d;

void varstart() {
  move = 5;
  bombeSpeedMin = 2;
  bombeSpeedMax = 5;
  cirkelStorrelse =20;
  spawn =0;
  spawnHastighed=0.02;
  rumskibAlive=true;
  xPrik = width/2;
  yPrik = height-height*0.2;
  liv=3;

}


void setup()
{

  size(700, 700);
  varstart();
  bombeList = new ArrayList();
  gameover = loadImage("gameover.jpg");
  rumskib = loadImage("rumskib.png");
  
  a=5;
  b=10;

}


void draw()
{
  background(255, 255, 255);

  image(rumskib, xPrik, yPrik, width*0.08, height*0.2);
  fill(0, 0, 0);
  move();


  if (liv == 0)
  {
    image(gameover, 0, 0, width, height);
    if (keyPressed)
    { 
      if (key == 'r'||key == 'R')
      {
        varstart();
      }
    }
  }

  alive();





  if (rumskibAlive == true)
  {
    bombe1();
  }
  
  text("Liv: "+liv, 20, 30);
  
  d=sum(a,b);
  println(d);
  text("SUM: "+d, 20, 60);
  

  
  
  
  
}





 int sum(int x,int y)
 {
  c=x+y;
   
  return c; 
   
 }












void move()
{
  //venstre
  if (keyPressed)
  { 
    if (keyCode == LEFT)
    {

      xPrik = xPrik-move;
    }
    if (keyCode == RIGHT)
    {

      xPrik = xPrik+move;
    }
  }

  if (xPrik<=0)
  {
    xPrik=0;
  }

  if (xPrik>=width-width*0.08)
  {
    xPrik=width-width*0.08;
  }
}

void alive()
{
 if(rumskibAlive == false)
 {
   liv=liv-1;
   rumskibAlive = true;
 } 
 
 
}
void bombe1()
{
  if (liv>0) {spawn = spawn+spawnHastighed; 
  while (spawn>=1 )
  {
    bombe newbombe = new bombe();
    bombeList.add(newbombe);
    spawn--;
  }
  }
  spawnHastighed+=0.00001;

  for (int i=0; i<bombeList.size();i++)
  {
    bombe ginger = (bombe) bombeList.get(i);

    if (ginger.alive)
    {
      ginger.run();
    }
    else
    {
      bombeList.remove(ginger);
    }
  }
}
class bombe
{
  float bombeHastighed = random(bombeSpeedMin, bombeSpeedMax);
  float bombeX = random(1, width);
  float bombeY = random(-500, -1);  
  boolean alive = true;

  bombe()
  {
  } 
  void run ()
  {
    bombeY+= bombeHastighed;
    ellipse(bombeX, bombeY, cirkelStorrelse, cirkelStorrelse);
    if (point_distance(bombeX, bombeY, xPrik+(width*0.08)/2, yPrik+(height*0.2)/2)<(width*0.08+height*0.2)*0.2041) {
      rumskibAlive=false;
      for (int i=0; i<bombeList.size();i++)
      {
        bombe ginger = (bombe) bombeList.get(i);
        ginger.alive=false;
      }
    }
  }
}
/*
////////////////////////////////////////////
//       Pete's dejlige comands. :)       //
////////////////////////////////////////////
*/

float point_direction(float x1, float y1, float x2, float y2) {
  float dir = 180+atan2(-(y1-y2), (x1-x2))*180/PI;
  return  dir;
}

float point_distance(float x1, float y1, float x2, float y2) {
  float dis = abs(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
  return dis;
}

float lengthdir_x(float len, float dir) {
  float lengthdir = cos(dir*PI/180)*len;
  return lengthdir;
}

float lengthdir_y(float len, float dir) {
  float lengthdir = -sin( dir * PI/180)*len;
  return lengthdir;
}


