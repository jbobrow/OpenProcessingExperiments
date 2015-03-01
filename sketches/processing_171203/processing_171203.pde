
PImage back;
PImage worm;
PImage apple;
PFont font;
ArrayList apples;
int ac = 1;
int time;
int spd = 1;
int h = 1;
int score;
boolean shoot;
boolean lose;
float hits;
float shots;
 
 
 
void setup()
{
  font = loadFont("AgencyFB-Reg-20.vlw");
  apple = loadImage ("Apple.png");
  worm = loadImage ("work.png");
  back = loadImage ("background.jpg");
  size(500,500);
  apples = new ArrayList();
  noCursor();
 
}
 
void draw()
{
  image(back);
  frameRate(30);
  if(!lose)
  {
    difficultyChange();
    spawn();
    moveAst();
    atk();
    display();
    checkLoss();
    textFont(font, 20);
    text("Score: " + score, 10,15);
    text("Speed: " + spd, 10,31);
    if(shots != 0)
    {
    }
    time++;
  }
  else
  {
    textFont(font, 40);
    text("YOU LOSE",10,460);
    textFont(font,20);
    text("SCORE: " + score,10,430);
  }
 
  shoot = false;
}
 
 
void mousePressed()
{
  
  shoot = true;
  shots ++;
}
class Asteroid
{
  int x;
  int y;
  int r;
  int maxHealth;
  int health;
  float speed;
   
  Asteroid(int tx, int tr, float tspeed, int th)
  {
    x = tx;
    r = tr;
    speed = tspeed;
    maxHealth = th;
    health = maxHealth;
  }
   
  void move()
  {
    y += speed;
  }
   
  void display()
  {
    fill(255);
    
    image(apple,x,y,r,r);
    float hbar = health/maxHealth * 20;
    println(health + "" + maxHealth);
    fill(255,0,0);

  }
}
void spawn()
{
  if(time == 30)
  {
    time = 0;
    Asteroid ta = new Asteroid(int(random(30,470)), int(random(20,40)), spd, h);
    apples.add(ta);
    ta = null;
    ac++;
  }
}
 
void moveAst()
{
    for(int i = 0; i < apples.size(); i++)
  {
    Asteroid ta = (Asteroid)apples.get(i);
    ta.move();
    ta = null;
  }
}
 
void display()
{
  for(int i = 0; i < apples.size(); i++)
  {
    Asteroid ta = (Asteroid)apples.get(i);
    ta.display();
    ta = null;
  }
  fill(255);
  image (worm,mouseX-30,480,40,500);
  
  if(shoot)
  {
    stroke(255);
    image(worm,mouseX,0,mouseX,500);
    stroke(0);
  }
}
 
void atk()
{
  if(shoot)
  {
    for(int i = 0; i < apples.size(); i++)
    {
      Asteroid ta = (Asteroid) apples.get(i);
      if(mouseX < ta.x + ta.r && mouseX > ta.x - ta.r)
      {
        ta.health -= 1;
        if(ta.health <= 0)
        {
          ta = null;
          apples.remove(i);
         
        }
        hits ++;
        score ++;
      }
    }
  }
}
 
void checkLoss()
{
  for(int i = 0; i < apples.size(); i++)
  {
    Asteroid ta = (Asteroid) apples.get(i);
    if(ta.y > 500)
    {
      lose = true;
    }
  }
}
 
void difficultyChange()
{
  if(spd = 1000 )
  {
    spd = ac / 10;
  }
  if(h < 1 && ac >= 10)
  {
    h = int(ac / 10);
  }
   
}



