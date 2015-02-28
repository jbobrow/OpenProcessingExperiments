
class Edge
{
  PVector p0;
  PVector p1;
 
  void render()
  {
    stroke(255);
    line(p0.x, p0.y, p1.x, p1.y); 
  }
}


float lookAhead = 0.5;

class Agent
{
  PVector pos;
  PVector vel;
  PVector targ;
  float maxVelocity;
  float kp;
  
  
  public void update()
  {
    pos.add(vel);
    
    
    float minDiff = 99999;
    Edge closest = null;
    int closestIndex = -1;
    Edge next = null;
    
    for(int i = 0; i < edges.size(); i++)
    {
      Edge e = (Edge)edges.get(i);
     
    
    
      PVector aToP = new PVector(pos.x - e.p0.x, pos.y - e.p0.y);
      PVector aToB = new PVector(e.p1.x - e.p0.x, e.p1.y - e.p0.y);
      
      float atb2 = aToB.mag() * aToB.mag(); 
      float atpdotatb = aToP.dot(aToB);
      
      float t = min(max((atpdotatb / (atb2 + 0.0001)), 0), 1);

      PVector close = new PVector(pos.x - (e.p0.x + aToB.x * t), pos.y - (e.p0.y + aToB.y * t));
      float d = close.mag();

      if(d < minDiff)
      {
        minDiff = d;
        closest = e;
        closestIndex = i;
        
        if(i < edges.size() - 1)
        {
          next = (Edge)edges.get(i + 1); 
        }
        else
        {
          next = (Edge)edges.get(0);
        }
      }  
    }
    
    if(closest != null)
    {
      PVector aToP = new PVector(pos.x - closest.p0.x, pos.y - closest.p0.y);
      PVector aToB = new PVector(closest.p1.x - closest.p0.x, closest.p1.y - closest.p0.y);
      
      float atb2 = aToB.mag() * aToB.mag(); 
      float atpdotatb = aToP.dot(aToB);
      
      float t = atpdotatb / (atb2 + 0.0001) + lookAhead;
      
      if(t > 1.0 && next != null)
      {
        t =  t - 1.0;
        closest = next;
         aToB =  new PVector(closest.p1.x - closest.p0.x, closest.p1.y - closest.p0.y);
      }
      else
      {
        t = min(t, 1.0);
        
      }
      
      targ = new PVector(closest.p0.x + aToB.x * t, closest.p0.y + aToB.y * t);
    }
    
    PVector desiredVelocity = new PVector(targ.x - pos.x, targ.y - pos.y);
    desiredVelocity.normalize();
    desiredVelocity.mult(maxVelocity);
    
    PVector err = new PVector(desiredVelocity.x - vel.x, desiredVelocity.y - vel.y);
   
    PVector output = new PVector(err.x * kp, err.y * kp);
    vel.add(output); 
    
  }
  
  public void render()
  {
    ellipseMode(RADIUS);
    fill(255, 0, 0);
    
    ellipse(pos.x, pos.y, 10, 10);
    
    fill(0, 255, 0);
    ellipse(targ.x, targ.y, 5, 5); 
  }
    
}


ArrayList edges = new ArrayList();
ArrayList agents = new ArrayList();

void keyPressed()
{
  if(key == 'r' || key == 'R')
  {
    setup();
  } 
  
  if(key == 'i')
  {
    lookAhead += 0.01; 
  }
  
  if(key == 'j')
  {
    lookAhead -= 0.01; 
  }
  
  
}

void setup()
{
   edges.clear();
   agents.clear();
   size(600, 400);
   background(0);
   
   int numedges = 20;
  
   PVector last = new PVector(450, 200);

   
   float dTheta = 2 * PI / numedges + 0.01;
   float theta = 0;
   for(int i = 0; i < numedges; i++)
   {

     Edge e = new Edge();
     e.p0 = last;
     e.p1 = new PVector(max(min(cos(theta) * 150 + 300 + random(-30, 30), 600), 0), max(min(random(-30, 30) + sin(theta) * 150 + 200, 400), 0));
     last = new PVector(e.p1.x, e.p1.y);
     theta += dTheta;
     edges.add(e);

   } 
   
   int numAgents = 10;
   
   
   for(int i = 0; i < numAgents; i++)
   {
     Agent a = new Agent();
     a.pos = new PVector(random(0, 600), random(0, 400));
     a.vel = new PVector(0, 0);
     a.targ = new PVector(300, 200);
     a.kp = 0.1;
     a.maxVelocity = 5;
     agents.add(a);
   }
   

   
}

void draw()
{
  background(0);
  for(int i = 0; i < edges.size(); i++)
  {
    Edge e = (Edge)(edges.get(i));
    e.render();  
  } 
  
  for(int i = 0; i < agents.size(); i++)
  {
    Agent a = (Agent)(agents.get(i));
    a.update();
    a.render(); 
  }
  
  stroke(255, 255, 255);
  fill(255, 255, 255);
  text("R to restart", 15, 15);
  text("look ahead: " + lookAhead + " (i/j to change)", 15, 30);
  
}


