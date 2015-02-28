

/*
 * Galaxy2050 - A space shooting game
 * Jon Raymer
 * 11/19/09
 */
PImage spaceImg, bossImg;
SpaceShip s;
ArrayList enemies;
boolean gameStarted = false;
int count = 0;
PFont f = createFont("Arial", 20, true);
PFont f1 = createFont("Arial", 15, true);
ArrayList powerups;
ArrayList waves;
int waveCount = 0;
int gameSize = 5;
Asteroid a1, a2;
String[] images = {"spaceship.gif", "enemy2.gif",
            "enemy3.gif", "enemy4.gif", "enemy5.gif"};

void setup()
{
  size(500, 550);   // Set size
  smooth();
  noCursor();   // Allows no cursor on screen
  spaceImg = loadImage("2050Background.jpg");  
  s = new SpaceShip();
  enemies = new ArrayList();  // Our object containers
  powerups = new ArrayList();
  waves = new ArrayList();
  int num = 5;  // Number of enemies per line
  a1 = new Asteroid();
  a2 = new Asteroid();
  
  for (int i = 0; i < gameSize; i++)  // Set up waves of enemies
  {
    Wave w = new Wave(num, images[i], i + 1);
    waves.add(w);
    if (i % 2 == 0)  // If even, give it a power up
    {
      w.setPowerUp(true);
    }
    num += 5;
  }
  //waves.add(new Wave(1, "boss.gif", 10));  // Potential for bosses
  
  for (int i = 0; i < gameSize*2; i++)  // Loads power ups, may cause error
  {
    powerups.add(new PowerUp(int(random(width)), 30));
  }
}


void draw()  // Main Loop
{
  background(0);
  image(spaceImg, 0, 0);  // Set the background image
  
  if (gameStarted)  // True if mouse has been clicked first time
  {
    a1.move(); a1.display();  // Asteroids
    a2.move(); a2.display();
    
    s.display();  // Display the ship
    
    textFont(f1);  // Show current game data
    fill(255);
    int cpow = s.getPowerLevel();
    int cwav = waveCount + 1;
    text("Current Power: " + str(cpow), 70, height - 30);
    text("Current Wave: " + str(cwav), 70, height - 15);
    
    Wave w = (Wave)waves.get(waveCount);
    // Power up stuff
    if (w.getPowerUp()) // If the wave has a power up, display it
    {
      PowerUp p = (PowerUp) powerups.get(waveCount);
      p.move();
      p.display();
      if (p.intersect(s))
      {
        s.setPowerLevel(s.getPowerLevel() + 1);
        powerups.remove(p);
        w.setPowerUp(false);
      }
      else if (p.getY() > height)
      {
        powerups.remove(p);
        w.setPowerUp(false);
      }   
    }

    enemies = w.getWave();
    // Deals with ship killing
    for (int i = 0; i < enemies.size(); i++)
    {
      Enemy e = (Enemy) enemies.get(i);
      e.move();
      e.display();
      
      if (e.getRandomNumber() == 0)
      {
        Bullet b = e.getGun().getBullet();
        b.setFired(true);
      }  
      for (int j = 0; j < e.getGun().getBulletArray().size(); j++)
      {
        Bullet b = (Bullet)e.getGun().getBulletArray().get(j);
        if (b.getFired())
        {
          b.move();
          b.display();
          if (s.intersect(b))
          {
            b.setFired(false);
            s.setPowerLevel(s.getPowerLevel() - 1);
          }    
        }
        if (b.getBulletY() > height)
        {
          b.setFired(false);
        }
      }
      if (e.isKilled())
      {
        enemies.remove(e);
      }
      else if (s.isKilled())
      {
        gameStarted = false;
      }
      if (enemies.size() == 0)
      {        
        waveCount++;
      }
      if (waveCount >= gameSize)  // All waves destroyed, game is won
      {
        count++;
        gameStarted = false;
      }
    }
    // Deals with enemy killing
    for (int i = 0; i < s.getGun().getBulletArray().size(); i++)
    {
      Bullet b = (Bullet)s.getGun().getBulletArray().get(i);
      if (b.getFired())
      {
        b.move();
        b.display();
        for (int j = 0; j < enemies.size(); j++)
        {
          Enemy e = (Enemy)enemies.get(j);
          if (e.intersect(b))
          {
            b.setFired(false);
            e.setPowerLevel(e.getPowerLevel() - s.getPowerLevel());
          }
        }
      }
      if (b.getBulletY() < 0)
      {
        b.setFired(false);
      }
    }
  }
  else if (count == 0)
  {
     textFont(f);
     fill(255);
     textAlign(CENTER);
     text("Click to start", width/2, height/2);
  }
  else if (count == 2)
  {
     textFont(f);
     fill(255);
     textAlign(CENTER);
     text("Congratulations, You Won!", width/2, height/2);
  }
  else
  {
     textFont(f);
     fill(255);
     textAlign(CENTER);
     text("Game Over", width/2, height/2);
  }
}

