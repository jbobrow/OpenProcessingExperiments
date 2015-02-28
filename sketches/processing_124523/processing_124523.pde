
PFont font;
ArrayList asteroids;
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
  size(500,500);
  asteroids = new ArrayList();
  noCursor();

}

void draw()
{
  background(0);
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
    text("Enemy health: " + h, 10, 47);
    if(shots != 0)
    {
      text("Accuracy: " + int(hits) + "/" + int(shots), 10, 63);
    }
    time++;
  }
  else
  {
    textFont(font, 40);
    text("YOU LOSE",10,40);
    textFont(font,20);
    text("SCORE: " + score,10,70);
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
    ellipse(x,y,r,r);
    float hbar = health/maxHealth * 20;
    println(health + "" + maxHealth);
    fill(255,0,0);
    textFont(font, 15);
    text(health, x - 2, y + 5);
  }
}
void spawn()
{
  if(time == 30)
  {
    time = 0;
    Asteroid ta = new Asteroid(int(random(30,470)), int(random(20,40)), spd, h);
    asteroids.add(ta);
    ta = null;
    ac++;
  }
}

void moveAst()
{
    for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid ta = (Asteroid)asteroids.get(i);
    ta.move();
    ta = null;
  }
}

void display()
{
  for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid ta = (Asteroid)asteroids.get(i);
    ta.display();
    ta = null;
  }
  fill(255);
  rect(mouseX-20,480,40,500);
  rect(mouseX-10,470,20,480);
  if(shoot)
  {
    stroke(255);
    line(mouseX,0,mouseX,500);
    stroke(0);
  }
}

void atk()
{
  if(shoot)
  {
    for(int i = 0; i < asteroids.size(); i++)
    {
      Asteroid ta = (Asteroid) asteroids.get(i);
      if(mouseX < ta.x + ta.r && mouseX > ta.x - ta.r)
      {
        ta.health -= 1;
        if(ta.health <= 0)
        {
          ta = null;
          asteroids.remove(i);
          score += int(spd) + h;
        }
        hits ++;
        score ++;
      }
    }
  } 
}

void checkLoss()
{
  for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid ta = (Asteroid) asteroids.get(i);
    if(ta.y > 500)
    {
      lose = true;
    }
  }
}

void difficultyChange()
{
  if(spd < 8 && ac >= 10)
  {
    spd = ac / 10;
  }
  if(h < 3 && ac >= 10)
  {
    h = int(ac / 10);
  }
  
}



