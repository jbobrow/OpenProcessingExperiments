
// This represents a living particle
class Particle
{
  PVector loc;
  PVector vel;
  int born;
  ParticleDefinition pd;
  final PVector gravity = new PVector(0.0, -9.8);
  color c;
  
  Particle(float x, float y, float dx, float dy, ParticleDefinition _pd)
  {
    loc = new PVector(x, y);
    vel = new PVector(dx, dy);
    pd = _pd;
    
    // cache the color since it can change
    // during this particles life
    c = pd.c;
    
    born = millis();
    
    ps.add(this);
  }
  
  void spawnChildren(String pname, int amount)
  {
    ParticleDefinition newpd = pds.get(pname);
    while(amount-- > 0)
    {
      float dx = randnorm(0, 20);
      float dy = randnorm(0, 20);
      
      // Create the new particle and transfer part 
      // of the parent's velocity to the child
      new Particle(loc.x, loc.y, dx + vel.x * .75, dy + vel.y * .75, newpd);
    }
  }
  
  boolean update(float dt)
  {
    loc.sub(PVector.mult(vel, dt));
    vel.mult(pd.drag);
    vel.add(PVector.mult(gravity, dt));
    
    // Remove it if it's not on the screen
    if(loc.x < 0 || loc.x > width || loc.y > height)
      return false;
    
    // Check all the actions for this particle
    for(int i = 0; i < pd.pas.size(); ++i)
      if(pd.pas.get(i).action(this) == false)
        return false;
    
    return true;
  }
  
  // Simple enough...
  void draw()
  {
    fill(c);
    ellipse(loc.x, loc.y, pd.size, pd.size);
  }
}

// A static definition of a particle
// These are defined in the xml document
class ParticleDefinition
{
  ArrayList<ParticleAction> pas = new ArrayList<ParticleAction>();
  String name;
  float size;
  float drag;
  color c;
  
  void setName(String _name) {name = _name;}
  void setSize(float _size) {size = _size;}
  void setDrag(float _drag) {drag = _drag;}
  void setColor(color _c) {c = _c;}
  void addAction(ParticleAction pa) {pas.add(pa);}
}

// Particles have actions (ie die, spawn, change color)
class ParticleAction
{
  ActionType type;
  int time;
  
  String pname;
  int amount;
  boolean die;
  
  ParticleAction(XMLElement xml)
  {
    type = ActionType.valueOf(xml.getString("type"));
    time = xml.getInt("time");
    
    if(type == ActionType.spawn)
    {
      pname = xml.getChild("name").getContent();
      amount = Integer.parseInt(xml.getChild("amount").getContent());
    }
    die = Boolean.parseBoolean(xml.getChild("die").getContent());
  }
  
  boolean action(Particle p)
  {
    if(type == ActionType.spawn)
    {
      if(p.born + time < millis())
      {
        p.spawnChildren(pname, amount);
        return !die;
      }
    }
    else if(type == ActionType.fade)
    {
      float lerpval = norm(millis() - p.born, 0, time);
      float alph = lerp(alpha(p.pd.c), 0, lerpval);
      
      if(p.born + time < millis())
        return !die;
      
      p.c = color(red(p.c), green(p.c), blue(p.c), alph);      
    }
    // TODO: implement more actions
    
    return true;
  }
}

