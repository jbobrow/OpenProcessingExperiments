
//public color beige = color(240, 220, 180);
//public color lightGray = color(150);
//public color red = color(255, 0, 0);
//public color blue = color(0, 0, 255);
//public color green = color(0, 255, 0);
//public color black = color(0);
//public color white = color(255);
//public color BG = black;
//  
//public boolean hitboxes = false;
//public boolean centers= true;
//public boolean normals = false;
//public boolean motionData = false;
//public boolean fill = false;
//public boolean showText = true;
//public boolean colData = false;
//public boolean createType = false;
//public boolean attract = false;
//public boolean debug = true;
//
//Material wall = new Material(0.4, 0.3, 0.2, 0, black);
//Material mov = new Material(0.4, 0.2, 0.1, 1, lightGray);
//
//public void fillEdges(ArrayList<Body> b)
//{
//  Shape edgeHoriz = new Rectangle(800, 16);
//  Shape edgeVert = new Rectangle(16, 450);
//  b.add(new Body((edgeHoriz), 400, 450 - 8, wall));
//  b.add(new Body((edgeVert), 12, 225, wall));
//  b.add(new Body((edgeVert), 800 - 12, 225, wall));
//}
//
//
//public final float fps = 60;
//public final float delta = 1/ fps;
//public final float gravity = 5;
//public final float percent = 0.8;
//public final float slop = 0.05;
//public final float airFriction = 0.000003;
//
//public float accumulator = 0;
//public float frameStart = 0;
//
//public boolean pause = false;
//
//

ArrayList<Body> bodies;
//ArrayList<Collision> instances;
Collision collision;
Vec2[] tri = {new Vec2(-32, -32), new Vec2(24, 32), new Vec2(24, -32)};

public void setup()
{
  size(800, 450);
  h = 0;
  
  bodies = new ArrayList<Body>();
  bodies.add(new Body(new Rectangle(48, 48), 425, 400, mov));
  bodies.add(new Body(new Polygon(tri), 530, 200, mov));
  bodies.add(new Body(new Rectangle(32, 32), 562, 200, mov));
  bodies.add(new Body(new Regular(5, 32), 500, 200, mov));
  bodies.add(new Body(new Triangle(256, 128), 640, 400, wall));
  fillEdges(bodies);
  
}

public void draw()
{
  if(pause) return;
  
  float currentTime = millis() * 1000;
  accumulator += currentTime - frameStart;
  frameStart = currentTime;  
  
  if(accumulator > 0.2)
    accumulator = 0.2;
  float delta = 1/60.0;
  float gravity = 30;
  //RenderGame();
//  text(h, 16, 16);
//  h++;
  while(accumulator > delta)
  {
      UpdatePhysics(delta, gravity, airFriction);
      accumulator -= delta;
    }
      RenderGame();
//    if(debug)
//      debug();
 
}

public void RenderGame()
{
  background(BG);
  for(Body mov : bodies)
  {
    mov.Display(mov.material.clr, beige, fill, 
                hitboxes, normals, centers, motionData);
  }
  
//  if(colData)
//  {
//    DrawColData();
//  }
//  
//  if(showText)
//  {
//    if(BG == black) 
//      fill(255);
//    else fill(0);
//    text("To toggle the hitboxes, hit 1", 16, 16);
//    text("To toggle the centers, hit 2", 16, 32);
//    text("To toggle the normals, hit 3", 16, 48);
//    text("To toggle the fill, hit f", 16, 64);
//    text("To toggle the background color, hit b", 16, 80);
//    text("To toggle this text, hit t", 16, 96);
//    text("To pause the application, hit p", 16, 112);
//    text("To toggle attract/repel with right mouse, hit a", 16, 128);
//    text("To create new shape, left mouse", 16, 144);
//    text("To switch new shape type, hit s", 16, 160);
//    text("To view collision data, hit c", 16, 176);
//  }
}

public void UpdatePhysics(float dt, float g, float aF)
{
  //instances.clear();
  ArrayList<Collision> instances = new ArrayList<Collision>();
  Body mov;
  for(int i = 0; i < bodies.size(); i++)
  {
    mov = bodies.get(i);
    mov.Step(dt, g, aF);
    for(int j = i + 1; j < bodies.size(); j++)
    {
      collision = new Collision(mov, bodies.get(j));
      if(collision.Possible())
      {
        instances.add(collision);
      }
    }
  }
  ResolveCollisions(instances);
}

