
/**
  This is the driver class for the AirBalloon game.
*/
Balloon balloon;
Background background;
Turret t1, t2, t3, t4;
Projectiles projectiles;

void setup() {
  //size(800,600);
  size(600,600);
  background = new Background();
  balloon = new Balloon();
  projectiles = new Projectiles();
  
    // x, y, diameter, baseAngle, minAngle, maxAngle
  // For baseAngle:
  //   Bottom: -HALF_PI
  //   Top: HALF_PI
  //   Left: 0
  //   Right: PI
//  t1 = new Turret(width/2, height/2, 50, -HALF_PI, -PI, 0);
//  t2 = new Turret(width/2, 100, 50, HALF_PI, 0, PI);
//  t3 = new Turret(100, height/2, 50, 0, -HALF_PI, HALF_PI);
//  t4 = new Turret(width-100, height/2, 50, PI, -3*HALF_PI, -HALF_PI);
  int tsize = 50;
  t1 = new Turret(width/2, height-tsize, tsize, -HALF_PI, radians(225), radians(315));
  t2 = new Turret(width/2, tsize, tsize, HALF_PI, radians(45), radians(45));
  t3 = new Turret(tsize, height-tsize/2, tsize, 0, radians(300), radians(330));
  t4 = new Turret(width-tsize, height-tsize/2, tsize, PI, radians(210), radians(240));
  
}

void draw() {
  //background(255);
  background.display();
  balloon.update();
  balloon.display();
  
  t1.display();
  t2.display();
  t3.display();
  t4.display();
  projectiles.display();
  
}





/* @pjs preload="hot-air-balloon.png"; */


class Balloon {


  PImage balloon;
  PVector location;
  PVector velocity;
  PVector acceleration;
    PVector wind;
  float topspeed;
  public final float angle = 1.57;


  Balloon() {
    balloon = loadImage("hot-air-balloon.png");
    //location = new PVector(width/2, height/2);
    location = new PVector(width/2, height/4);
    velocity = new PVector(0, 0);
    topspeed = 6;
  }


  void update() {
    wind = PVector.fromAngle(0);
        wind.mult(random(-.00,.00));
        velocity.add(wind);
        velocity.limit(topspeed);
        location.sub(velocity);
        
    if (keyPressed && key == CODED) {
      if (keyCode == UP) {
        acceleration = PVector.fromAngle(angle);
        acceleration.mult(random(2));
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.sub(velocity);
      } 
      else if (keyCode == DOWN) {
        acceleration = PVector.fromAngle(angle);
        acceleration.mult(random(2));
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.add(velocity);
      }
    } 
  }


  void display() {
    imageMode(CENTER);
    if (location.y<0)
    location.y=0;
    if (location.y>height)
    location.y=height;
    image(balloon, location.x, location.y);
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
    
    velocity = new PVector(10 * cos(angle), 10 * sin(angle));
    
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

    if (arrayOfProjectiles.get(i).location.x > width || arrayOfProjectiles.get(i).location.y > height)
      arrayOfProjectiles.remove(i);

    else
      arrayOfProjectiles.get(i).display();

  }

  println(arrayOfProjectiles.size());
  }

}

public class Turret
{
  PVector location;
  int diameter;
  float baseAngle, minAngle, maxAngle, angle;
  float speed = .01;
  boolean collision;
  int launchInterval = 1; //in seconds

  public Turret(int x, int y, int diameter, float baseAngle, float minAngle, float maxAngle)
  {
    location = new PVector(x, y);
    this.diameter = diameter;
    this.baseAngle = baseAngle;
    this.minAngle = minAngle;
    this.maxAngle = maxAngle;
    angle = minAngle;
  }

  public void display()
  {
    //fill(100);
    colorMode(RGB, 255);
    fill(100, 100, 100, 200);
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
    if (frameCount % (launchInterval*6) == 0)
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
    // g_time = float(millis()) / 1000.0;
    g_time += 0.04;
    colorMode(RGB, 1);
    loadPixels();
    for (int y = 0; y < height; y++)
    {
      for (int x = 0; x < width; x++)
      {
        float noise = noise(g_time / 3.0, float(x) / 150.0, float(y) / 60.0);
        pixels[linearize(x, y)] = color(noise, noise, 255);
      }
    }
    updatePixels();
    
    //fill(255, 255, 255, .5);
    fill(1, 1, 1, .5);
    noStroke();
    //rect(0, 0, width, height);
    setGradient(0, 0, width, height, gradientTop, gradientBottom, Y_AXIS);
  
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



