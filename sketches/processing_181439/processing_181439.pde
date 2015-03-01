
BalloonArray balloons = new BalloonArray();
Balloon newBalloon;
boolean mouseDown = false;
boolean inflate = false;

void setup()
{
  size(800, 600);
  background(255);
  ellipseMode(RADIUS);
  noStroke();
}

void draw()
{
  background(255);

  if (inflate)
  {
    newBalloon.inflate(2); // Regulate inflation rate here
    newBalloon.render(); // Only grow the balloon, ignore the floating
  }

  balloons.run();
}

void mousePressed() { //Starts singular instance of mousePressed
  newBalloon = new Balloon(mouseX, mouseY);
  inflate = true; // Start inflating
}

void mouseReleased() { 
  inflate = false;
  balloons.add(newBalloon);
}

void keyPressed() //Press 'c' to clear the screen
{
  if (key != CODED)
  {
    switch(key)
    {
    case 'c' : 
      balloons.removeAll(); 
      break;
    }
  }
}

class Balloon //Create balloon object
{
  float x = width/2;
  float y = height/2;
  float xv = -3+random(6);
  float yv = -random(4);
  float maxYV = 20;
  float floating = 0.1; //Float rate
  float friction = 1; 
  float radius = 0;
  color c = color(random(255), random(255), random(255),80);

  Balloon() {
  }

  Balloon(float xp, float yp)
  {
    x = xp;
    y = yp;
  }

  Balloon(float xp, float yp, float xvel, float yvel)
  {
    this(xp, yp);
    xv = xvel;
    yv = yvel;
  }

  void inflate(float i)
  {
    radius += i;
  }

    public void update()
  {
    if ((yv < maxYV))
    {
      yv -= floating*.2;
    }
    yv *= friction;
    y += yv;
    x += xv;
    
/* If you want a ceiling, uncomment this
    if (y <= 0 + radius) {
      xv = 0;
      yv = 0;
      y = 0 + radius;
    }
*/
  }

  void render()
  {
    stroke(232, 232, 232);
    noFill();
    arc(x+(radius/3), y+radius*1+((radius*1.67)/3), radius/2, radius*1.5/2, HALF_PI, PI+QUARTER_PI);
    arc(x+(radius/3)+.5,y+radius*1.1+radius*1.5+((radius*1.5)/3), radius/2, radius*1.5/2, PI+HALF_PI, TWO_PI+HALF_PI);
    noStroke();
    fill(c);
    ellipse(x, y, radius, radius*1.15);
  }
  
    void run()
  {
    update();
    render();
  }
}

class BalloonArray
{
  ArrayList Balloons = new ArrayList();

  BalloonArray() {
  }

  void add(Balloon b)
  {
    Balloons.add(b);
  }

  void removeAll()
  {
    Balloons.clear();
  }

  void run()
  {
    for (int i = 0; i < Balloons.size (); i++)
    {
      Balloon b = (Balloon)Balloons.get(i);
      b.run();
    }
  }
}
