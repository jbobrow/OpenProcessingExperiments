
int playerX=300;
int playerY=570;
int [] rectX= new int[10];
int [] rectY= new int[10];
int [] rectSize= new int[10];
int [] rectSize2= new int[10];
float [] rectSpeed= new float[10];
boolean [] rectDirection = new boolean [10];
boolean set1 = false;
boolean startup=true;
boolean gameStart=false;
int finishX=0;
SpriteObject player;
SpriteObject goal;
SpriteObject back1;
boolean preGame=true;
boolean gameFinish=false;
boolean gameOver=false;
float timer=0;
boolean newGame=false;
void setup()
{
  finishX=(int)random(0,550);
  back1=new SpriteObject("darkforest.jpg");
  back1.x=220;
  back1.y=280;
  back1.s=4;
player=new SpriteObject("sman.jpg");
player.x=playerX;
player.y=playerY;
player.s=.2;
goal=new SpriteObject("kid.jpg");
  
  
  size(600,600);
  for (int circle=0;circle<10;circle++)
{
   int choice= (int)random(0,2);
  rectX[circle]=(int)random(10,480);
  rectY[circle]=(int)random(50,500);
  rectSize[circle]=(int)random(30,50);
  rectSize2[circle]= rectSize[circle]*2;
  rectSpeed[circle]=random(1,3);
  if(choice==1)
  {
  rectDirection[circle]=true;
  }
  else if (choice==2)
  {
  rectDirection[circle]=false;
  }
   
}
  
  
}

void draw()
{
  player.x=playerX;
player.y=playerY;
int ss = 35;
int sss= 53;
int xx=playerX-18;
int yy=playerY-28;
  if (preGame==true)
  {
    background(200);
    textSize(50);
    fill(200,30,10);
    text("Road of Slendy",120,100);
    textSize(40);
    text("press space to start",80,500);
    textSize(30);
    text("-Help Slendy get the psychic child",40,260);
    text("-Avoid the psychic blocks",40,290);
    text("that the child creates",100,320);
    fill(30,200,10);
    text("use the arrows to move",100,400);
    
  }
  if(gameStart==true)
{
  timer+=.015;
 
//println(timer);
  
  background(200);
  fill(255);
  noStroke();
  rect(-10,0,620,50);
  rect(-10,550,620,50);
      back1.render();
      
  stroke(0);
  fill(0);
  startup=false;
  
 // rect(playerX-18,playerY-28,35,53);
 rect(xx,yy,ss,ss);
    player.render();
//  rect(finishX,0,50,50);
  goal.x=finishX;
  goal.y=8;
  goal.s=.3;
  goal.render();
  if(keyPressed==true)
{
  if(key == 'm')
  {
    
 
  } 
  if (key==  CODED)
    {
    if (keyCode==LEFT)
    {
      playerX-=2;
    }
    if (keyCode==RIGHT)
    {
      playerX+=2;
    }
    if (keyCode==UP)
    {
      playerY-=2;
    }
    if (keyCode==DOWN)
    {
      playerY+=2;
    }
    }
  
}
 
  for (int circle=0;circle<10;circle++)
  {
rect(rectX[circle],rectY[circle],rectSize2[circle] ,rectSize[circle]);
  }
    for (int circle=0;circle<10;circle++)
    {
      if (rectDirection[circle]==false)
      {
        rectX[circle]+=rectSpeed[circle];
      }
      else if (rectDirection[circle]==true)
      {
        rectX[circle]-=rectSpeed[circle];
      }
    }
    for (int circle=0;circle<10;circle++)
    {
      if(rectX[circle]>550)
      {
        rectX[circle]=550;
        rectDirection[circle]=true;
      }
      else if (rectX[circle]<0)
      {
        rectX[circle]=0;
        rectDirection[circle]=false;
      }
    }
    if (playerX<-0)
    {
      playerX=0;
    }
    if (playerX>550)
    {
      playerX=550;
    }
} timerPrinter();
    for (int circle=0;circle<10;circle++)
{


if(player.rectRectIntersect(rectX[circle],rectY[circle],(rectX[circle]+rectSize2[circle]),rectY[circle]+rectSize[circle],xx,yy,xx+ss,yy+sss)== true 
|| timer>20)
{


  background(0);
  textSize(90);
  fill(255,0,0);
  text("Game",190,200);
  text("Over",210,270);
  textSize(40);
  text("Press n for new game",90,400);
  gameStart=false;
  preGame=false;
  gameFinish=false;
  gameOver=true;
}


} // winning condition
if (player.isOverlapping(goal))    
{
      gameFinish=true;
      gameStart=false;
      playerX=finishX;
      background(255,0,0);
    }
    if(gameFinish==true)
    {
      playerX=finishX;
      background(255,0,0);
       textSize(50);
    fill(30,200,10);
    text("You Win",210,100);
    text("Press n for new game",20,400);
    }
    if(newGame==true)
    {
       playerX=300;
 playerY=570;
 set1 = false;
 startup=true;
 gameStart=false;
       gameReset101(); 
 gameStart=false;
 preGame=true;
 gameFinish=false;
 gameOver=false;
 timer=0;
 newGame=false;

      
    }

}

