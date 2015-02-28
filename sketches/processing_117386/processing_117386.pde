
import java.util.Random;

Balloon balloon;
Background background;
Turret t1, t2, t3, t4;
Projectiles projectiles;
Random projectRan = new Random();

// how many times a projectile has hit air balloon
int countDeath = 0;
int maxScore = 0;

void setup() {
  //size(800,600);
  size(600,600);
  background = new Background();
  balloon = new Balloon();
  projectiles = new Projectiles();
  
  //Gaussian distribution
  float projectileRandom = (float) projectRan.nextGaussian();
  float randomMean = 1;
  float randomSD = .1;
  projectileRandom = (projectileRandom * randomSD) + randomMean;
  
  int tsize = 50;

    t1 = new Turret(width/2, height-tsize, tsize, -HALF_PI, radians(225), radians(315), projectileRandom);
    t2 = new Turret(width/2, tsize, tsize, HALF_PI, radians(45), radians(135), .5);
    t3 = new Turret(tsize, height-tsize/2, tsize, 0, radians(300), radians(300), random(.9, 1.1));
    t4 = new Turret(width-tsize, height-tsize/2, tsize, PI, radians(210), radians(240), 1);

}

void draw() {
  // display background
  background.display();
  // display four turrets
  t1.display();
  t2.display();
  t3.display();
  t4.display();
  // display score and number of deaths
  textSize(12);
  fill(0);
  text("You have died " + countDeath + " times.", width-150, 20);
  text("SCORE:  " + projectiles.scoreCount, 10, 20);
  // if balloon is hit logic
  if (balloon.ifBalloonIsHit == false) {
    //background(255);
    balloon.update();
    balloon.display();
  
    for (int i = 0; i < projectiles.arrayOfProjectiles.size(); i++)
    {
      if (balloon.overCircle(projectiles.arrayOfProjectiles.get(i).location.x, projectiles.arrayOfProjectiles.get(i).location.y) == true) {
        balloon.ifHitBalloon(true);
        countDeath++; 
        maxScore = maxScore + projectiles.scoreCount;
      }
    }
    
    projectiles.display();
  }
  // if balloon is hit
  else {
    textAlign(CENTER);
    textSize(40);
    text("You were hit." +
         "\n Press Space to try again." + 
         "\n Your SCORE:  " + projectiles.scoreCount + 
         "\n Your combined score:  " + maxScore,
         height/2, 
         width/2);
    textSize(12);
    textAlign(LEFT);
    // stops game, gives score and option to keep playing
    if (keyPressed) {
      if (key == ' ') {
      balloon.ifBalloonIsHit = false;
      projectiles = new Projectiles();
      frameCount = 0;
      balloon.location.y = height/2;
      balloon.location.x = width/2;
      projectiles.scoreCount = 0;
      }
    }
  }

}
  





/* @pjs preload="hot-air-balloon.png"; */

class Balloon {

  PImage balloon;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  public final float angle = PI/2;
  
  boolean ifBalloonIsHit;

  Balloon() {
    balloon = loadImage("hot-air-balloon.png");
    //location = new PVector(width/2, height/2);
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    topspeed = 10;
  }

  void update() {
    if (location.y <= height && location.y >= 0 && location.x <= width && location.x >= 0) {
    if (keyPressed && key == CODED) {
      if (keyCode == UP) {
        // up arrow goes up, slower than going down due to gravity
        acceleration = PVector.fromAngle(angle);
        float count = 3;
        count -= 1;
        acceleration.div(count);
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.sub(velocity);
      } 
      else if (keyCode == DOWN) {
        // down arrow goes down, faster than going up due to gravity
        acceleration = PVector.fromAngle(angle);
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.add(velocity);
      }
      else if (keyCode == LEFT) {
        acceleration = PVector.fromAngle(angle);
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.y = location.y - 1;
        location.x = location.x - 3;
      }
      else if (keyCode == RIGHT) {
        acceleration = PVector.fromAngle(angle);
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.y = location.y - 1;
        location.x = location.x + 3;
      }
    }
    
   else {
      // always falling due to gravity
      velocity.limit(0);
      velocity.x = 0;
      velocity.y = velocity.y - .5;
      location.sub(velocity);
   } 
  }
  // stop balloon from falling off screen
  else if (location.y > height) {
    location.y = location.y - 5;
  }
  // stop balloon from going off top of screen
  else if (location.y < 0) {
    location.y = location.y + 5;
  }
  else if (location.x < 0) {
    location.x = location.x + 5;
  }
  else if (location.x > 0) {
    location.x = location.x - 5;
  }
  
  }

  void display() {
    imageMode(CENTER);
    image(balloon, location.x, location.y);
    fill(0, 0, 0, 0);
    ellipse(location.x, location.y-20, 100, 100);
    noFill();
  }
  
  void ifHitBalloon(boolean ifHit) {
    if (ifHit == true) {
      ifBalloonIsHit = true;    
    }
    else {
      ifBalloonIsHit = false;
    }
  }
   
  boolean overCircle(float x, float y) {
    float disX = location.x - x;
    float disY = location.y - y;
    if (sqrt(sq(disX) + sq(disY)) < 100/2) {
      return true;
    } 
    else {
      return false;
    }
  }

  void keyPressed() {
  }
}

class Projectile
{    
  PVector location;
  PVector velocity;
  float angle;
  float dia = 5;

  Projectile(PVector _location, float _angle)
  {
    location = _location;
    angle = _angle;
    
    velocity = new PVector(3 * cos(angle), 3 * sin(angle));
    
  }
  