void mouseClicked()
{
  if (count == 0)
  {
    gameStarted = true;
    count++;
  }
  Bullet b = s.getGun().getBullet();
  b.setFired(true);
}


class SpaceShip
{
  PImage spaceShip;
  private Gun gun;
  private int powerLevel;
  private float x, y;
  
  public SpaceShip()
  {
    spaceShip = loadImage("spaceship.gif");
    powerLevel = 1;  // One hit to kill initially
    x = mouseX;
    y = height - 100;
    gun = new Gun(this, -7, powerLevel);
  }
  
  void display()
  {
    x = mouseX;
    image(spaceShip, x, y);
  }
  
  private Gun getGun()
  {
    return gun;
  }
  
  private int getPowerLevel()
  {
    return powerLevel;
  }
  
  boolean isKilled()
  {
    if (powerLevel <= 0)
    {
      return true;
    }
    else
    {
      return false;
    }   
  }
  
  private void setPowerLevel(int l)
  {
    powerLevel = l;
    gun.setGunPower(powerLevel);
  }
  
  private float getshipX()
  {
    return x;
  }
  
  private float getshipY()
  {
    return y;
  }
  
  boolean intersect(Bullet b)
  {
    float p1 = x;
    float p2 = x + 32;
    if ((b.getBulletY() <= y + 10) && (b.getBulletY() >= y - 5))
    {
      if ((b.getBulletX() >= p1) && (b.getBulletX() <= p2))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
 
   }
  
}


class Gun
{
  private int gunPower;
  private SpaceShip ship;
  private ArrayList ammo;
  private int index;
  private float speed;
  
  public Gun(SpaceShip ship, float speed, int power)
  {
    this.ship = ship;
    gunPower = power;
    ammo = new ArrayList();
    index = 9;
    this.speed = speed;
    loadGun();
  }
  
  void setGunPower(int g)
  {
    gunPower = g;
  }
  
  int getGunPower()
  {
    return gunPower;
  }
  
  void loadGun()
  {
    for (int i = 0; i < 10; i++)
    {
      ammo.add(new Bullet(this));
    }
  }
  
  Bullet getBullet()
  {
    if (index < 0)
    {
      index = 9;
    }
    Bullet b = (Bullet) ammo.get(index);
    
    if (ship instanceof Enemy)
    {
      Enemy e = (Enemy)ship;
      b.setBulletLocation(e.getshipX() + 16, e.getshipY());   
    }
    else
    {
      b.setBulletLocation(ship.getshipX() + 16, ship.getshipY());  
    } 
    index--;
    return b;
  }
  
  ArrayList getBulletArray()
  {
    return ammo;
  }
  
  float getSpeed()
  {
    return speed;
  }
  
  void setSpeed(float s)
  {
    speed = s;
  }
    
}


class Bullet
{
  private float x, y, speed, radius;
  private Gun gun;
  private boolean isFired;
  public Bullet(Gun gun)
  {
    this.gun = gun;
    speed = gun.getSpeed();
    radius = 5;
    isFired = false;
  }
  
  void display()
  {
    switch(gun.getGunPower())
    {
      case 1:
        fill(255, 0, 0);
        ellipse(x, y, radius, radius*2);
        break;
      case 2:
        fill(0, 0, 255);
        rect(x, y, radius, radius*4);
        break;
      case 3:
        fill(0, 255, 0);
        ellipse(x, y, radius*3, radius*3);
        break;
      default:
        fill(0, 255, 0);
        ellipse(x, y, radius*3, radius*3);
        break;
    }  
  } 
  
  void move()
  {
    y += speed;
  }
  
  void setBulletLocation(float _x, float _y)
  {
    x = _x;
    y = _y;
  }
  
