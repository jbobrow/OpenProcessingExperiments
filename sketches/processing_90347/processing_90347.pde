
ArrayList<Agent> agents;

void setup()
{
  size(500, 500);
  agents = new ArrayList<Agent>();
  for (int i = 0; i<50 ; i++)
  {
    agents.add(new Agent());
  }
}

void draw()
{
  background(0);
  for (Agent a: agents)
  {
    a.acc();
  }
  
  for (int i=0; i<agents.size(); i++)
  {

    Agent a = agents.get(i);
    a.move();
    a.display();
    //a.avoid(agents); if they avoid
    
    if(a.finished) 
  {
    agents.remove(i);
    agents.add(i, new Agent());
  }
  }
  
  
  noFill();
  stroke(0,255,255);
  ellipse(mouseX, mouseY,50,50);
}

void keyPressed()
{
 if (key=='r')setup(); 
}
class Agent
{
  
  PVector pos, vel;
  boolean finished = false;
  
  Agent()
  {
    //pos = new PVector(width/2, height/2);
    pos = new PVector(random(width), random(height));
    
    float angle = random(TWO_PI);
    vel = new PVector(sin(angle),cos(angle));
  }
  
  void display()
  {
    stroke(255);
    fill(167,255,0);
    ellipse(pos.x, pos.y,20,20);
    line(pos.x+10, pos.y+10, pos.x+30*vel.x, pos.y+30*vel.y);
    line(pos.x-10, pos.y-10, pos.x+30*vel.x, pos.y+30*vel.y);
  }

  void move()
 {
   pos.add(vel);
   if(dist(pos.x,pos.y,mouseX,mouseY)<50)
   {
     finished = true;
   }
 }
 
 void acc()
 {
   PVector toMouse = new PVector(mouseX - pos.x, mouseY - pos.y);
   toMouse.normalize();
   
   PVector mdiff = PVector.sub(toMouse, vel);
   mdiff.normalize();
   mdiff.mult(0.03);
   
   vel = PVector.add(vel, mdiff);
   vel.normalize();
 }
 
 void avoid(ArrayList<Agent>alist)
 {
   for (Agent a: alist)
   {
    if((a!=this)&&(PVector.dist(a.pos,pos)<100)) //proximity adjust here
    {
      PVector goAway = PVector.sub(pos, a.pos);
      goAway.normalize();
      //goAway.mult(10/PVector.dist(a.pos,pos));
      goAway.mult(0.3);
      
      vel.add(goAway);
    }
   }
 }
}