  void display()
  {
    stroke(0); 
    strokeWeight(2);
    fill(127);
    ellipse(location.x, location.y, dia, dia);
  }
  
   void update()
  {
    location.add(velocity);
  }
  
}

class Projectiles {
  
  //PVector location;
  //float angle;

  ArrayList<Projectile> arrayOfProjectiles; 

  //size(400, 400);
  //angle = PI;
  
  int scoreCount = 0;
  
  Projectiles() {
    arrayOfProjectiles  = new ArrayList<Projectile>();
  }
  
  void add(Projectile _p) {
    arrayOfProjectiles.add(_p);
  }
  
  void remove(Projectile p) {
    //arrayOfProjectiles();
  }

  void display() { 
  //background(255);

//  if (frameCount % 60 == 0)
//  {
//     location = new PVector(width/2, height/2);
//     arrayOfProjectiles.add(new Projectile(location, angle));
//  }
  for (int i = 0; i < arrayOfProjectiles.size(); i++)
  {
    arrayOfProjectiles.get(i).update();

    if (arrayOfProjectiles.get(i).location.x > width || arrayOfProjectiles.get(i).location.y > height) {
      arrayOfProjectiles.remove(i);
      scoreCount++;
    }
    else
      arrayOfProjectiles.get(i).display();
  }

  //println(arrayOfProjectiles.size());
  }


}

public class Turret
{
  PVector location;
  int diameter;
  float baseAngle, minAngle, maxAngle, angle;
  float speed = .005;
  boolean collision;
  float launchInterval = 1; //in seconds

  public Turret(int x, int y, int diameter, float baseAngle, float minAngle, float maxAngle, float launchWait)
  {
    location = new PVector(x, y);
    this.diameter = diameter;
    this.baseAngle = baseAngle;
    this.minAngle = minAngle;
    this.maxAngle = maxAngle;
    angle = minAngle;
    launchInterval = launchWait;
  }

  public void display()
  {
    //fill(100);
    colorMode(RGB, 255);
    fill(100, 100, 100, 400);
    noStroke();
    
    // barrel
    pushMatrix();
    translate(location.x, location.y);
    rotate(updateAngle());
    rectMode(CORNER);
    rect(0, -5, 50, 10);
    popMatrix();

    ellipseMode(CENTER);
    ellipse(location.x, location.y, diameter, diameter);
    
    // base
    pushMatrix();
    translate(location.x, location.y);
    rotate(baseAngle);
    rectMode(CENTER);
    rect(0-diameter/2, 0, diameter, diameter);
    popMatrix();
  }

  private float updateAngle()
  {
    if ( angle <= minAngle )
      collision = false;
    else if ( angle >= maxAngle )
      collision = true;
      
    //if ( collision == true )
    if (collision) // cleaner than previous line
      angle-=speed;
    else if ( collision == false )
      angle+=speed;
      
    updateLauncher();
    return angle;
  }
  
  private void updateLauncher() {
    if (frameCount % (int(launchInterval*60)) == 0)
    {
     PVector loc = getEndOfBarrelLoc();
     float a = angle;
     projectiles.add(new Projectile(loc, a));
    } 
  }
  
  public float getAngle()
  {
    return angle;
  }
  
  public PVector getLocation()
  {
    return location;
  }
  
  public PVector getEndOfBarrelLoc() {
    return new PVector(location.x+50*cos(angle), location.y+50*sin(angle));
  }
}

// Visualization of animated two-dimensional perlin noise
// written by Jakob Thomsen
 
// (see http://en.wikipedia.org/wiki/Perlin_noise)
// another good link: http://paulbourke.net/texture_colour/perlin/

class Background { 
  
  PImage img = createImage(width,height,RGB);  // Make a PImage object
  
  
  int linearize(int x, int y)
  {
    x = constrain(x, 0, width - 1);
    y = constrain(y, 0, height - 1);
   
    return x + y * width;
  }
   
  float g_time;
  color gradientTop;
  color gradientBottom;
  int Y_AXIS = 2;
   
  Background()
  {
    ////colorMode(RGB, 1);
    g_time = 0.0;
    gradientTop = color(255, 0);
    gradientBottom = color(0, 0, 10, .4);
  }
   
  void display()
  {
   
    if (frameCount <= 1 || frameCount % 20 == 0)
    {
    // g_time = float(millis()) / 1000.0;
    g_time += 0.08;
    colorMode(RGB, 1);
    img.loadPixels();
    for (int y = 0; y < height; y++)
    {
      for (int x = 0; x < width; x++)
      {
        float noise = noise(g_time / 3.0, float(x) / 150.0, float(y) / 60.0);
        img.pixels[linearize(x, y)] = color(noise, noise, 255);
      }
    }
    img.updatePixels();
    }
    //fill(255, 255, 255, .5);
    imageMode(CORNER);
    image(img, 0, 0);
    //fill(1, 1, 1, .5);
    //noStroke();
    //rect(0, 0, width, height);
    //setGradient(0, 0, width, height, gradientTop, gradientBottom, Y_AXIS);
    colorMode(RGB, 255);
  }
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  
    noFill();
  
    if (axis == Y_AXIS) {  // Top to bottom gradient
      for (int i = y; i <= y+h; i++) {
        float inter = map(i, y, y+h, 0, 1);
        color c = lerpColor(c1, c2, inter);
        stroke(c);
        line(x, i, x+w, i);
      }
    }  
  }
}