  float getBulletX()
  {
    return x;
  }
  
  float getBulletY()
  {
    return y;
  }
  
  boolean getFired()
  {
    return isFired;
  }
  
  void setFired(boolean bool)
  {
     isFired = bool;
  }
  
  void setSpeed(float f)
  {
    speed = f;
  }
  
}


class Enemy extends SpaceShip
{
  private Gun gun;
  private PImage img;
  private int powerLevel;
  private float x, y, xspeed, yspeed;
  private boolean haspowerup;
  
  public Enemy(float x, float y, String imgstring)
  {
    this.x = x;
    this.y = y;
    img = loadImage(imgstring);
    powerLevel = 3;
    gun = new Gun(this, 7, 1);
    xspeed = 3;
    yspeed = 0;
    haspowerup = false;
  }
  
  void display()
  {
    image(img, x, y);
  }
  
  void move()
  {
    x += xspeed;
    y += yspeed;
    
    if ((x > width - 20) || (x < 20))
    {
      xspeed *= -1;
    }
  }
  
  boolean isKilled()
  {
    if (powerLevel <= 0)
    {
      return true;
    }
    else
    {
      return false;
    }   
  }
  
  private Gun getGun()
  {
    return gun;
  }
  
  private float getshipX()
  {
    return x;
  }
  
  private float getshipY()
  {
    return y;
  }
  
  private boolean getPowerUp()
  {
    return haspowerup;
  }
  
  private void setPowerUp(boolean bool)
  {
    haspowerup = bool;
  }
  
  int getPowerLevel()
  {
    return powerLevel;
  }
  
  void setPowerLevel(int power)
  {
    powerLevel = power;
  }
  
  boolean intersect(Bullet b)
  {
    float p1 = x;
    float p2 = x + 32;
    if ((b.getBulletY() <= y + 10) && (b.getBulletY() >= y - 5))
    {
      if ((b.getBulletX() >= p1) && (b.getBulletX() <= p2))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
 
   }
   
   int getRandomNumber()
   {
     return int(random(30));
   }
}



class PowerUp
{
  float x, y, speed, radius;
  PFont f = createFont("Arial", 12, true);
  
  public PowerUp(float x, float y)
  {
    this.x = x;
    this.y = y;
    speed = 5;
    radius = 10;
  }
  
  void display()
  {
    fill(0);
    ellipse(x, y, radius*2, radius*2);
    textFont(f);
    fill(255);
    text("P", x, y + 4); // Might need to change
  }
  
  void move()
  {
    y += speed;
  }
  
  float getY()
  {
    return y;
  }
  
  boolean intersect(SpaceShip s)  // Needs work
  {
    float p1 = x;
    float p2 = x + radius*2;
    if ((y <= s.getshipY() + 20) && (y >= s.getshipY() - 20))
    {
      if ((p1 >= s.getshipX() - 10) && (p2 <= s.getshipX() + 50))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
 
   }
}



class Wave
{
  private ArrayList enemyWave;
  private boolean haspowerup;
  
  public Wave(int numEnemies, String imgString, int strength)
  {
    enemyWave = new ArrayList();
    int x = 20; int y = 100;
    haspowerup = false;
    for (int i = 0; i < numEnemies; i++)
    {
      Enemy e = new Enemy(x, y, imgString);
      e.setPowerLevel(strength);
      enemyWave.add(e);
      if (x > width - 300)
      {
        x = 20;
        y += 50;
      }
      else
      {
        x += 50;
      }
    }
  }
  
  private ArrayList getWave()
  {
    return enemyWave;
  }
  
  private void setPowerUp(boolean bool)
  {
    haspowerup = bool;
  }
  
  private boolean getPowerUp()
  {
    return haspowerup;
  }

}


class Asteroid
{
  
  PImage asteroidImg;
  float x, y, xspeed, yspeed;
  public Asteroid()
  {
    asteroidImg = loadImage("asteroid.gif");
    xspeed = 3;
    yspeed = 3;
    x = int(random(width));
    y = int(random(height));
  }
  
  void move()
  {
    if ((x > width - 20) || (x < 20))
    {
      xspeed *= -1;
    }
    if ((y > height - 20) || (y < 20))
    {
      yspeed *= -1;
    }
    x += xspeed;
    y += yspeed;
  }
  
  void display()
  {
    image(asteroidImg, x, y);
  }
}




