
ArrayList<Entity> entities = new ArrayList<Entity>();

ArrayList<Integer> times = new ArrayList<Integer>();

int prev_millis = 0;

PVector control = new PVector();

void setup() {
  size(400, 400);
  smooth();
  
  times.add(0);
  times.add(0);
  
  PVector ent1_startPos = new PVector(100,100);
  entities.add(new Entity(new PosCalc[] {
    new LinearCalc(ent1_startPos, new PVector(.1,0)),
    new LinearCalc(ent1_startPos, new PVector(0,.05))
  }));

  PVector ent2_startPos = new PVector(200,100);
  entities.add(new Entity(new PosCalc[] {
    new LinearCalc(ent2_startPos, new PVector(-.1,0)),
    new LinearCalc(ent2_startPos, new PVector(0,.15))
  }));
}

void draw() {
  int now = millis();
  int dt = now - prev_millis;
  prev_millis = now;
  
  /*
  for (int i=0; i<times.size(); ++i)
    times.set(i, times.get(i) + dt);
  */
  
  if (control.x > 0) incrmentTime( dt, 0);
  if (control.x < 0) incrmentTime(-dt, 0);
  if (control.y > 0) incrmentTime( dt, 1);
  if (control.y < 0) incrmentTime(-dt, 1);
  
  
  for (Entity e : entities)
    e.update(dt);
    
  background(50);
  for (Entity e : entities)
    e.draw();
}

void incrmentTime(int dt, int timeDimention) {
  times.set(timeDimention, times.get(timeDimention) + dt);
}

void handleKeys(int keyCode, int pressDir) {
       if (key=='w') control.y -= pressDir;
  else if (key=='s') control.y += pressDir;
  else if (key=='a') control.x -= pressDir;
  else if (key=='d') control.x += pressDir;
  
  control.x = clamp(control.x, -1, 1);
  control.y = clamp(control.y, -1, 1);
}

float clamp(float value, float minimum, float maximum) {
  return max(minimum, min(maximum, value));
}

void keyPressed()  { handleKeys(keyCode,  1); }
void keyReleased() { handleKeys(keyCode, -1); }
class Entity {
  

  ArrayList<PosCalc> calcs = new ArrayList<PosCalc> ();
  PVector pos = new PVector();
  
  Entity(PosCalc[] calcs) {
    if (calcs.length != times.size()) throw new IllegalArgumentException(); // check for the right length
    
    for (PosCalc calc : calcs)
      this.calcs.add(calc);
  }
  
  void update(int dt) {
    pos = new PVector();
    
    for (int i=0; i<times.size(); ++i) {
      pos.add(calcs.get(i).pos(times.get(i)));
    }
    pos.div(times.size());
  }
  
  void draw() {
    
    ellipse(pos.x, pos.y, 50 ,50);   
  }
}

// A class that represents a functoin on time
class LinearCalc implements PosCalc {
  PVector start;
  PVector vel;
  
  LinearCalc(PVector start, PVector vel) {
    this.start = start.get();
    this.vel = vel.get();
  }
  
  PVector pos(int time) {
    //println(PVector.mult(vel, time));
    PVector ret = PVector.mult(vel, time);
    ret.add(start);
    return ret;
  }
}

// A class that represents a functoin on time
interface PosCalc {
  
  PVector pos(int time);
}


