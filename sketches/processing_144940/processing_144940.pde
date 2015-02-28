
import java.util.*;

color sky = color(63, 101, 242);

Random generator;
Player player;
Alarm enemy1Timer;

statGraph graph;

ArrayList<Bullet> bullets; 
ArrayList<Enemy1> enemies1;

int enemy1SpawnTime = 6000;  // Time between which the number of enemy1s increases

int playerHealth = 100;  // You know what this does

// Stats
float attack, speed, defense;

// The points at the edge of the window which are used to calculate stats (based on mouse distance)
float attackX = 300;
float attackY = 0;
float speedX = 0;
float speedY = 800;
float defenseX = 600;
float defenseY = 800;

Cloud[] clouds;

void setup()
{
  size(600, 750);
  frameRate(30);
  
  generator = new Random();
  player = new Player();
    
  bullets = new ArrayList<Bullet>();
  enemies1 = new ArrayList<Enemy1>();
  enemies1.add(new Enemy1());
  enemy1Timer = new Alarm(enemy1SpawnTime);  // A new enemy1 is added every 5 seconds
  
  graph = new statGraph(500, 650);
  
  generateClouds(10);
}

void draw()
{
  background(sky);
    
  dealWithClouds();
  
  dealWithBullets();
  
  dealWithEnemies();
  enemy1Timer.run();
  // If timer goes off, add a new enemy and then reset it
  if (enemy1Timer.finished)
  {
    enemies1.add(new Enemy1());
    enemy1Timer = new Alarm(enemy1SpawnTime);
  }

  if (playerHealth > 0)
  {
    player.move();
    player.shoot();
    player.display();
  }
  
  graph.run();
  graph.display();
  
  // Draw player's health
  fill(255);
  textSize(32);
  textAlign(LEFT);
  text("Health: " + playerHealth, 10, 725);
  
  // Draw Game Over
  if (playerHealth < 0)
  {
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("GAME OVER.", width/2, height/2);
  }
}



class Alarm
{
  float targetMillis;
  boolean finished;

  Alarm(float targetMillis_)
  {
    targetMillis = targetMillis_ + millis();
  }

  void run()
  {
    if (millis() >= targetMillis) finished = true;
    else finished = false;
  }
}

class Bullet
{
  PVector position;
  float w, h;
  PVector velocity;  // Speed also determines whether the bullet belongs to the player or to an enemy (Negative = player, Positive = enemy)
  
  Bullet(float x_, float y_, float xvelocity_, float yvelocity_)
  {
    position = new PVector(x_, y_);
    velocity = new PVector(xvelocity_, yvelocity_);
    w = 10;
    h = 20;
  }
  
  void move()
  {
    position.add(velocity);
  }
  
  void display()
  {
    noStroke();
    fill(255, 255, 0);  // If the bullet is the player's, color it yellow
    ellipse(position.x, position.y, w, h);
  }
  
  boolean offscreen()
  {
    boolean offscreen = false;
    if (position.y < -20 || position.y > height+20) offscreen = true;
    return offscreen;
  }
}
class Cloud
{
  color col;             // Color of cloud
  PVector position;      // Position of cloud
  float w, h;            // Size/shape of cloud
  PVector velocity;         // Speed at which cloud drifts
  
  // An array to hold the x & y locations for each ellipse
  PVector[] ellipseVectors;
  
  // The number of ellipses per cloud
  int ellipseNum = 100;
  
  // Standard Deviation of ellipse spread
  float standardDevX = random(30, 60);
  float standardDevY = random(10, 20);
  
  Cloud(float startingY)
  {
    col = color(255, 5);
    
    // X position is anywhere on-screen.
    // Starting y position is decided when object is created. This is done so that clouds can be initialized on-screen or above the screen depending on the situation. (See func_clouds)
    position = new PVector(random(width), startingY);    

    w = random(100, 150);
    h = random(25, 50);   

    // Will drift slightly to the left or right. Vertical speed is not greater than 2
    velocity = new PVector(random(-0.05, 0.05), random(1, 2));    
    
    // Fill ellipseVectors with Gaussian positions
    ellipseVectors = new PVector[ellipseNum];
    for (int i = 0; i < ellipseVectors.length; i++)
    {
      ellipseVectors[i] = new PVector(customGaussian(standardDevX, position.x), customGaussian(standardDevY, position.y));
    }
  }
  
  void move()
  {
    position.add(velocity);
  }
  
  void display()
  {
    // Display cloud
    ellipseMode(CENTER);
    noStroke();
    fill(col);
    // Draw each ellipse in the array
    for (int i = 0; i < ellipseVectors.length; i++)
    {
      ellipse(ellipseVectors[i].x + position.x, ellipseVectors[i].y + position.y, 25, 25);
    }
  }
}
class Enemy1
{
  PVector position;
  PVector velocity;
  float w, h;
  