public void ResolveCollisions(ArrayList<Collision> instances)
{
  for(Collision c: instances)
  {
    if(c.Detect())
    {
      c.Resolve();
      c.PositionalCorrection();
    }
  }
}

//public void DrawColData()
//{
//  for(Collision c : instances)
//  {
//    Body a = c.a;
//    Body b = c.b;
//    for(Vec2 contact : c.contacts)
//    {
//      fill(blue); stroke(green);
//      circle(contact, 3);
//      DrawVector(a.position, contact.minus(a.position));
//      DrawVector(b.position, contact.minus(b.position));
//    }
//  }
//}
public class Body
{
  public Shape shape;
  public Vec2 position, previous, force;
  public float angle, prevAngle, torque;
  
  public float mass, inertia, invMass, invInertia;
  public Material material;
  
  public int layer;
  
  public Body()
  {
    shape = null;
    layer = 0;
    position = previous = force = null;
    angle = prevAngle = torque = 0;
    material = null;
  }
  
  public Body(Shape s, float x, float y, Material m)
  {
    shape = s;
    layer = 0;
    position = previous = new Vec2(x, y);
    force = new Vec2();
    angle = prevAngle = torque = 0;
    
    material = m;
    getMassData();
    getInertiaData();
  }
  
  /*Finds values for mass data using the material's properties*/
  public void getMassData()
  {   
    mass = shape.getArea() * material.density;
    invMass = (mass == 0) ? 0 : 1/mass;
  }
  
  /*Finds values for rotation data using the material's properties*/
  public void getInertiaData()
  {
    inertia = shape.getInertia(material.density);
    invInertia = (inertia == 0) ? 0 : 1/inertia;
  }
    
  /*Motion functions*/
  public void ApplyGravity(float g)
  {
    force.addi(new Vec2(0, mass*g));
  }
  
  public void Translate(float dt)
  {
    Vec2 oldPos = new Vec2(position);
    position = position.times(2).minus(previous).plus(force.times(invMass*dt*dt));
    previous = oldPos;
  }
  
  public void Rotate(float dt)
  {
    float oldAngle = angle;
    angle = 2 * angle - prevAngle + torque * invInertia * dt * dt;
    prevAngle = oldAngle; 
  }
  
  public void Reset()
  {
    force = new Vec2();   
    torque = 0;  
  }
  
  public void Step(float dt, float g, float aF)
  {
    Translate(dt);
    Rotate(dt);
    Reset();
    ApplyGravity(g);
    ApplyAirFriction(aF);
  }
  
  /*Move the object without changing the velocity=(position-previous)*/
  public void Displace(Vec2 shift)
  {
    position.addi(shift);
    previous.addi(shift);
  }
  
  /*Adds a small amount of air friction*/
  public void ApplyAirFriction(float fric)
  {
    if(angle - prevAngle > fric/2)
      angle -= fric; 
    else if(angle - prevAngle < -fric/2)
      angle += fric;
    else 
      angle = prevAngle;
  }
  
  public AABB getAABB()
  {
    return shape.getAABB(getTransform());
  }
  
  /*This method will return the 'total velocity', combining both linear and angular terms*/
  public Vec2 combinedVelocity(Vec2 r)
  {
    return position.minus(previous).plus(r.orthoi().times(angle - prevAngle));
  }
  
  /*This methodi will apply an impulse to both linear and angular motion*/
  public void ApplyImpulse(Vec2 impulse, Vec2 contactVector)
  {
    previous.subtract(impulse.times(invMass));
    prevAngle -= invInertia * contactVector.crossi(impulse);
  }
  
  /*This method will project the object's shape onto an axis*/
  public Projection projectOnto(Vec2 axis)
  {
    return shape.projectOnto(axis, getTransform());
  }
  
  /*This method will display the object*/
  public void Display(color clr, color out, 
                      boolean fill, boolean hb, boolean n, boolean c, boolean m)
  {
    shape.display(getTransform(), clr, out, fill, hb, n, c);
    if(m)
    {
      stroke(green);
        DrawVector(position, position.minus(previous).times(64));
      stroke(red);
        DrawVector(position, force.times(invMass * 4));
      stroke(out);
    }
  }
  
  /*accessors*/
  public Transform getTransform()
  {
    Transform t = new Transform(position, angle);
    return t;
  }
  
  public float restitution()
  {
    return material.restitution;
  }
  
  public float staticFriction()
  {
    return material.staticFriction;
  }
  
