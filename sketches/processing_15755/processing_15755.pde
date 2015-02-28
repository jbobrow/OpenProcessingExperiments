
//DodgeIt!  by:Stephen Fung
boolean leftPressed, rightPressed;
cookie[]c;
PImage elmo;
PImage monster;
PImage cookie;
PFont font;
PFont sfont;
int screennumber;
int speed;
int X=250, Y=400;
int score;

void setup()
{
  size(500,500);
  background(255);
  elmo= loadImage("Elmo.gif");
  monster=loadImage("cookiemonster.gif");
  cookie= loadImage("cookie.gif");
  font= loadFont("BerlinSansFB-Bold-30.vlw");
  sfont=loadFont("AngsanaUPC-Bold-57.vlw");
  screennumber = 0;
  c = new cookie[30];
  for(int i=0; i<30; i++)
  {
    c[i] = new cookie();
    c[i].x = random(width);
    c[i].y = random(height/2);
  }
}

void draw()
{
  background(1);
  if (screennumber ==0)
  {
    Intro();
    if (mousePressed) {
      screennumber = 1;
      createCookies();
      score=0;
    }
  }
  else if(screennumber ==1)
  {
    drawchar();
    drawCookies();
    movePlayers();
    displayscore();
  }
  else if(screennumber ==2)
  {
    gameover();
    if (keyCode ==KeyEvent.VK_SPACE) screennumber=0;
  }
}
void createCookies() {
  for(int i=0; i<30; i++)
  {
    c[i] = new cookie();
    c[i].x = random(width);
    c[i].y = random(height/2);
  }
}

void Intro()
{
  fill(255);
  textFont(font);
  text("Dodge It!", 200,250);
  text("Click To Play", 250, 320);
}
void drawchar()
{

  background(255);
  image(elmo,X,Y);
  image(monster,50,20);
}
void displayscore()
{
  fill(150);
  text("SCORE: "+ score, 320,40);
}
void drawCookies()

{
  for(int i=0; i<17; i++)
  {
    fill(255,0,0);
    c[i].move();
    c[i].show();
    if(dist(c[i].x, c[i].y, X, Y)<20)
    {
      screennumber = 2;
    }
  }
}
class cookie
{
  float originalY;
  float x, y;

  void show()
  {


    image(cookie,x,y);
  }

  void move()
  {

    y += 1.5*random(1,2);
    if (y > height) {
      score+=10;
      y = 0;
      x=random(0,width);
    }
  }
}

void gameover()
{

  textFont(font);
  text("Game Over", 150,250);
  text("Press Space To Play Again",110,300);
}

void movePlayers()
{
  speed =2;
  if (rightPressed) X += speed;
  if (leftPressed)  X -= speed;
  if (X<0)X=0;
  if (X>width)X=width;
  if(X>470)X=470;
}

void keyPressed()
{

  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
}

void keyReleased()
{

  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
}


