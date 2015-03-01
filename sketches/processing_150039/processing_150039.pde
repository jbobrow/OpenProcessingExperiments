
//Adjust so that it runs at a diff. frame rate. Maybe 60?

float time; // Use millis()
float startTime = 3000;
float densityAir = 1.2922;
float g = 9.81;
float dragCoeff = 1.25;
//find more specific

ArrayList<Rocket> starFleet;

void setup()
{
  size(600,600);
  background(255);
  rectMode(CENTER);
  
}

void draw()
{
  Rocket mFalcon = new Rocket(1,1);
  mFalcon.display();
  if (millis() >= startTime)
  {
    mFalcon.move();
  }
}

class Rocket
{
  float mass;
  float surfArea;
  float veloInt = 0;
  float deltaYPos;
  float accel;
  float impulse;
  float THRUST;
  float thrustTime = 1;
  float ypos = (height - 10);
  float drag;
  
  Rocket(float m, float sa)
  {
    mass = m;
    surfArea = sa;
  }
 
  void display()
  {
    fill(255,0,255);
    rect( (width/2), ypos, 4, 20);
  }
  
  void move()
  {
    time = (millis() - startTime)/1000;
    if (time >= thrustTime)
    {
      THRUST = 0;
    }
    drag = .5*(densityAir)*(veloInt)*(dragCoeff)*(surfArea);
    accel = ((THRUST - ((mass * g) + drag)) / mass);
    deltaYPos = (veloInt * time) + (.5 * accel * (time * time));
    ypos =ypos - deltaYPos; 
    display();
    veloInt  = veloInt + (accel * time);
    System.out.println(veloInt);
  }
}