  public float dynamicFriction()
  {
    return material.dynamicFriction;
  }
  
  /*Miscellaneous*/
  public void attractTo(Vec2 point, float M)
  {
    Vec2 dir = point.minus(position);
    Vec2 f = dir.unit().times(M/dir.magnitude());
    force.addi(f);
  }
  
  public void freezeRotation()
  {
    inertia = 0;
    invInertia = 0;
  }
  
  public void enableRotation()
  {
    getInertiaData();
  }
  
  public void freezeMotion()
  {
    mass = 0;
    invMass = 0;
  }
  
  public void enableMotion()
  {
    getMassData();
  }
}
public class Circle extends Shape
{
  float radius;
  
  public Circle(float r)
  {
    radius = r;
    type = 0;
  }
  
  public float getArea()
  {
    return PI*radius*radius;
  }
  
  public float getInertia(float u)
  {
    return radius*radius*u/2 * getArea();
  }
  
  public AABB getAABB(Transform t)
  {
    float x = t.position.x;
    float y = t.position.y;
    AABB box = new AABB(x-radius, x+radius, y-radius, y+radius);
    return box;
  }
  
  public Projection projectOnto(Vec2 axis, Transform t)
  {
    float p = axis.doti(t.position);
    Projection proj = new Projection(p - radius, p + radius);
    return proj;
  }
  
  public void display(Transform t, color clr, color out, 
                      boolean fill, boolean hb, boolean n, boolean c)
  {
    if(fill)
      fill(clr);
    else noFill();
    stroke(out);
    circle(t.position, radius);
    DrawVector(t.position, new Vec2(radius, t.angle, true));
    super.display(t, clr, out, fill, hb, n, c);
  }
}
public class Collision
{
  Body a, b;
  Line edge;
  Vec2 normal;
  Vec2[] contacts;
  float penetration;
  int contactIndex;
  
  public Collision(Body a_, Body b_)
  {
    a = a_; 
    b = b_;
    edge = new Line();
    normal = new Vec2();
    penetration = 0;
    contacts = new Vec2[0];
    contactIndex = -1;
  }
  /*This function will find the separating axis based on an array of possible choices.*/
  public boolean separatingAxis(Line[] lines)
  {
    float overlap = 100000;
    Projection proj1, proj2;
    for(int i = 0; i < lines.length; i++)
    {
      Vec2 axis = lines[i].normal;
      proj1 = a.projectOnto(axis);
      proj2 = b.projectOnto(axis);
      float over = proj1.getOverlap(proj2);
      if(over < 0)
      {
        return false;
      } 
      else if(over < overlap)
      {
        overlap = over;
        contactIndex = i;
      }
    }
    edge = lines[contactIndex];
    penetration = overlap;
    normal = correctDirection(edge.normal);
    return true; 
  }
  
  /*These three functions will handle collision detection for
  all three possible collision cases using separatingAxis()*/
  public boolean CircleVsCircle()
  {
    Circle circleA = (Circle) a.shape;
    Circle circleB = (Circle) b.shape;
    Vec2 n = b.position.minus(a.position);
    float overlap = circleA.radius + circleB.radius - n.magnitude();
    if(overlap < 0)
    {
      return false;
    }
    normal = n.unit();
    contacts = getContacts(circleA);
    penetration = overlap;
    return true;
  }
  
  public boolean PolygonVsPolygon()
  {
    Polygon polyA = (Polygon) a.shape;
    Polygon polyB = (Polygon) b.shape;
    Line[] lines = Union(polyA.edges(a.getTransform()), polyB.edges(b.getTransform()));
    
    if(separatingAxis(lines))
    {
      contacts = getContacts(polyA, polyB);
      return true;
    }
    return false;
  }
  
  public boolean PolygonVsCircle()
  {
    int typeA = a.shape.type;
    Transform t = (typeA == 0) ? new Transform(b.position, b.angle) : new  Transform(a.position, a.angle);
    Polygon poly = (Polygon) ((typeA == 0) ? b.shape : a.shape);
    Circle circle = (Circle) ((typeA == 0) ? a.shape : b.shape);
    Vec2 center = (typeA == 0) ? a.position : b.position;
    Vec2 lastAxis = poly.closestVert(t, center).minus(center).unit();
    
    Line[] lines = fillArray(poly.edges(t), new Line(lastAxis) );
    
    if(separatingAxis(lines))
    {
      contacts = getContacts(poly, circle);
      return true;
    }
    return false;
  }
  
