
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Ticklish Penguin
//URL -> padova.webs.com/RandomOrbitSite.html

//This is a program that draws balls that follow the mouse pointer in a random orbit, that is, they accelerate
//and decelerate randomly.

//These hold the balls that you see on the screen.
ball a;
ball b;
ball c;
ball d;

void setup()
{
  
  size(500, 500);
  background(0);
  
  smooth();
  noStroke();
  
  a = new ball(255, 0, 0);
  b = new ball(0, 255, 0);
  c = new ball(0, 0, 255);
  d = new ball(255, 255, 0);
}

void draw()
{
  
  //Creates afterimage.
  fill(0, 0, 0, 63);
  rect(0, 0, 500, 500);
  
  a.animate();
  b.animate();
  c.animate();
  d.animate();
}

class ball
{
  
  //As you can probably guess, this holds the current x and y positions of the ball.
  float x;
  float y;
  
  //This holds the current change in x and y; analogous to velocity.
  float changex;
  float changey;
  
  //These denote the coordinates of the focus of the ball's acceleration.
  float centerx;
  float centery;
  
  //These store the color and opacity of the ball.
  int red;
  int green;
  int blue;
  
  //This is the radius of all balls.
  int RADIUS;
  
  //This is an arbitrary force that acts as a meterstick for the accelerations that the balls undergo.
  float FORCE;
  
  //This is the tipping point for the diastance of the ball from its focus point; at this distance it is guaranteed to accelerate back to center.
  float BOUND;
  
  //This is the tipping point of the changex and changey variables; any faster than this, and they begin to decelerate.
  float CHANGEBOUND;
  
  //The constructor method.
  ball(int newRed, int newGreen, int newBlue)
  {
    x = 249;
    y = 249;
    
    changex = 0;
    changey = 0;
    
    centerx = 249;
    centery = 249;
    
    red = newRed;
    green = newGreen;
    blue = newBlue;
    
    RADIUS = 20;
    
    FORCE = .5;
    
    BOUND = 100;
    CHANGEBOUND = 7.5;
  }
  
  //This puts together all of the methods the ball calls when in draw().
  void animate()
  {
    show();
    move();
    recenter();
    accel();
    speedCap();
  }
  
  //This draws the ball on the screen, and makes it 'fade out' towards the edges.
  void show()
  {
    for(int i = 1; i <= RADIUS; i++)
    {
      fill(red, green, blue, 31);
      ellipse(x, y, i, i);
    }
  }
  
  //This changes the x and y coordinates of the ball based on its changex and changey values.
  void move()
  {
    x += changex;
    
    y += changey;
  }
  
  //This sets the center of the acceleration for this frame, and forces the balls to gravitate towards the center of the screen when not clicked.
  void recenter()
  {
    if (mousePressed == false)
      centerx += (249-centerx)/75;
    else
      centerx += (mouseX-centerx)/10;
    if (mousePressed == false)
      centery += (249-centery)/75;
    else
      centery += (mouseY-centery)/10;
  }
  
  //This causes the ball to conform to a sort of force field centered on the mouse pointer. The force is proportional to their distance in terms of BOUND.
  void accel()
  {
    changex += random(-(x-centerx)/BOUND-1, 1-(x-centerx)/BOUND)*FORCE;
    
    changey += random(-(y-centery)/BOUND-1, 1-(y-centery)/BOUND)*FORCE;
  }
  
  //This checks that the changex and changey values haven't exceeded CHANGEBOUND, and slow them down if they have.
  void speedCap()
  {
    if (changex > CHANGEBOUND)
      changex -= FORCE;
    if (changex < -CHANGEBOUND)
      changex += FORCE;
    
    if (changey > CHANGEBOUND)
      changey -= FORCE;
    if (changey < -CHANGEBOUND)
      changey += FORCE;
  }
}
