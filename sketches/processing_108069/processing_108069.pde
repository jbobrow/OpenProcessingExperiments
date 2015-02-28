
//Copy Rigth_Hao-Yun Mei_Carnegie Mellon University
//Processing project Elastic Collision Particle
//Class Objer, ArrayList
//Project 2 for Computing for the ARts with Processing, Jim Roberts


Flock flock;

void setup()
{
  size(600, 400);
  flock = new Flock();
  for (int i =0; i<50; i++)
  {
    flock.addAgent(new Agent(0, 0));
  }
}

void draw()
{
  // background (255);
  fill (0);
  rect(0, 0, width, height);
  flock.run();
  //flock.person();
}
// The People class
class Agent
{
  float x, y, edge, dx, dy;
  PVector location;

  Agent(float ax, float ay)
  {
    x = random(50, 200);
    y = random(50, 200);
    edge = 3;
    dx = random(-1,1);
    dy = random(-1,1);
  }
  void run(ArrayList<Agent> agents)
  {
    x += dx;
    y += dy;
    moveAgent(agents);
    // rect(x,y,edge,edge);
    wrap();
    person(agents);
  }

  void person(ArrayList<Agent> agents)
  {
    pushStyle();
    fill(255);
    smooth();
    stroke(255);
    strokeWeight(5);
    point(x,y);
    popStyle();
  }

  void wrap()
  {
    if (x > width|| x < 0)
    {
      dx = - dx;
    }
    if (y > height || y< 0)
    {
      dy= -dy;
    }
  }

  void moveAgent(ArrayList<Agent> agents)
  {
    for (Agent other : agents)
    {
      float yOffset = 0;
      float distAgent = dist(x, y, other.x, other.y);
      if (distAgent < 1)
      {
      }
     else if (distAgent < 10)
      {
        dx =( x-other.x)*.2;
        dy = (y-other.y)*.2;
      }
      
    }
  }
}


// The Flock (a list of Agent objects)
class Flock
{
  ArrayList<Agent> agents;

  Flock()
  {
    agents = new ArrayList<Agent>();
  }
  void run()
  {
    for (Agent a : agents)
    {
      a.run(agents);
    }
  }
  void addAgent(Agent a)
  {
    agents.add(a);
  }
}