  /*The following three functions will fill contacts
  with the collision points between the two Bodyects*/
  public Vec2[] getContacts(Circle circleA)
  {
    Vec2 point = a.position.plus(normal.times(circleA.radius));
    Vec2[] c = {point};
    return c;
  }
  
  public Vec2[] getContacts(Polygon polyA, Polygon polyB)
  {
    Vec2[] vertices;
    int numPoints = 0;
    if(contactIndex < polyA.n)
    {
      vertices = polyB.vertices(b.getTransform());
    } else 
    {
      vertices = polyA.vertices(a.getTransform());
    }
    return edge.closestPoints(vertices);
  }
  
  public Vec2[] getContacts(Polygon poly, Circle circle)
  {
    int typeA = a.shape.type;
    Transform t = (typeA == 0) ? b.getTransform() : a.getTransform();
    Vec2 center = (typeA == 0) ? a.position : b.position;
    Vec2 nrm = (typeA == 0) ? normal.anti() : normal;
    Vec2[] c = new Vec2[1];
    if(contactIndex < poly.n)
    {
      c[0] = center.minus(nrm.times(circle.radius));
    } 
    else 
    {
      c[0] = poly.closestVert(t, center);
    }
    return c;
  }
  
  /*This function will return true if a collision is possible*/
  public boolean Possible()
  {
    if(a.mass + b.mass == 0)
    {
      return false;
    }
    AABB hitboxA = a.getAABB();
    AABB hitboxB = b.getAABB();
    if(!hitboxA.overlaps(hitboxB))
    {
      return false;
    }
    if(a.layer != b.layer) return false;
    return true;
  }
  
  /*This function will choose which collision detection function to call
  if the AABBs do collide*/
  public boolean Detect()
  {
    int typeA = a.shape.type;
    int typeB = b.shape.type;
    if(typeA * typeB == 1)
    {
      return PolygonVsPolygon();
    }
    else if(typeA + typeB == 1)
    {
      return PolygonVsCircle();
    }
    else if(typeA + typeB == 0)
    {
      return CircleVsCircle();
    }
    return false;
  }
  
  /*In the event of a collision, this function will handle
  the linear and angular velocities of the two Bodyects*/
  public void Resolve()
  {  
    float e = min(a.restitution(), b.restitution());
    float sf = pythagSolve(a.staticFriction(), b.staticFriction());
    float df = pythagSolve(a.dynamicFriction(), b.dynamicFriction());
    int numContacts = contacts.length;
    
    for(int i = 0; i < numContacts; i++)
    {
      Vec2 radA = contacts[i].minus(a.position);
      Vec2 radB = contacts[i].minus(b.position);
      
      FixRadii(radA, radB, normal);
      
      Vec2 rv = relativeVelocity(radA, radB);
      float nVel = rv.doti(normal);
      if(nVel <= 0)
      {
      float invMassSum = a.invMass + b.invMass + 
                         a.invInertia*square(radA.crossi(normal)) + b.invInertia*square(radB.crossi(normal));
      float j = -(1+e)*nVel/invMassSum/numContacts;
      Vec2 impulse = normal.times(j);
      
      a.ApplyImpulse(impulse.anti(), radA);
      b.ApplyImpulse(impulse, radB);
      
      rv = relativeVelocity(radA, radB);
      Vec2 tangent = rv.minus(normal.times(rv.doti(normal))).unit();
      float jt = -tangent.doti(rv)/invMassSum/numContacts;
      Vec2 tangentImpulse = (abs(jt) < j * sf) ? tangent.times(jt) : tangent.times(-j * df);
      
      a.ApplyImpulse(tangentImpulse.anti(), radA);
      b.ApplyImpulse(tangentImpulse, radB);
      }
    }
  }
  
  /*This function will push the Bodyects out of each other to prevent sinking*/
  public void PositionalCorrection()
  {
    Vec2 correction = normal.times(max(penetration - slop, 0)/(a.invMass + b.invMass)*percent);
    a.Displace(correction.times(-a.invMass));
    b.Displace(correction.times(b.invMass));
  }
  
  /*This is a helper function which will make sure that the normal points 
  from a to b*/
  public Vec2 correctDirection(Vec2 v)
  {
    if(b.position.minus(a.position).doti(v) < 0)
    {
      return v.anti(); 
    } else return v; 
  }
  
  /*This is a helper function that will fix the direction of rotation*/
  public void FixRadii(Vec2 radA, Vec2 radB, Vec2 n)
  {
    if(n.doti(radA) < 0)
    { 
      radA.negate();
    }
    if(n.doti(radB) > 0) 
    {
      radB.negate();
    }
  }
  
