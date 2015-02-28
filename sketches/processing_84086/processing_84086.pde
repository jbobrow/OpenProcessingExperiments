
//Derek Chan, Pong, CP1 Mods 14-15
int score=0;
int compScore=8990;
int x;
int y;
int z=350;
PImage you;
PImage opponent;
PImage A;
PImage lose;
int a=350;
boolean gameover=false;
Paddle yours = new Paddle();
Paddle theirs = new Paddle();
Honor grade = new Honor();
void setup()
{
  you=loadImage("MyChonny.jpg");
  opponent=loadImage("father.jpg");
  A=loadImage("A+.jpg");
  lose=loadImage("defeat.jpg");
  size(700, 700);
}
void draw()
{
  line(690, 450, 690, 375);
  if (gameover!=false);
  { 
    background(0);
    yours.yours();
    yours.keyTyped();
    theirs.theirs();
    grade.show();
    grade.move();
    grade.bounce();
  }
  scoreboard();
}
class Honor
{
  boolean up, left;
  Honor()
  {
    x=350;
    y=425;
    up=true;
    left=true;
  }
  void show()
  {
    stroke(255);
    ellipse(x, y, 35, 35);
    image(A, x-12.5, y-12.5, 18, 18);
  }
  void move()
  {
    if (up==true)
    {
      y-=10;
    }
    else
    {
      y+=10;
    }
    if (left==true)
    {
      x-=10;
    }
    else
    {
      x+=10;
    }
  }
  void bounce()
  {
    if(get(x-18,y)==color(255,0,0)||get(x-18,y-20)==color(255,0,0)||get(x-18,y+20)==color(255,0,0))    
    {
      left=!left;
    }
    if (y<=175 || y>=675)
    {
      up=!up;
    }
    if (x<=0||x>=650)
    {
      left=!left;
    }
    if (x<=0)
    {
      compScore++;
      x=350;
      y=425;
    }
    if (x>=700)
    {
      score++;
      x=350;
      y=425;
    }
  }
}
void scoreboard()
{
  stroke(255);
  strokeWeight(1);
  fill(255);
  line(0, 150, 700, 150);
  image(you, 0, 0, 150, 150);
  image(opponent, 550, 0, 150, 150);
  textAlign(CENTER);
  textSize(50);
  text(score, 200, 50);
  text(compScore, 475, 50);
  textSize(25);
  text("YOU", 200, 100);
  text("MASTER", 475, 100);
  text("ROSHI", 475, 130);
  if (compScore>9000)
  {
    gameover=true;
    image(lose, 0, 0, 750, 750);
  }
}
class Paddle
{
  void keyTyped()
  {
    if (keyPressed==true)
    {
      if (keyCode==DOWN&&a<600)
      {
        a=a+10;
      }
      if (keyCode==UP&&a>150)
      {
        a=a-10;
      }
    }
  }
  void yours()
  {
    stroke(255,0,0);
    strokeWeight(10);
    line(10, a, 10, a+75);
  }
   void theirs()
  {
    stroke(0, 255, 0);
    line(690, z, 690, z+75);
      if (x>=650)
      {
        z=y;
      }
    }
  }




