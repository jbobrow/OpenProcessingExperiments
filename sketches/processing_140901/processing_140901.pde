
ArrayList asteroids;
int h = 1;
boolean shoot;
boolean lose;
float hits;
float shots;
int time;
int speed = 10;
PImage image;
void setup()
{
  size(800,600);
  asteroids = new ArrayList(20);
  noCursor();
  image = loadImage("star background.png");
}
 
void draw()
{
  background(image);
  frameRate(30);
  if(!lose)
  {
    spawn();
    move();
    attack();
    display();
    checkLoss();
    time++;
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
   
  Asteroid(int xx, int rr, float tspeed, int hh)
  {
    x = xx;
    r = rr;
    speed = tspeed;
    maxHealth = hh;
    health = maxHealth;
  }
   
  void move()
  {
    y += speed;
  }
   
  void display()
  {
    fill(255,150,200);
    ellipse(x,y,r,r);
    fill(255,0,0);
  }
}
void spawn()
{
  if(time == 30)
  {
    time = 0;
    Asteroid ta = new Asteroid(int(random(30,470)), int(random(20,40)), speed, h);
    asteroids.add(ta);   
  }
}
void move()
{
    for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid ta = (Asteroid)asteroids.get(i);
    ta.move();
  }
}
void display()
{
  for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid ta = (Asteroid)asteroids.get(i);
    ta.display();
  }
  fill(0,0,255);
  rect(mouseX-20,580,40,500);
  if(shoot)
  {
    stroke(255,0,0);
    strokeWeight(5);
    line(mouseX,0,mouseX,475);
    stroke(0);
  }
}
 
void attack()
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
        }
        hits ++;
       
      }
    }
  }
}
 
void checkLoss()
{
  for(int i = 0; i < asteroids.size(); i++)
  {
    Asteroid ta = (Asteroid) asteroids.get(i);
    if(ta.y > 600)
    {
      lose = true;
      
    }
  }
  
}
 