  /*This is a helper function that returns the relative velocity of b.vel - a.vel*/
  public Vec2 relativeVelocity(Vec2 radA, Vec2 radB)
  {
    return b.combinedVelocity(radB).minus(a.combinedVelocity(radA));
  }
  
}
//void keyPressed()
//{
//  if(key == '1')
//  {
//    hitboxes = !hitboxes;
//  }
//  else if(key == '2')
//  {
//    centers = !centers;
//  }
//  else if(key == '3')
//  {
//    normals = !normals;
//  }
//  else if(key == 'p')
//  {
//    pause = !pause;
//  }
//  else if(key == 'f')
//  {
//    fill = !fill;
//  }
//  else if(key == 'b')
//  {
//    BG = (BG==black) ? beige : black;
//  }
//  else if(key == 't')
//  {
//    showText = !showText;
//  }
//  else if(key == 'c')
//  {
//    colData = !colData;
//  }
//  else if(key == 's')
//  {
//    createType = !createType;
//  }
//  else if(key == 'a')
//  {
//    attract = !attract;
//  }
//  else if(key == '`')
//  {
//    debug = !debug;
//  }
//  else if(key == 'm')
//  {
//    motionData = !motionData;
//  }
//}
//
//void debug()
//{
//  if(mousePressed && mouseButton == RIGHT)
//  {
//    for(Body mov : bodies)
//      mov.attractTo(new Vec2(mouseX, mouseY), (attract) ? 900000 : -1000000);
//  }
//}
//
//void mousePressed()
//{
//  if(!debug) return;
//  if(mousePressed && mouseButton == LEFT)
//  {
//    int n = int(random(3, 8));
//    Vec2[] map = new Vec2[n];
//    float radius = 6 * random(1, 6) + 6;
//    float angle = 0;
//    for(int i = 0; i < n; i++)
//    {
//      map[i] = new Vec2(radius, angle, false);
//      radius = random(1, radius/4) + radius;
//      angle -= TWO_PI/n;
//    }
//    Shape s = (createType) ? new Circle(random(16, 64)) : new Polygon(map);
//    Body additional = new Body(s, mouseX, mouseY, mov);
//    bodies.add(additional);
//  }
//}
/*For collisions, this will store a shape's projection onto an axis*/
public class Projection
{
  float min, max;
  
  public Projection(float a, float b)
  {
    min = a; max = b;
  }
  
  public float getOverlap(Projection other)
  {
    if(this.min > other.min)
      return other.max - this.min;
    else
      return this.max - other.min; 
  }
  
}

/*This class stores the AABB of some shape*/
public class AABB
{
  float left, right, top, bottom;
  
  public AABB(float l, float r, float t, float b)
  {
    left = l; right = r; top = t; bottom = b;
  }
  
  public boolean overlaps(AABB other)
  {
    return (this.right > other.left || this.left < other.right)
        && (this.bottom > other.top || this.top < other.bottom);
  }
  
  public void display()
  {
    float wid = right-left;
    float len = bottom-top;
    rect(left, top, wid, len);
  }
}

/*This class stores the position and angle of an Bodyect*/
public class Transform
{
  public Vec2 position;
  public float angle;
  
  public Transform(Vec2 p, float a)
  {
    position = p;
    angle = a;
  } 
}

/*This class stores motion-related information for an Bodyect*/
public class Material
{
  float restitution, staticFriction, dynamicFriction, density;
  color clr;
  
  public Material()
  {
    restitution = staticFriction = dynamicFriction = density = 0;
    clr = color(0);
  }
  
  public Material(float r, float sf, float df, float d, color c)
  {
    restitution = r;
    staticFriction = sf;
    dynamicFriction = df;
    density = d;
    clr = c;
  }
}

/*This function draws a vector from an origin*/
public void DrawVector(Vec2 origin, Vec2 v)
{
  line(origin.x, origin.y, origin.x + v.x, origin.y + v.y);
}

/*This function draws a circle at a given point*/
public void circle(Vec2 point, float radius)
{
  ellipse(point.x, point.y, radius * 2, radius * 2);  
}

/*This obviously returns x squared*/
public float square(float x)
{
  return x*x;
}

/*This function is used in collisions to find the fricon coefficient*/
public float pythagSolve(float x, float y)
{
  return sqrt(x*x + y*y);
}

