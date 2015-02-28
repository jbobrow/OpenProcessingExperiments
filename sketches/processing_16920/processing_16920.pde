
import java.util.Iterator;

float x, y;
int score, lives;
ArrayList<Bullet> bullets;
ArrayList<Meteroid> meteroids;
boolean canShoot;
int screenNumber;
PFont font;
PImage bg, earth, stars;

void setup()  
{
  screenNumber = 0;
  lives = 5;
  size(600, 600);
  smooth();
  background(0);
  imageMode(CENTER);
  noStroke();
  x = 300;
  y = 300;
  bullets = new ArrayList<Bullet>();
  meteroids = new ArrayList<Meteroid>();
  canShoot = true;
  bg = loadImage("Background.gif");
  earth = loadImage("Earth2.gif");
  stars = loadImage("Stars.gif");
}

void draw() 
{
  background(0);
  if(screenNumber == 0)
  {
    teamname();
  }
  if(screenNumber == 1)
  {
    displayMenu();
  }
  if(screenNumber == 2)
  {
  image(stars,300,300);
  //println("there are " + bullets.size() + " bullets");
  //println("there are " + meteroids.size() + " meteroids");
    if(meteroids.size() < 15)
    {  
      meteroids.add(new Meteroid(random(width),-random(25,50), 0, random(3,4) ));
      meteroids.add(new Meteroid(random(width),random(height+25,height+50), 0, -random(3,4) ));
      meteroids.add(new Meteroid(-random(25,50),random(height), random(3,4), 0 ));
      meteroids.add(new Meteroid(random(width+25,width+50),random(height), -random(3,4),0 ));
    }
  showearth();
  score();
  lives();
  moveAndShowBullets();
  moveAndShowMeteroids();
  checkMeteroidsAgainstPlanet();
  checkMeteroidsAgainstBullets();
  }
  if(lives < 1)
  {
    screenNumber = 3;
  }
  if(screenNumber == 3)
  {
    displayGameover();
    score = 0;
  }
}

void teamname()
{
  fill(255);
  font = loadFont("BankGothicBT-Medium-80.vlw");
  textFont(font,70);
  text("M", 105,260);
  text("D", 275,260);
  textFont(font,40);
  text("AGIC",167,260);
  text("ONKEY",333,260);
  textFont(font,20);
  text("PRESENTS",245,290);
  
  
  if(keyCode == ' ')
  {
    screenNumber = 1;
  }
}

void displayMenu()
{
  image(bg,300,300);
  fill(255);
  font = loadFont("BankGothicBT-Medium-80.vlw");
  textFont(font,70);
  text("ARMAGEDDON", 10,50);
  textFont(font,15);
  text("IN THE YEAR 2075, EARTH WAS ATTACKED BY", 55,80);
  text("WAVES OF METEROIDS. MILLIONS OF LIVES WERE", 20,100);
  text("LOST. ALL THE MAJOR COUNTRIES UNITED UNDER", 20, 120);  
  text("ONE BANNER TO FIGHT AND DEFEND OUR PLANET", 20,140);
  text("TO ENSURE THE SURVIVAL OF HUMAN RACE.", 20, 160);
  textFont(font,20);
  text("CLICK THE MOUSE TO FIRE", 160, 550);
  textFont(font,35);
  text("PRESS 1 TO JOIN THE FIGHT", 15, 580);
  if(keyCode == '1')
  {
    screenNumber = 2;
  }
}

void displayGameover()
{
  image(bg,300,300);
  textFont(font, 100);
  text("YOU", 180,270);
  text("FAILED",100,350);
  textFont(font,30);
  text("PRESS 2 TO REJOIN THE FIGHT", 30, 580);
  if(keyCode == '2')
  {
    screenNumber = 1;
    lives = 5;
  }
}


void showearth()
{
  image(earth,300,300);
}

void score()
{
  fill(255);
  textFont(font,35);
  text(score + " POINTS", 10, 580);
}

void lives()
{
  fill(255);
  textFont(font,35);
  text(lives + " LIVES", 10, 30);
}

void checkMeteroidsAgainstPlanet()
{
  for( Iterator iterator = meteroids.iterator(); iterator.hasNext();)
  {
    Meteroid m = (Meteroid) iterator.next();
    float dx = x - m.x;
    float dy = y - m.y;
    float d = sqrt(dx*dx + dy*dy);
    fill(255);
    if(m.r/2 + 10 > d)
    {
      iterator.remove();
      lives = lives - 1;
      //Collision against Planet
      //println("collision");
      //println(x);
    }
  }
}

void checkMeteroidsAgainstBullets()
{
  for( Iterator iteratorM = meteroids.iterator(); iteratorM.hasNext();)
  {
    Meteroid m = (Meteroid) iteratorM.next();
    boolean removeM = false;
    for (Iterator iteratorB = bullets.iterator(); iteratorB.hasNext();) 
    {
      Bullet s = (Bullet) iteratorB.next();
      float dx = s.x - m.x;
      float dy = s.y - m.y;
      float d = sqrt(dx*dx + dy*dy);
      if(m.r/2 + 2.5 > d)
      {
        score = score + 100;
        iteratorB.remove();
        removeM = true;
        // collision between bullet and meteroid
      }
    }
    if (removeM) iteratorM.remove();
  }
}

void moveAndShowMeteroids()
{
  for( Iterator iterator = meteroids.iterator(); iterator.hasNext();)
  {
    Meteroid m = (Meteroid) iterator.next();
    m.show();
    if (m.y < -50 || m.y > height+50 || m.x < -50 || m.x > width+50)
    {
      iterator.remove();
    }
  }
}

void moveAndShowBullets()
{
  for (Iterator iterator = bullets.iterator(); iterator.hasNext();) 
  {
    Bullet s = (Bullet) iterator.next();
    s.show();
    if (s.y < 0 || s.y > height || s.x < 0 || s.x > width)
    {
      iterator.remove();
    }
  }
}

void mousePressed()
{
  if(canShoot)
  { 
    float dx = mouseX - x;
    float dy = mouseY - y ;
    float d = sqrt(dx*dx + dy*dy);
    float v = 11;
    float vx = dx*v/d;
    float vy = dy*v/d;
    bullets.add(new Bullet(x, y, vx, vy));
    canShoot = false;
  }
}

void mouseReleased()
{
  if(!canShoot)
  {
    canShoot = true;
  }
}