void keyReleased()
{
  if (key == ' ')
  { 
    gameStart=true;
    preGame=false;
  }
  
  if (key == 'n')
  { 
    gameStart=false;
    preGame=false;
    newGame=true;
    gameFinish=false;
    gameOver=false;
  }
}
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
     
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
    
  boolean isMouseOverlapping()
  {
    if (mouseX > (this.x - (this.w * 0.5 * this.s))
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
    
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
       
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s); 
       
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
  
boolean isOverlappingCircle(float cx, float cy, float cr,float cry)
{
 float rx = this.x - (this.w * this.s);
 float ry = this.y - (this.h  * this.s);
 float rw = this.w * this.s;
 float rh = this.h * this.s;
  
  float circleDistanceX = abs(cx - rx - rw);
  float circleDistanceY = abs(cy - ry - rh);
  
  if (circleDistanceX > (rw + cr)) { return false; }
  if (circleDistanceY > (rh + cry)) { return false; }
  if (circleDistanceX <= rw) { return true; }
  if (circleDistanceY <= rh) { return true; }
  
  float cornerDistance = pow(circleDistanceX - rw, 2) + pow(circleDistanceY - rh, 2);
  return cornerDistance <= pow(cr, 2);
}
 boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}
     
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
       
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}
  
boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}

void timerPrinter()
{
   if(timer>0 && timer<1)
  {
    fill(255,0,0);
    text("20",300,100);
  }
   if(timer>1 && timer<2)
   {
    fill(255,0,0);
    text("19",300,100);
  }
    if(timer>2 && timer<3)
  {
    fill(255,0,0);
    text("18",300,100);
  }
   if(timer>3 && timer<4)
   {
    fill(255,0,0);
    text("17",300,100);
  }
    if(timer>4 && timer<5)
  {
    fill(255,0,0);
    text("16",300,100);
  }
   if(timer>5 && timer<6)
   {
    fill(255,0,0);
    text("15",300,100);
  }
    if(timer>6 && timer<7)
  {
    fill(255,0,0);
    text("14",300,100);
  }
   if(timer>7 && timer<8)
   {
    fill(255,0,0);
    text("13",300,100);
  }
  if(timer>8 && timer<9)
  {
    fill(255,0,0);
    text("12",300,100);
  }
   if(timer>9 && timer<10)
   {
    fill(255,0,0);
    text("11",300,100);
  }
    if(timer>10 && timer<11)
  {
    fill(255,0,0);
    text("10",300,100);
  }
   if(timer>11 && timer<12)
   {
    fill(255,0,0);
    text("9",300,100);
   }
    if(timer>12 && timer<13)
   {
    fill(255,0,0);
    text("8",300,100);
  }
    if(timer>13 && timer<14)
  {
    fill(255,0,0);
    text("7",300,100);
  }
   if(timer>14 && timer<15)
   {
    fill(255,0,0);
    text("6",300,100);
  }
  if(timer>15 && timer<16)
   {
    fill(255,0,0);
    text("5",300,100);
  }
    if(timer>16 && timer<17)
  {
    fill(255,0,0);
    text("4",300,100);
  }
   if(timer>17 && timer<18)
   {
    fill(255,0,0);
    text("3",300,100);
  }
  if(timer>18 && timer<19)
   {
    fill(255,0,0);
    text("2",300,100);
  }
    if(timer>19 && timer<20)
  {
    fill(255,0,0);
    text("1",300,100);
  }
   if(timer>20)
   {
    fill(255,0,0);
    text("0",300,100);
  }
 
}
void gameReset101()
{
   for (int circle=0;circle<10;circle++)
{
   int choice= (int)random(0,2);
  rectX[circle]=(int)random(10,480);
  rectY[circle]=(int)random(50,500);
  rectSize[circle]=(int)random(30,50);
  rectSize2[circle]= rectSize[circle]*2;
  rectSpeed[circle]=random(1,3);
  if(choice==1)
  {
  rectDirection[circle]=true;
  }
  else if (choice==2)
  {
  rectDirection[circle]=false;
  }
   
}
}