/*This function will join two arrays into one*/
public Line[] Union(Line[] a, Line[] b)
{
  int n = a.length + b.length;
  Line[] c = new Line[n];
  for(int i = 0; i < n; i++)
  {
    c[i] = (i < a.length) ? a[i] : b[i-a.length];
  }
  return c;
}

/*This function will return an array equivalent to the input array 
with a vector appended to the end of it*/
public Line[] fillArray(Line[] u, Line v)
{
  Line[] filled = new Line[u.length + 1];
  int i = 0;
  for(; i < u.length; i++)
  {
    filled[i] = u[i];
  }
  filled[i] = v;
  return filled;
}

/*This function returns an array of the 
first num vectors of the original array*/
public Vec2[] clamp(Vec2[] original, int num)
{
  Vec2[] clamped = new Vec2[num];
  for(int i = 0; i < num; i++)
  {
    clamped[i] = original[i];
  }
  return clamped;
}

/*The following two functions are used in finding
the moment of inertia of a polygon*/
public Vec2 triangleCentroid(Vec2 v1 ,Vec2 v2)
{
  Vec2 t1 = v1.times(.5).minus(v2);
  Vec2 t2 = v2.times(.5).minus(v1);
  float m1 = t1.y/t1.x;
  float m2 = t2.y/t2.x;
  float b1 = v2.y - m1*v2.x;
  float b2 = v1.y - m2*v1.x;
  Vec2 centroid = new Vec2(b2-b1, b2*m1-b1*m2);
  centroid.multiply(1/(m1-m2));
  return centroid;
}

public float triangleInertia(Vec2 v1, Vec2 v2)
{
  Vec2 u1 = v1.unit();
  float prod = v2.doti(u1);
  float mag1 = v1.magnitude();
  
  float iTri = v2.minus(u1.times(prod)).times(mag1/36).magnitude();
  iTri *= (1 + v1.squareMag() + v2.squareMag() + prod*(prod-2-mag1));
  return iTri;
}
public class Line
{
  Vec2 point, normal;
  float len;
  
  public Line(Vec2 u, Vec2 v)
  {
    point = u;
    normal = v.minus(u).orthoi().unit();
    len = v.minus(u).magnitude();
  }
  
  public Line(Vec2 n)
  {
    point = new Vec2();
    len = 0;
    normal = n;
  }
  
  public Line()
  {
    point = new Vec2();
    normal = new Vec2();
  }
  
  public float distanceTo(Vec2 p)
  {
    return abs(p.minus(point).doti(normal));
  }
  
  public Vec2[] closestPoints(Vec2[] points)
  {
    Vec2[] closest = new Vec2[points.length];
    int k = 0;
    float minDistance = distanceTo(points[0]);
    for(int i = 1; i < points.length; i++)
    {
      float dist = distanceTo(points[i]);
      if(dist < minDistance)
      {
        minDistance = dist;
      }
    }
    for(int i = 0; i < points.length; i++)
    {
      if(abs(distanceTo(points[i]) - minDistance) < slop)
      {
        closest[k] = points[i];
        k++;
      }
    }
    return clamp(closest, k);
  }
}
public color beige = color(240, 220, 180);
public color lightGray = color(150);
public color red = color(255, 0, 0);
public color blue = color(0, 0, 255);
public color green = color(0, 255, 0);
public color black = color(0);
public color white = color(255);
public color BG = black;
  
public boolean hitboxes = false;
public boolean centers= true;
public boolean normals = false;
public boolean motionData = false;
public boolean fill = false;
public boolean showText = true;
public boolean colData = false;
public boolean createType = false;
public boolean attract = false;
public boolean debug = true;

Material wall = new Material(0.4, 0.3, 0.2, 0, black);
Material mov = new Material(0.4, 0.2, 0.1, 1, lightGray);

public void fillEdges(ArrayList<Body> b)
{
  Shape edgeHoriz = new Rectangle(800, 16);
  Shape edgeVert = new Rectangle(16, 450);
  b.add(new Body((edgeHoriz), 400, 450 - 8, wall));
  b.add(new Body((edgeVert), 12, 225, wall));
  b.add(new Body((edgeVert), 800 - 12, 225, wall));
}

/*Polygon, the biggest Shape child*/
public class Polygon extends Shape
{
  Vec2[] map;
  int n;
  
  public Polygon()
  {
    type = 1;
  }
  
  public Polygon(Vec2[] mp)
  {
    map = mp;
    n = map.length;
    adjustCenter();
    type = 1;
  }

