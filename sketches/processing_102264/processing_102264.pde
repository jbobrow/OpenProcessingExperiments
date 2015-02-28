
Cannon cannon;
ArrayList<CannonBall> cannonBalls;
ArrayList<Firework> fireworks;
ArrayList<Explosion> explosions;

int lastFirework;
int maxFireworks;
int fireworkRadius;
int explosionTimeToLive;
int cannonFireRate;

Maxim maxim;
AudioPlayer player_shoot;
AudioPlayer player_firework1;

PImage img;

void setup()
{
  size(400, 300);
  frameRate(30);
  
  maxim = new Maxim(this);
  player_shoot = maxim.loadFile("laser1.wav");
  player_shoot.setLooping(false);
  
  player_firework1 = maxim.loadFile("fireworks1.wav");
  player_firework1.setLooping(false);
  
  img = loadImage("nightsky.jpg");
  img.resize(width, height);
  
  cannon = new Cannon();
  cannonBalls = new ArrayList();
  fireworks = new ArrayList();
  explosions = new ArrayList();
  
  lastFirework = millis();
  maxFireworks = 9;
  explosionTimeToLive = 4000;
  cannonFireRate = 350; // in milliseconds
  fireworkRadius = width/20;
}

void draw()
{
  
  noCursor();
  
  background(155);
  
  image(img, 0, 0);
  
  cannon.draw();
  
  drawFireworks();
  
  // draw cannon balls
  for( int i = 0; i < cannonBalls.size(); i++ )  
  {
    // println("Drawing cannon balls. Ball # " + i );
    CannonBall ball = cannonBalls.get(i);
    ball.draw();
    ball.updateVector();

    // problem???
    if (ball.isDone())
    {
      // println("cannon ball removed");
      cannonBalls.remove(i);
    }           
  }
  
  PVector bLocation;
  PVector fLocation;
  int j = 0;
  // check for collisions
  for ( int i = 0; i < cannonBalls.size(); i++ )
  {
    CannonBall ball = cannonBalls.get(i);
    bLocation = ball.getLocation();
    
    for ( j = 0; j < fireworks.size(); j++ )
    {
      Firework f = fireworks.get(j);
      fLocation = f.getLocation();
 
      if (  bLocation.x > (fLocation.x-fireworkRadius) &&
            bLocation.x < (fLocation.x+fireworkRadius) )
        {
          if (  bLocation.y > (fLocation.y-fireworkRadius) &&
                bLocation.y < (fLocation.y+fireworkRadius) )
          {
            // hit!
            player_firework1.cue(0);
            player_firework1.play();

            explosions.add(new Explosion(f.getLocation()));            
            
            cannon.reloadFire();
            
            fireworks.remove(j);
            cannonBalls.remove(i);
          }                    
        }
                
    }  
  }
  
  drawExplosions();
}

void drawFireworks()
{
  int timeElapsed = millis() - lastFirework;
  
  // println("drawFirewoks:timeElapsed = " + timeElapsed);
  // println("fireworks.size() = " + fireworks.size());
  
  if (timeElapsed > 1500 && fireworks.size() < maxFireworks)
  {  
    // add firework
    // println("adding firework");
    fireworks.add(new Firework());
    lastFirework = millis();   
  }  
  
  for (int i = 0; i < fireworks.size(); i++)
  {
    Firework f = fireworks.get(i);

    if (f.isDone())
    {
      // println("removing firework");
      // println("x = " + f.locationX() + ";  y = " + f.locationY());
      fireworks.remove(i);
    }
    
    f.draw();
    f.updateVector();
    
  }
}

void mouseClicked()
{
  if (cannon.fire())
  {
    cannonBalls.add(new CannonBall());
    player_shoot.play();
  }
}

void drawExplosions()
{
  
    float r;
    float g;
    float b;
    
    float _x;
    float _y;    
    
    int numShards = 6;
    int currentTime;
    
    ellipseMode(CENTER);
    // strokeWeight(2);
    // stroke(255);
    noStroke();    
    
    for( int i = 0; i < explosions.size(); i++ )
    {
      Explosion e = explosions.get(i);
      PVector loc = e.getLocation();
      
      r = random(0, 255);
      g = random(0, 255);
      b = random(0, 255);

      fill(r, g, b);
        
      _x = loc.x + random(-(fireworkRadius*1.5), fireworkRadius*1.5);
      _y = loc.y + random(-(fireworkRadius*1.5), fireworkRadius*1.5);
      
      if ( _x > 0 && _x < width )
      {
       if ( _y > 0 && _y < height )
         ellipse(_x, _y, fireworkRadius/2, fireworkRadius/2);
      }
        
      
      currentTime = millis();

      // println("currentTime = " + currentTime);
      // println("e.getTimeAlive = " + e.getTimeAlive());

      if ( (currentTime - e.getTimeAlive()) > explosionTimeToLive )
      {
        explosions.remove(i);
      }
      
    }
       
}