  Enemy1()
  {
    // Begins above the screen
    position = new PVector(random(30, width-30), random(-10, -100));
    
    // For now, they only move vertically.
    velocity = new PVector(0, 5);
    
    w = 20;
    h = 20;
  }
  
  void move()
  {
    position.add(velocity);
  }
  
  void display()
  {
    // Just a red square for now
    noStroke();
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(position.x, position.y, w, h);
  }
  
  boolean collidePlayer()
  {
    float distance = dist(position.x, position.y, player.position.x, player.position.y);
    if (distance <= (w/2 + 30))
    {
      return true;
    }
    return false;
  }
  
  boolean collidePlayerBullet()
  {
    for (int i = bullets.size()-1; i >= 0; i--)
    {
      Bullet bullet = bullets.get(i);
      float distance = dist(position.x, position.y, bullet.position.x, bullet.position.y);
      if (distance <= (w/2 + bullet.w/2))
      {
        bullets.remove(i);
        return true;
      }
    }
    return false;
  }

}  // end of class
// This is the player's object
class Player
{
  PVector position;
  PVector velocity;
  
  Alarm shotTimerMain, shotTimerSecondary;  // Timer for main and secondary guns
  
  float gunSpacing;
  
    
  Player()
  {
    position = new PVector(width/2, height*0.66);
    velocity = new PVector(0, 0);
    
    shotTimerMain = new Alarm(0);
    shotTimerSecondary = new Alarm(0);
    
    gunSpacing = map(attack, 50, 75, 0, 8);
  }
  
  
  void move()
  {
    shotTimerMain.run();
    shotTimerSecondary.run();
    
    gunSpacing = map(attack, 50, 75, 0, 8);
    
    if (keyRight) player.velocity.x = (speed/16.66)*-1;
    else if (keyLeft) player.velocity.x = (speed/16.66);
    else player.velocity.x = 0;
    if (keyUp) player.velocity.y = (speed/16.66)*-1;  
    else if (keyDown) player.velocity.y =  (speed/16.66)+1;
    else player.velocity.y = 0;
    
    position.add(velocity);
    
    position.x = constrain(position.x, 30, width-30);
    position.y = constrain(position.y, 15, height-15);
  }
  
  
  void display()
  {
    // Draw shield if defense is high enough
    if (defense > 50)
    {
      stroke(200, 200, map(defense,50,100,200,255));
      fill(100, 100, 255, 10);
      ellipseMode(CENTER);
      ellipse(position.x, position.y, map(defense, 50, 100, 10, 100), map(defense, 50, 100, 10, 100));
    }
    
    // Draw guns if attack is high enough
    if (attack > 50)
    {
      float gunHeight = map(attack,0,100,0,20);
      rectMode(CENTER);
      rect(position.x+gunSpacing, position.y, 7, gunHeight);
      rect(position.x-gunSpacing, position.y, 7, gunHeight);
    }
    
    // For now, the player is represented as a simple triangle
    stroke(255);
    // Fill is based on stats
    fill(map(attack, 0, 100, 0, 255), map(speed, 0, 100, 0, 255), map(defense, 0, 100, 0, 255));
    beginShape(TRIANGLES);
    vertex(position.x, position.y-15);
    vertex((position.x+30)+map(speed,0,100,-5,5), position.y+15);
    vertex((position.x-30)-map(speed,0,100,-5,5), position.y+15);
    endShape();
  }
  
  
  void shoot()
  {
    if (keySpace)
    {
      if (shotTimerMain.finished)
      {
        if (attack < 50)
        {
          bullets.add(new Bullet(player.position.x, player.position.y, 0, -8));
        }
        else
        {
          bullets.add(new Bullet(player.position.x+gunSpacing, player.position.y, 0, -8));
          bullets.add(new Bullet(player.position.x-gunSpacing, player.position.y, 0, -8));
        }
        shotTimerMain = new Alarm(500 - attack*4);
      }
      if (attack < 75)
      {
      }
    }
  }
  
}  // end of class
class statGraph
{
  // Vector for location of the graph itself
  PVector position;

  // Vectors for location of maximum stats
  PVector defenseVector, speedVector, attackVector;

  // Thetas for maximum stat vector positions
  float defenseTheta, speedTheta, attackTheta;

  // Vector for center location and mouse location
  PVector center, mouse;

  float diameter = 150;  // Diameter of the graph

  statGraph(float x_, float y_)
  {
    position = new PVector(x_, y_);

    defenseTheta = TWO_PI*0.33;
    speedTheta = TWO_PI*0.66;
    attackTheta = TWO_PI;

    center = new PVector(x_, y_);

    defenseVector = new PVector(diameter/2 * cos(defenseTheta), diameter/2 * sin(defenseTheta));
    speedVector = new PVector(diameter/2 * cos(speedTheta), diameter/2 * sin(speedTheta));
    attackVector = new PVector(diameter/2 * cos(attackTheta), diameter/2 * sin(attackTheta));
  }