  public float getArea()
  {
    float area = 0;
    for(int i = 0, k = n-1; i < n; k = i, i++)
    {
      area += map[i].crossi(map[k]);
    }
    return area * 0.5;
  }
  
  /*This function will adjust the vertex map so that it is 
  centered about the center of mass, located at (x,y)*/
  public void adjustCenter()
  {
    Vec2 p = new Vec2();
    for(int i = 0, k = n-1; i < n; k = i, i++)
    {
      p.addi(map[i].plus(map[k]).times(map[k].crossi(map[i])));
    }
    p.multiply(1/(6*getArea()));
    for(int i = 0; i < n; i++)
    {
      map[i].addi(p);
    }   
  }
  
  public float getInertia(float u)
  {
    float ini = 0;
    for(int i = 0, k = n - 1; i < n; k = i, i++)
    {
      ini += triangleInertia(map[i], map[k]) + 
          abs(map[i].crossi(map[k]))*triangleCentroid(map[i], map[k]).squareMag()/2;
    }
    return u*ini;
  }
  
  public AABB getAABB(Transform tr)
  {
    Vec2[] vert = vertices(tr);
    float l = vert[0].x; float r = l;
    float t = vert[0].y; float b = t;
    for(int i = 1; i < n; i++)
    {
      if(vert[i].x < l)
      {
        l = vert[i].x;
      } else if (vert[i].x > r)
      {
        r = vert[i].x;
      }
      if(vert[i].y < t)
      {
        t = vert[i].y;
      } else if(vert[i].y > b)
      {
        b = vert[i].y;
      }
    }
    AABB hb = new AABB(l, r, t, b);
    return hb;
  }
  
  public Vec2[] vertices(Transform t)
  {
    Vec2[] vert = new Vec2[n];
    for(int i = 0; i < n; i++)
    {
      vert[i] = t.position.plus(map[i]).rotatei(t);
    }
    return vert;
  }
  
  public Line[] edges(Transform t)
  {
    Vec2[] vert = vertices(t);
    Line[] ed = new Line[n];
    for(int i = 0, k = n - 1; i < n; k = i, i++)
    {
      ed[i] = new Line(vert[k], vert[i]);
    }
    return ed;
  }
  
  public Vec2[] normals(Transform t)
  {
    Vec2[] vert = vertices(t);
    Vec2[] norm = new Vec2[n];
    for(int i = 0, k = n-1; i < n; k = i, i++)
    {
      norm[i] = (vert[i].minus(vert[k])).orthoi().unit();
    }
    return norm;
  }
  
  public Vec2 closestVert(Transform t, Vec2 center)
  {
    Vec2[] vert = vertices(t);
    int k = 0;
    float dist = center.minus(vert[0]).squareMag();
    for(int i = 1; i < n; i++)
    {
      float d = center.minus(vert[i]).squareMag();
      if(d < dist)
      {
        dist = d;
        k = i;
      }
    }
    return vert[k];
  }
  
  public Projection projectOnto(Vec2 axis, Transform t)
  {
    Vec2[] vert = vertices(t);
    float min = axis.doti(vert[0]);
    float max = min;
    
    for(int i = 1; i < n; i++)
    {
      float p = axis.doti(vert[i]);
      if(p < min)
      {
        min = p;
      }
      else if (p > max)
      {
        max = p;
      }
    }
    Projection proj = new Projection(min, max);
    return proj;
  }
 
  public void drawNormals(Transform t)
  {
    Vec2[] vert = vertices(t);
    Vec2[] normals = normals(t);
    for(int i = 0, k = n-1; i < n; k = i, i++)
    {
      DrawVector(vert[i].minus(vert[k]).times(.5).plus(vert[k]), normals[i].times(8));
    }
  }
  