import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
public class Cannon
{   
  private int m_size;
  private int m_timeLastFired;
  
  public Cannon()
  {
    m_size = height/20;
    m_timeLastFired = millis();
  }
  
  public int getSize()
  {
    return m_size;
  }
  
  public void draw()
  {
    // int size = height/20; 
    
    fill(255, 255, 255);
    triangle(
      mouseX - m_size, height,
      mouseX, height - m_size,
      mouseX + m_size, height
      );
  }
  
  // Cannon fire's a rocket
  public boolean fire()
  {
    // println("Cannon.fire() called");
    boolean canFire = true;
    int currentTime = millis();
    int timeElapsed = abs(m_timeLastFired - currentTime);
    // println("currentTime = " + currentTime  );
    // println("m_timeLastFired = " + m_timeLastFired );
    // println("timeElapse = " + timeElapsed );
    
    if ( timeElapsed > cannonFireRate )
    {
      // enough time has passed, cannon can fire
      m_timeLastFired = millis();
      canFire = true;
    }
    else
    {
      // cannon does not fire
      canFire = false;
    }
    
    return canFire;
  }
  
  void reloadFire()
  {
    m_timeLastFired = m_timeLastFired - cannonFireRate;   
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

public class CannonBall
{
  int _Rad;  
  boolean isFinished;
  
  PVector location;
  PVector velocity;
  
  public CannonBall()
  {
    location = new PVector(mouseX, height - 5);
    velocity = new PVector(0,10);
    _Rad = width/60;
    isFinished = false;
  }
  
  public void draw()
  {
    fill(255, 255, 255);
    ellipseMode(CENTER);
    ellipse(location.x, location.y - 50, _Rad, _Rad);   
  }
  
  public void updateVector()
  {    
    location.x = location.x + velocity.x;
    location.y = location.y - velocity.y;     
  }
  
  // returns true if cannon ball is out of screen
  public boolean isDone()
  {
    if (location.y > height || location.y < 0)
    {
      isFinished = true; 
      return true;
    }
     
    if (location.x > width || location.x < 0)
    {
      isFinished = true;
      return true;
    }
      
    return isFinished;
  }
  
  public PVector getLocation()
  {
    return location;
  }
}

/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

public class Firework
{
  boolean isFinished;
  boolean Peaked;
  PVector location;
  PVector velocity;  
  float startX;
  float startY;
  
  public Firework()
  {
    float _x;
    float _y;    
    // makes assumptions about minimum width & height
    
    _x = random(10+fireworkRadius, width-10-fireworkRadius);
    _y = random(height/2, height*3/4-100-fireworkRadius);
    
    location = new PVector(_x, _y);
    
    startX = location.x;
    startY = location.y;
    
    _x = random(1, 2);
    _y = random(1, 2);
    velocity = new PVector(_x, _y);
    
    Peaked = false;
    isFinished = false;    
  }
  
  public void draw()
  {
    fill(255,255,0);
    ellipseMode(CENTER);
    ellipse(location.x, location.y, fireworkRadius, fireworkRadius);
  }
  
  public void updateVector()
  {
//    println("startX = " + startX + "; startY = " + startY );
//    println("location.x = " + location.x + "; location.y = " + location.y);
//    println("velocity.x = " + velocity.x + "; velocity.y = " + velocity.y);
    
    if (startX < width/2)
    {
       
       if (Peaked)
       {         
         location.x = location.x + velocity.x +log(velocity.x);
         location.y = location.y - velocity.y;
       }
       else
       {
         location.x = location.x + velocity.x +log(velocity.x);
         location.y = location.y - velocity.y;
       }
    }
    else
    {
      if (Peaked)
      {
        location.x = location.x - velocity.x - log(velocity.x);
        location.y = location.y + velocity.y;
      }
      else
      {
        location.x = location.x - velocity.x - log(velocity.x);
        location.y = location.y - velocity.y;
      }
    }    
        
    // check to see if firework has reached peak
    if (location.y < 20)
      Peaked = true;
  }
 
  public boolean isDone()
  {
    if (location.y < 0 || location.y > height)
    {
      isFinished = true; 
    }
      
    if (location.x < 0 || location.x > width)
    {
      isFinished = true;
    }
      
    if (location.y > (height-fireworkRadius-10))
    {
      isFinished = true;
    }
      
    return isFinished;
  }
  
  public PVector getLocation()
  {
    return location;
  }
}  
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

public class Explosion
{
  PVector location;
  int timeAlive;
  
  public Explosion(PVector loc)
  {
    timeAlive = millis();
    location = loc;
  } 
  
  public int getTimeAlive()
  {
    return timeAlive;
  }
 
  public PVector getLocation()
 {
   return location;
 } 
   
}


