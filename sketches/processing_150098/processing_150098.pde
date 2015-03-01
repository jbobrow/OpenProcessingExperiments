
Mover m;
PortalManager p;

void setup()
{
  size(800, 600);
  
  m = new Mover(width/2, height/2);
  p = new PortalManager();
}

void draw()
{
  background(255);
  
  p.applyPortal(m);  
 
  p.display();
  
  m.checkEdges();
  m.update();
  m.display();
}

void mouseClicked()
{ 
  p.mouseClick(mouseX, mouseY, mouseButton);
}

void keyPressed()
{
  m.keyPress(keyCode);
}
class Mover
{
   PVector location, velocity, acceleration;
   
   Mover(float x, float y)
   {
     location = new PVector(x, y);
     velocity = new PVector(1, 0);
     acceleration = new PVector(0, 0);
   }
   
   void keyPress(int input)
   {
      PVector force = new PVector();
      
      switch(input)
      {
         case UP: force.set(0, -1); break;
         case DOWN: force.set(0, 1); break;
         case LEFT: force.set(-1, 0); break;
         case RIGHT: force.set(1, 0); break;
      }
      
      applyForce(force);
   }
   
   void applyForce(PVector force)
   {
      acceleration.add(force);
   }
   
   void checkEdges() 
   {
    if(location.x > width) 
    {
      location.x = width;
      velocity.x *= -1;
    } 
    else if(location.x < 0) 
    {
      velocity.x *= -1;
      location.x = 0;
    } 
    if(location.y > height) 
    {
      velocity.y *= -1;
      location.y = height;
    }
    else if(location.y < 0)
    {
      velocity.y *= -1;
      location.y = 0;
    }
  }
   
   void update()
   {
      velocity.add(acceleration);
      location.add(velocity);
      
      acceleration.mult(0);
   }
   
   void display()
   {
     fill(255);
     ellipse(location.x, location.y, 20, 20);
   }
}
class Portal
{
   PVector location;
   int type, size;
   boolean isActive, isTeleporting;
  
  Portal(float x, float y, int t)
  {
     location = new PVector(x, y);
     type = t;
     size = 30;
     isActive = true;
     isTeleporting = false;
  }
  
  void teleport(Mover m)
  { 
    if(!isActive){ return; }
    m.location = location.get();
    isTeleporting = true;
  }
  
  boolean contains(Mover m)
  {
    if(!isActive){ return false; }
    
    float dist = PVector.dist(location, m.location);
    
    boolean isColliding = dist < size;
    
    if(isTeleporting && !isColliding)
    {
      isTeleporting = false;
    }
    
    boolean contains = isColliding && !isTeleporting;
    
    return contains;
  }
  
  boolean toggleActive()
  {
    isActive = !isActive;
    
    return isActive;
  }
  
  void setLocation(float x, float y)
  {
    location.set(x, y);
  }
  
  void display()
  {
    if(!isActive){ return; }
    String hex = (type == 0) ? "#005aff" : "#ffa500";    
    hex = "FF" + hex.substring(1);    
    color c = color(unhex(hex));
    fill(c);
    rectMode(CENTER);
    rect(location.x, location.y, size*2, size*2);
  }
}
class PortalManager
{
  Portal[] portals;
  
  PortalManager()
  {    
    portals = new Portal[2];
    portals[0] = new Portal(width/2 - 100, height/2, 0);
    portals[1] = new Portal(width/2 + 100, height/2, 1);
  }
  
  void applyPortal(Mover m)
  {    
    if(portals[0].contains(m))
    {
       portals[1].teleport(m);
    }
    else if(portals[1].contains(m))
    {
       portals[0].teleport(m);
    }
  }
  
  void mouseClick(float x, float y, int input)
  {
    int index = (input == LEFT) ? 0 : 1; 
    boolean isActive = portals[index].toggleActive();
    
    if(isActive)
    {       
      portals[index].setLocation(x, y);
    }
  }
  
  void display()
  {
    portals[0].display();
    portals[1].display();
  }
}


