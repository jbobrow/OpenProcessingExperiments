
TimeManager timeManager;
Mover[] moverList;
PVector gravity;
int moverQty = 20;
boolean isRewinding;

void setup()
{
  size(300, 300);
  background(255);
  
  timeManager = new TimeManager();  
  gravity = new PVector(0, 0.1);  
  isRewinding = false;
  
  moverList = new Mover[moverQty];
  for(int i = 0; i < moverQty; i++)
  {
    Mover m = new Mover(str(i));
    timeManager.register(m);
    moverList[i] = m;    
  }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < moverQty; i++)
  {
    Mover m = moverList[i];
    
    float c = 0.01;
    PVector friction = m.velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    
    m.applyForce(friction);
    m.applyForce(gravity);
    m.update();
    m.display();
    
    if(isRewinding)
    {
      timeManager.rewind(m);
      isRewinding = timeManager.canRewind(m);
    }
    else
    {
      timeManager.record(m); 
    }
  }
}

void keyPressed()
{
  if (keyCode == SHIFT)
  {
    isRewinding = true;
  }
  if (keyCode == 'r' || keyCode == 'R')
  {
    for(int i = 0; i < moverQty; i++)
    {
      Mover m = moverList[i];
      m.reset();
    }
    
    timeManager.reset();
  }
}

void keyReleased()
{
  isRewinding = false;
}
class FrameData
{
  PVector location;
  PVector velocity;
}
class Mover
{
  String id;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(int _id)
  {
    id = _id;
    location = new PVector(0, 0);
    velocity = new PVector(random(0,1),0);
    acceleration = new PVector(random(0,1),random(0,1));
  }
  
  void update()
  {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    checkEdges();
  }
  
  void display()
  {
    ellipse(location.x, location.y, 10, 10);
  }  

  void applyForce(PVector force) 
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void checkEdges() 
  {
    if (location.x > width) 
    {
      location.x = width;
      velocity.x *= -1;
    } 
    else if (location.x < 0) 
    {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) 
    {
      velocity.y *= -1;
      location.y = height;
    }
    else if (location.y < 0) 
    {
      velocity.y *= -1;
      location.y = 0;
    }
  }
  
  void reset()
  {
    location.set(0,0);
    velocity.set(random(0,1),0);
    acceleration.set(random(0,1),random(0,1));
  }
}
class TimeManager
{
  HashMap<String, ArrayList<FrameData>> frameMap;
  
  TimeManager()
  {
    frameMap = new HashMap<String, ArrayList<FrameData>>();
  }
  
  void register(Mover m)
  {
    frameMap.put(m.id, new ArrayList<FrameData>());
  }
  
  void record(Mover m)
  {
    ArrayList<FrameData> frameList = frameMap.get(m.id);
    
    FrameData data = new FrameData();
    data.location = m.location.get();
    data.velocity = m.velocity.get();
    
    frameList.add(data);
  }
  
  void rewind(Mover m)
  {
    ArrayList<FrameData> frameList = frameMap.get(m.id);
    
    int lastFrameId = frameList.size() - 1;
    FrameData data = frameList.get(lastFrameId);

    m.location = data.location;
    m.velocity = data.velocity;
    
    frameList.remove(lastFrameId);
  }
  
  boolean canRewind(Mover m)
  {
    ArrayList<FrameData> frameList = frameMap.get(m.id);
    return frameList.size() > 0;
  }
  
  void reset()
  {
    for (Map.Entry entry : frameMap.entrySet()) 
    {
      ArrayList<FrameData> frameList = entry.getValue();
      frameList.clear();
    }
  }
}


