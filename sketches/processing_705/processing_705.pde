
// TODO
// 1.) fire spreads from one exploding ball to another
// 2.) put balls to collide with in ArrayList
// 3.) point system - Point class?
// 4.) favorable collisions - run into certain things to get bigger?
// 5.) music

// Two ball variables
Ball ball1;
Ball ball2;
MrDude m;

void setup() {
  size(1440,900);
  smooth();

  // Initialize balls
  ball1 = new Ball(64);
  ball2 = new Ball(32);
  m = new MrDude();
}

void draw() {
  background(255);
  // Move and display balls
  ball1.move();
  ball2.move();
  m.move();
  m.display();

  if (ball1.intersect(m))
  {
    ball1.explode();

  }
  if(ball2.intersect(m)) {
    ball2.explode();
  }
  ball1.display();
  ball2.display();
}
//MR DUDE CLASS//////////////////////////////////////////
class MrDude
extends Ball
{
  float xpos, ypos, xspeed, yspeed, radius, acc, maxSpeed;

  MrDude()
  {
    super(40);
    radius = 10;
    xpos = random( width-(radius+1) ) + radius;
    ypos = random( height-(radius+1) ) + radius;
    xspeed = random( 5 );
    yspeed = random( 5 );
    acc = .5;
    maxSpeed = 3;
  }

  void checkBoundaries()
  {
    boolean hitRight, hitLeft, hitTop, hitBottom;
    boolean pastRight, pastLeft, pastTop, pastBottom;
    float xnew, ynew;

    hitRight = xpos + radius > width;
    hitLeft = xpos - radius < 0;
    hitBottom = ypos + radius > height;
    hitTop = ypos - radius < 0;
    pastRight = xpos - radius > width;
    pastBottom = ypos - radius > height;
    pastTop = ypos + radius < 0;
    pastLeft = xpos + radius < 0;

    xnew = xpos;
    ynew = ypos;
    if( hitRight )
    {
      xnew = xpos-width;
    }
    if( hitBottom )
    {
      ynew = ypos - height;
    }
    if( hitLeft )
    {
      xnew = xpos + width;
    }
    if( hitTop )
    {
      ynew = ypos + height;
    }
    if( hitTop || hitRight || hitBottom || hitLeft )
    {
      pushMatrix();
      float xtemp = xpos;
      float ytemp = ypos;
      xpos = xnew;
      ypos = ynew;
      display();
      xpos = xtemp;
      ypos = ytemp;
      popMatrix();
    }
    if( pastRight || pastBottom || pastTop || pastLeft )
    {
      xpos = xnew;
      ypos = ynew;
    }
  }

  void handleKeypresses()
  {
    if( keyPressed )
    {
      if( key == CODED )
      {
        if( keyCode == UP )
        {
          yspeed = constrain( yspeed - acc, -maxSpeed, maxSpeed );
        }
        if( keyCode == DOWN )
        {
          yspeed = constrain( yspeed + acc, -maxSpeed, maxSpeed );
        }
        if( keyCode == RIGHT )
        {
          xspeed = constrain( xspeed +acc, -maxSpeed, maxSpeed );
        }
        if( keyCode == LEFT )
        {
          xspeed = constrain( xspeed -acc, -maxSpeed, maxSpeed );
        }
      }
    }
  }

  void move()
  {
    x = xpos;
    y = ypos;
    handleKeypresses();
    xpos += xspeed;
    ypos += yspeed;
    checkBoundaries();
    display();
  }

  void display()
  {

    ellipseMode(CENTER);
    rectMode(CENTER);
    fill( random( 255 ), random( 255 ), random( 255 ) );
    ellipse( xpos, ypos, 2*radius, 2*radius );
    fill( 0 );
    rect( xpos, ypos, radius, radius );
    println("this is the x speed"+xspeed);
    println("this is the y speed"+yspeed);
    e.display(xpos,ypos);
  }

}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-3: Bouncing ball with intersection

class Ball {

  Explosion e;
  float r; // radius
  float x,y;
  float xspeed,yspeed;
  color c = color(100,50);
  boolean displaying;
  int finish;
  int start;
  float duration;
 

  // Constructor
  Ball(float tempR) {
    r = tempR;
    duration = 8;
    start = 0;
    finish = 0;
    e = new Explosion(10,1);   
    x = random(width);
    y = random(height);
    xspeed = random( -5,5);
    yspeed = random( -5,5);
    displaying = true;
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }

    // Check vertical edges
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  }

  // Whenever the balls are touching, this explode() function is called
  // and the color is darkened.
  void explode() {
    if(displaying)
    {
    e.start();
    start = millis();
    finish = start + int(duration)*1000;
    }
  }

  // Draw the ball
  void display() {
    displaying = millis() > finish;
    if(displaying)
    {
    stroke(0);
    fill(c);
    ellipse(x,y,r*2,r*2);
    // After the ball is displayed, the color is reset back to a darker gray.
    c = color(100,50);
    }
    e.display(x, y);
  }

  // A function that returns true or false based on whether two circles intersect
  // If distance is less than the sum of radii the circles touch
  boolean intersect(Ball b) {

    // Objects can be passed into functions as arguments too!
    float distance = dist(x,y,b.x,b.y); // Calculate distance

    // Compare distance to sum of radii
    if (distance < r + b.r) {
      /*if( b instanceof MrDude )
       {
       displaying = false;
       }*/
      return true;
    }
    else {
      return false;
    }
  }
}


class Explosion
{

  float radius, duration;
  int start, finish;
  boolean isExploding;
  float percent;

  Explosion( float radius, float seconds )
  {
    this.radius = radius*2;
    duration = seconds * 1000;
  }

  void start()
  {
    if( !isExploding )
    {
      radius = 0;
      start = millis();
      finish = int(start + duration);
    }
  }

  void display( float xPos, float yPos )
  {
    isExploding = millis() < finish;
    if( isExploding )
    {
      percent = norm( millis(), start, finish );
      int r = (int)lerp( 0, radius, percent );
      pushMatrix();
      pushStyle();
      jamesSafeBufferZone( xPos, yPos );
      popStyle();
      popMatrix();
    }
  }
 
    void jamesSafeBufferZone( float xPos, float yPos )
  {
    int a = 0;


    radius += 5;
    radius = constrain(radius,0,3);
    for (int i = 30; i > 0; i--)
    {
         fill(random(255),random(255),random(255),a);
    strokeWeight(1);
    stroke(random(255),random(255),random(255),a);
      ellipse(xPos,yPos,radius*i*3,radius*i*3);
      a += 20;
    }
  }
 
}




