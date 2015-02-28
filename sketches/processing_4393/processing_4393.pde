
//Code and sketch based on 
//'Particles playing with Gravition' by Mark Brand
//http://www.openprocessing.org/visuals/?visualID=491

//Similarly to the display projection, I kept the same important
//information which creates the backbone to this sketch
//i once again altered the finer details to make this sketch suit my metaphor
//with this sketch, users are able to manipulate the sketch themselves.
//i thought this meant that users would be able to observe and explore the
//metaphor by playing with the different number of particles added and the 
//placement of them and then observing how they interact with each other.


//changed the value of particles that are added in
Particle[] objects;
int objectsMax = 50;
int objectsCounter = 0;


void setup () {
  size (400, 600);
  background (0); 
  smooth () ;
  
  objects = new Particle [objectsMax];
}

void draw () {
  for (int a = 0; a < objectsCounter; a++) {
    for (int b = 0; b < objectsCounter; b++) {
        if (b != a) {
         Vector3D f = objects[a].calcGravForce(objects[b]); 
        objects[a].addForce(f); 
      } 
    }
    objects[a].update(); 
    objects[a].render();
    }
}


//changed values 
void mouseReleased () {
if (objectsCounter < objectsMax) {
  Vector3D zero = new Vector3D (0, 0, 0);
  Vector3D locataon = new Vector3D (mouseX, mouseY, 0) ;
  float mass = (int) random (1, 5) *7;
  objects [objectsCounter] =new Particle (zero, zero, locataon, mass) ;
  objectsCounter++;
}
}

public class Vector3D { 
  public float x; 
  public float y; 
  public float z; 
 
  Vector3D(float x_, float y_, float z_) { 
    x = x_; y = y_; z = z_; 
  } 
  Vector3D(float x_, float y_) { 
    x = x_; y = y_; z = 0f; 
  } 
   
  Vector3D() { 
    x = 0f; y = 0f; z = 0f; 
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
    c = color(loc.x, loc.y, 255); 
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
    fill(c, 35); 
    ellipse(loc.x, loc.y, mass/2, mass/2); 
  } 
} 
   


