
ArrayList<Agent> agents;
ArrayList<Building> buildings;
ArrayList<Lake> lake;
ArrayList<Road> road;

void setup()
{
  size(600, 600);
  agents = new ArrayList<Agent>();
  for (int i = 0; i<50 ; i++)
  {
    agents.add(new Agent());
  }
  buildings = new ArrayList<Building>();
  for (int i = 0; i<9 ; i++)
  {
    buildings.add(new Building());
  }
  lake = new ArrayList<Lake>();
  for (int i = 0; i<1 ; i++)
  {
    lake.add(new Lake());
  }
  road = new ArrayList<Road>();
  for (int i = 0; i<1 ; i++)
  {
    road.add(new Road());
  }
  
}

void draw()
{
  background(255);
  
  for (int i=0; i<road.size(); i++)
  {

    Road r = road.get(i);
    r.display();
  }
  for (int i=0; i<buildings.size(); i++)
  {

    Building b = buildings.get(i);
    b.display();
  }
  
  for (Agent a: agents)
  {
    a.acc();
  }
  for (int i=0; i<lake.size(); i++)
  {

    Lake l = lake.get(i);
    l.display();
  }
  for (int i=0; i<agents.size(); i++)
  {

    Agent a = agents.get(i);
    a.move();
    a.display();
    a.avoid(agents,buildings,lake); 

    if (a.finished) 
    {
      agents.remove(i);
      agents.add(i, new Agent());
    }
  }
  
  
  noFill();
  stroke(0, 255, 255);
  ellipse(mouseX, mouseY, 30, 30);
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
    vel = new PVector(sin(angle), cos(angle));
  }

  void display()
  {
    stroke(255, 0, 0);
    noFill();
    ellipse(pos.x, pos.y, 10, 10);
    stroke(255, 0, 0);
    strokeWeight(2);
    line(pos.x, pos.y, pos.x+10*vel.x, pos.y+10*vel.y);
    //stroke(150,0,0);
    //line(pos.x, pos.y, pos.x-10*vel.x, pos.y+10*vel.y);
    //line(pos.x, pos.y, pos.x+10*vel.x, pos.y-10*vel.y);
    //line(pos.x, pos.y, pos.x-10*vel.x, pos.y-10*vel.y);
  }

  void move()
  {
    pos.add(vel);
    if (dist(pos.x, pos.y, mouseX, mouseY)<30)
    {
      finished = true;
      //pos.sub(vel);
    }
  }


  void acc()
  {
    if ((abs(pos.x-width/2)<5 )&&(abs(pos.y-mouseY)>5)) 
    {
      vel = new PVector(0,int(mouseY-pos.y));
      vel.normalize();
    }
    if ((abs(pos.y-height/2)<5 )&&(abs(pos.x-mouseX)>5)) 
    {
      vel = new PVector(int(mouseX-pos.x),0);
      vel.normalize();
    }
    else {
    PVector toMouse = new PVector(mouseX - pos.x, mouseY - pos.y);
    toMouse.normalize();

    PVector mdiff = PVector.sub(toMouse, vel);
    mdiff.normalize();
    mdiff.mult(0.03);

    vel = PVector.add(vel, mdiff);
    vel.normalize();
    }
  }

  void avoid(ArrayList<Agent>alist, ArrayList<Building>blist, ArrayList<Lake>llist)
  {
    for (Agent a: alist)
    {
      if ((a!=this)&&(PVector.dist(a.pos, pos)<10)) //proximity adjust here
      {
        PVector goAway = PVector.sub(pos, a.pos);
        goAway.normalize();
        goAway.mult(10/PVector.dist(a.pos, pos));
        //goAway.mult(0.3);

        vel.add(goAway);
      }
    }
    for (Building b: blist)
    {
      if ((PVector.dist(b.pos, pos)<30)) //proximity adjust here
      {
        PVector goAway = PVector.sub(pos, b.pos);
        goAway.normalize();
        //goAway.mult(10/PVector.dist(b.pos,pos));
        goAway.mult(0.7);

        vel.add(goAway);
      }
    }
    for (Lake l: llist)
    {
      if ((PVector.dist(l.pos, pos)<110)) //proximity adjust here
      {
        PVector goAway = PVector.sub(pos, l.pos);
        goAway.normalize();
        //goAway.mult(10/PVector.dist(b.pos,pos));
        goAway.mult(1);

        vel.add(goAway);
      }
    }
  }
}

class Building
{
  PVector pos;
  boolean stuck = true;

  Building()
  {
    pos = new PVector(random((width/2)+30, width), random((height/2)+30, height));
  }

  void display()
  {
    stroke(0);
    fill(255);
    ellipse(pos.x, pos.y, 50, 50);
  }
}

class Lake
{
  PVector pos;
  boolean drown = true;

  Lake()
  {
    pos = new PVector((width/4), (height/4));
  }

  void display()
  {
    stroke(0);
    fill(0,0,255);
    ellipse(pos.x, pos.y, 190, 190);
  }
}

class Road
{
  PVector pos;
  boolean follow = true;

  Road()
  {
    pos = new PVector(random(width), random(height));
  }

  void display()
  {
    stroke(0);
    fill(0, 0, 255);

    line((width/2)+5, 0, (width/2)+5, height);
    line((width/2)-5, 0, (width/2)-5, height);
    line(0, (height/2)+5, width, (height/2)+5);
    line(0, (height/2)-5, width, (height/2)-5);


    stroke(0, 50, 0);
   // line(width/2, 0, width/2, height);
   // line(0, height/2, width, height/2);
  }
}