  public void display(Transform t, color clr, color out,
                      boolean fill, boolean hb, boolean n, boolean c)
  {
    if(fill)
      fill(clr);
    else noFill();
    stroke(out);
    beginShape();
    Vec2[] vert = vertices(t);
    for(Vec2 v : vert)
    {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    if(n)
    {
      stroke(blue);
      drawNormals(t);
    }
    super.display(t, clr, out, fill, hb, n, c);
  }
}

/*Classes here for convenience and simplicity*/
public class Rectangle extends Polygon
{
  public Rectangle(float w, float l)
  {
    n = 4;
    Vec2[] m = {new Vec2(-w/2, -l/2), new Vec2(-w/2, l/2), 
          new Vec2(w/2, l/2), new Vec2(w/2, -l/2)};
    map = m;
  }
}

public class Regular extends Polygon
{
  public Regular(int n_, float radius)
  {
    n = n_;
    map = new Vec2[n];
    float angle = 0, del = TWO_PI/ (float) n;
    for(int i = 0; i < n; i++)
    {
      map[i] = new Vec2(radius, angle, true);
      angle -= del;
    }
  }
}

public class Triangle extends Polygon
{
  public Triangle(float b, float h)
  {
    n = 3;
    Vec2[] m = {new Vec2(0, -h), new Vec2(-b/2, 0), new Vec2(b/2, 0)};
    map = m;
    adjustCenter();
  }
}

public abstract class Shape
{
  public int type;
  public abstract float getArea();
  public abstract float getInertia(float u);
  public abstract AABB getAABB(Transform t);
  public abstract Projection projectOnto(Vec2 axis, Transform t);
  
  void display(Transform t, color clr, color out,
               boolean fill, boolean hb, boolean norms, boolean cents)
  {
    noFill();
    if(hb)
    {
      stroke(200, 0, 0);
      AABB hitbox = getAABB(t);
      hitbox.display();
    }
    if(cents)
    {
      stroke(white);
      circle(t.position, 2);
    }
  }
}

public final float fps = 60;
//public final float delta = 1/ fps;
//public final float gravity = 30;
public final float percent = 0.8;
public final float slop = 0.05;
public final float airFriction = 0.000003;

public float accumulator = 0;
public float frameStart = 0;

public boolean pause = false;


/*Generic vector class. Operations include addition,
subtraction, and the scalar and vector products.*/
public class Vec2
{
  public float x, y;
  
  public Vec2(float x_, float y_)
  {
    x = x_;
    y = y_;
  }
  
  public Vec2(float r, float angle, boolean b)
  {
    x = r * cos(angle);
    y = r * sin(angle);
  }
  
  public Vec2(Vec2 copy)
  {
    x = copy.x;
    y = copy.y;
  }
  
  public Vec2()
  {
    x = y = 0;
  }
  
  /*Functions that return numbers*/
  public float magnitude()
  {
    return sqrt(x*x + y*y);
  }
  
  public float squareMag()
  {
    return x*x + y*y;
  }
  
  public float doti(Vec2 other)
  {
    return this.x*other.x + this.y*other.y;
  }
  
  public float crossi(Vec2 other)
  {
    return this.x * other.y - this.y * other.x;
  }
  
  /*Functions that return vectors without changing this vector*/
  public Vec2 plus(Vec2 other)
  {
    Vec2 r = new Vec2();
    r.x = this.x + other.x;
    r.y = this.y + other.y;
    return r;
  }
  
  public Vec2 minus(Vec2 other)
  {
    Vec2 r = new Vec2();
    r.x = this.x - other.x;
    r.y = this.y - other.y;
    return r;
  }
  
  public Vec2 times(float s)
  {
    Vec2 r = new Vec2();
    r.x = this.x*s;
    r.y = this.y*s;
    return r;
  }
  
  public Vec2 unit()
  {
    float invMag = (this.magnitude() == 0) ? 0 : 1/this.magnitude();
    return this.times(invMag);
  }
  
  public Vec2 orthoi()
  {
    Vec2 r = new Vec2(-this.y, this.x);
    return r;
  }
  
  public Vec2 rotatei(Transform t)
  {
    Vec2 v = new Vec2();
    Vec2 u = this.minus(t.position);
    v.x = u.x*cos(t.angle) - u.y*sin(t.angle);
    v.y = u.y*cos(t.angle) + u.x*sin(t.angle); 
    return v.plus(t.position);
  }
  
  public Vec2 anti()
  {
    return this.times(-1);
  }
  
  /*Functions which change the current vector*/
  public void normalizei()
  {
    float invMag = (this.magnitude() == 0) ? 0 : 1/this.magnitude();
    this.x*=invMag;
    this.y*=invMag;
  }
  
  public void addi(Vec2 other)
  {
    this.x += other.x;
    this.y += other.y;
  }
  
  public void subtract(Vec2 other)
  {
    this.x -= other.x;
    this.y -= other.y;
  }
  
  public void multiply(float s)
  {
    this.x*=s;
    this.y*=s;
  }
  
  public void negate()
  {
    this.x *= -1;
    this.y *= -1;
  }
  
}