  void run()
  {
    // Make mouse PVector equal to mouse position
    mouse = new PVector(mouseX, mouseY);

    // Redefine mouse Pvector based on center
    mouse.sub(center);
    mouse.limit(75);

    // Figure out stats
    speed = dist(speedVector.x, speedVector.y, mouse.x, mouse.y);
    speed = map(speed, diameter, 0, 0, 100);

    attack = dist(attackVector.x, attackVector.y, mouse.x, mouse.y);
    attack = map(attack, diameter, 0, 0, 100);

    defense = dist(defenseVector.x, defenseVector.y, mouse.x, mouse.y);
    defense = map(defense, diameter, 0, 0, 100);

    println("Speed: " + speed);
    println("Defense: " + defense);
    println("Attack: " + attack);
  }

  void display()
  {
    pushMatrix();

    translate(position.x, position.y);

    // Draw a line from the center to the mouse
    stroke(0);
    line(0, 0, mouse.x, mouse.y);

    // Draw the outer ellipse
    noFill();
    stroke(0);
    ellipse(0, 0, diameter, diameter);

    // Draw the mouse ellipse
    noStroke();
    fill(map(attack, 0, 100, 0, 255), map(speed, 0, 100, 0, 255), map(defense, 0, 100, 0, 255));
    ellipse(mouse.x, mouse.y, 16, 16);

    // Draw ellipses representing the stats
    noStroke();
    fill(0, 0, 255);
    ellipse(defenseVector.x, defenseVector.y, 16, 16);

    fill(0, 255, 0);
    ellipse(speedVector.x, speedVector.y, 16, 16);

    fill(255, 0, 0);
    ellipse(attackVector.x, attackVector.y, 16, 16);

    popMatrix();
  }
}

void dealWithBullets()
{
  for (int i = bullets.size()-1; i >= 0; i--)
  {
    Bullet bullet = bullets.get(i);
    bullet.move();
    bullet.display();
    if (bullet.offscreen() == true) bullets.remove(i);
  }
}

// int 'num' is the number of clouds to be generated
void generateClouds(int num)
{
  // Generate array of given length
  clouds = new Cloud[num];
  
  // Fill up array with cloud objects
  for (int i = 0; i < clouds.length; i++)
  {
    clouds[i] = new Cloud(random(-150, height));
  }
}


void dealWithClouds()
{
  // Iterate through clouds array
  for (int i = 0; i < clouds.length; i++)
  {
    clouds[i].move();
    clouds[i].display();
    
    // If the cloud moves below the screen, re-initialize it above the screen
    if (clouds[i].position.y > height + 200)
    {
      clouds[i] = new Cloud(random(-150, 0));
    }
  }
}
float customGaussian(float sd, float mean)
{
  // nextGaussian() uses a mean of 0 and a standard deviation of 1
  float num = (float) generator.nextGaussian();

  // Multiply by our new standard deviation and add our new mean
  float value = num * sd + mean;

  return value;
}
void dealWithEnemies()
{ 
  for (int i = enemies1.size()-1; i >= 0; i--)
  {
    Enemy1 enemy1 = enemies1.get(i);
    enemy1.move();
    enemy1.display();
    
    // Check for collisions with bullets
    if (enemy1.collidePlayerBullet() == true)
    {
      enemies1.remove(i);
      enemies1.add(new Enemy1());
    }
    
    // Check for collisions with the player
    if (enemy1.collidePlayer() == true)
    {
      // Destroy this enemy
      enemies1.remove(i);
      // Remove health from the player
      playerHealth -= map(defense,100,0,0,10);
      enemies1.add(new Enemy1());
    }
    
    // If the Enemy1 goes off the screen, remove it and spawn a new one
    if (enemy1.position.y > height+30)
    {
      enemies1.remove(i);
      enemies1.add(new Enemy1());
    }
  }
}
void figureOutStats()
{
  // Stats are based on the mouse's distance from three points at the edge of the window (defined as global variables)
  attack = map(dist(mouseX, mouseY, attackX, attackY), 0, 875, 100, 0);
  speed = map(dist(mouseX, mouseY, speedX, speedY), 0, 1000, 100, 0);
  defense = map(dist(mouseX, mouseY, defenseX, defenseY), 0, 1000, 100, 0);
  println(attack+", "+speed+", "+defense);
}
boolean keyUp, keyDown, keyRight, keyLeft, keySpace;

void keyPressed()
{
  if (key == 'a') keyRight = true;
  if (key == 'd') keyLeft = true;
  if (key == 'w') keyUp = true;
  if (key == 's') keyDown = true;
  
  if (key == ' ') keySpace = true;
}


void keyReleased()
{ 
  if (key == 'a') keyRight = false;
  if (key == 'd') keyLeft = false;
  if (key == 'w') keyUp = false;
  if (key == 's') keyDown = false;
  
  if (key == ' ') keySpace = false;
}


