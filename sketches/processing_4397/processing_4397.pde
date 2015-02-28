
//Code and sketch based on 
//'Particles playing with Gravition' by Mark Brand
//http://www.openprocessing.org/visuals/?visualID=491

//i kept most of the code the same, especially the parts with vectors
//and particle sections as when i attempted to change them about I would
//ruin the code
//instead i attempted to change values of different sections to try make 
//my sketch different to the one it is based on


//this sketch is meant to represent different people and transportation
//moving around each other showing the flow of motion
//i thought Mark Brand's sketch was showing exactly what i wanted to
//all the different particles rely on and are influenced by each other 
//and move together which i think is a very accurate impression of Sydney 
//and relates well to my metaphor


//changed the value of particles that are added in
Particle[] things; 
int thingsMax = 100; 
int thingsCounter =0 ; 

void setup() { 
  size(400, 600); 
  colorMode(RGB); 
  background(0); 
  smooth(); 

  things = new Particle[thingsMax]; 
} 

void draw() { 
  noStroke(); 
  fill(0, 15); 
  rect(0, 0, width, height); 

  for (int i = 0; i < thingsCounter; i++) { 
    for (int j = 0; j < thingsCounter; j++) { 
      if (j != i) { 
        Vector3D f = things[i].calcGravForce(things[j]); 
        things[i].addForce(f); 
      } 
    } 
    things[i].update(); 
    things[i].render(); 
  } 
  
  //changed values and made it so that particles were all put in by themselves
  if (thingsCounter < thingsMax) { 
    Vector3D zero = new Vector3D(0.0, 0.0, 0.0); 
    Vector3D location = new Vector3D((int)random(1, 100) * 4, (int)random(1, 150) * 4, 0.0); 
    float mass = (int)random(1, 6) * 4; 
    things[thingsCounter] = new Particle(zero, zero, location, mass); 
    thingsCounter++; 
  } 
} 

public class Vector3D { 
  public float x; 
  public float y; 
  public float z; 

  Vector3D(float x_, float y_, float z_) { 
    x = x_; 
    y = y_; 
    z = z_; 
  } 

  Vector3D(float x_, float y_) { 
    x = x_; 
    y = y_; 
    z = 0f; 
  } 

  Vector3D() { 
    x = 0f; 
    y = 0f; 
    z = 0f; 
  } 

  void setX(float x_) { 
    x = x_; 
  } 

  void setY(float y_) { 
    y = y_; 
  } 

  void setZ(float z_) { 
    z = z_; 
  } 

  void setXY(float x_, float y_) { 
    x = x_; 
    y = y_; 
  } 

  void setXYZ(float x_, float y_, float z_) { 
    x = x_; 
    y = y_; 
    z = z_; 
  } 

  void setXYZ(Vector3D v) { 
    x = v.x; 
    y = v.y; 
    z = v.z; 
  } 
  public float magnitude() { 
    return (float) Math.sqrt(x*x + y*y + z*z); 
  } 

  public Vector3D copy() { 
    return new Vector3D(x,y,z); 
  } 

  public Vector3D copy(Vector3D v) { 
    return new Vector3D(v.x, v.y,v.z); 
  } 

  public void add(Vector3D v) { 
    x += v.x; 
    y += v.y; 
    z += v.z; 
  } 

  public void sub(Vector3D v) { 
    x -= v.x; 
    y -= v.y; 
    z -= v.z; 
  } 

  public void mult(float n) { 
    x *= n; 
    y *= n; 
    z *= n; 
  } 

  public void div(float n) { 
    x /= n; 
    y /= n; 
    z /= n; 
  } 

  public void normalize() { 
    float m = magnitude(); 
    if (m > 0) { 
      div(m); 
    } 
  } 

  public void limit(float max) { 
    if (magnitude() > max) { 
      normalize(); 
      mult(max); 
    } 
  } 

  public float heading2D() { 
    float angle = (float) Math.atan2(-y, x); 
    return -1*angle; 
  } 

  public Vector3D add(Vector3D v1, Vector3D v2) { 
    Vector3D v = new Vector3D(v1.x + v2.x,v1.y + v2.y, v1.z + v2.z); 
    return v; 
  } 

  public Vector3D sub(Vector3D v1, Vector3D v2) { 
    Vector3D v = new Vector3D(v1.x - v2.x,v1.y - v2.y,v1.z - v2.z); 
    return v; 
  } 

  public Vector3D div(Vector3D v1, float n) { 
    Vector3D v = new Vector3D(v1.x/n,v1.y/n,v1.z/n); 
    return v; 
  } 

  public Vector3D mult(Vector3D v1, float n) { 
    Vector3D v = new Vector3D(v1.x*n,v1.y*n,v1.z*n); 
    return v; 
  } 

  public float distance (Vector3D v1, Vector3D v2) { 
    float dx = v1.x - v2.x; 
    float dy = v1.y - v2.y; 
    float dz = v1.z - v2.z; 
    return (float) Math.sqrt(dx*dx + dy*dy + dz*dz); 
  } 

} 
class Particle { 
  private Vector3D acc; 
  private Vector3D vel; 
  private Vector3D loc; 
  private float mass; 
  private float g; 
  color c; 

  Particle(Vector3D a_, Vector3D v_, Vector3D l_, float m_) { 
    acc = a_.copy(); 
    vel = v_.copy(); 
    loc = l_.copy(); 
    mass = m_; 
    g = mass/100; 
    c = color(loc.x, loc.y, 80); 
  } 

  Particle() { 
    acc = new Vector3D(0.0, 0.0, 0.0); 
    acc = new Vector3D(0.0, 0.0, 0.0); 
    acc = new Vector3D(0.0, 0.0, 0.0); 
    mass = 0; 
  } 

  Vector3D getAcc() { 
    return acc; 
  } 

  Vector3D getVel() { 
    return vel; 
  } 

  Vector3D getLoc() { 
    return loc; 
  } 

  float getMass() { 
    return mass; 
  } 

  Vector3D calcGravForce(Particle p) { 
    Vector3D dir = new Vector3D(); 
    dir = dir.sub(p.getLoc(), loc); 
    float dis = dir.magnitude(); 
    dis = constrain(dis, mass, mass*2); 
    float f = (g * mass * p.getMass()) / (dis * dis); 
    dir.normalize(); 
    dir.mult(f); 
    return dir; 
  } 

  void addForce(Vector3D v) { 
    v.div(mass); 
    acc.add(v); 
  } 

  void update() { 
    vel.add(acc); 
    loc.add(vel); 
    acc.setXYZ(0.0f, 0.0f, 0.0f); 
  } 


//changed values
  void render() { 
    noStroke(); 
    fill(c, 200); 
    ellipse(loc.x, loc.y, mass/2, mass/2); 
  } 
} 




