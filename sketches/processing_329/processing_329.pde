
/*
title: molecular
description: a basic layered particle simulator, a first step
author: michael e. blix
date: november 2007
*/

ParticleSystem ps;

void setup()
{
  size(900, 450);
  smooth();
  noStroke();
  fill(255);
  background(0);
  frameRate(30);
 
  ps = new ParticleSystem(120);
}


void draw()
{
  background(0);
  noStroke();
  smooth();
  ps.run();
}

// returns a random integer between [-bound + initial, bound + initial] (inclusive)
int randInt(int bound, int initial)
{
   return int(random(-bound, bound)) + initial;
}

void mousePressed()
{
  float r = random(0,1);
  if (r > 0.5)
    noLoop();
  else
    loop();
}

public class Particle
{
    
    Vector3D pos;
    Vector3D vel;
    Vector3D accel;
    
    float radius;
    int lifespan;
    
    Particle(float x, float y, float z, float radius)
    {
      this.pos = new Vector3D(x, y, z);
      this.radius = radius;
      
      this.vel = new Vector3D(random(-9,9), random(-9,9), random(-9,9));
      
      while (this.vel.getX() == this.vel.getY())
      {
        this.vel.setY(random(-5,5));
      }
      
      this.accel = new Vector3D(0,0,0);
    }
    
    void drawParticleBottom()
    {
       fill(64);
       int rad = new Float((radius)).intValue();
       ellipse(new Float(this.pos.getX()).intValue(), new Float(this.pos.getY()).intValue(), rad, rad);
    }
    
    
    void drawParticleTop()
    {
      fill(255);
       int rad = new Float((radius)).intValue() - 8;
       ellipse(new Float(this.pos.getX()).intValue(), new Float(this.pos.getY()).intValue(), rad, rad);
    }
    void update()
    {
       this.pos.addX(this.vel.getX());
       this.pos.addY(this.vel.getY());
       this.pos.addZ(this.vel.getZ());
       
       
       //evaluate boundary conditions and reflect accordingly
       if (this.pos.getX() < 0 || this.pos.getX() > width)
          this.vel.setX(this.vel.getX() * -1);
       if (this.pos.getY() < 0 || this.pos.getY() > height)
          this.vel.setY(this.vel.getY() * -1);
       
       
    }
    
    void run(int stage)
    {
      if (stage == 1)
          this.drawParticleBottom();
      else
          this.drawParticleTop();
    }
}

public class ParticleSystem
{
     ArrayList particles;
     int xo;
     int yo;
     
     ParticleSystem(int num)
     {
       particles = new ArrayList();
       xo = width/2;
       yo = height/2;
       for (int i=0; i<num; i++)
       {
           int x = randInt(width/2-100, width/2);
           int y = randInt(height/2-100, height/2);
           particles.add(new Particle(x,y,0,randInt(50,60)));
       }
     }
     void run()
     {
        for (int j=0; j< particles.size(); j++)
        {
           Particle p = (Particle) particles.get(j);
           p.run(1);
        }
        for (int j=0; j< particles.size(); j++)
        {
           Particle p = (Particle) particles.get(j);
           p.run(2);
           p.update();
        }
       
     }
}

public class Vector3D
{
  private float x, y, z;
	
  public Vector3D()
  {
    this.x = 0f;
    this.y = 0f;
    this.z = 0f;
  }
	
	/** Vector3D constructor
	 * @param x value
	 * @param y value
	 * @param z value
	 */
  public Vector3D(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public Vector3D(Vector3D v)
  {
    this.x = v.getX();
    this.y = v.getY();
    this.z = v.getZ();
  }
	/* Returns the magnitude or length of the implicit Vector3D
	 */
  public float magnitude()
  {
    return (float)Math.sqrt(x*x + y*y + z*z);
  }
	
  public void setX(float x){ this.x = x; }
  public void setY(float y){ this.y = y; }
  public void setZ(float z){ this.z = z; }
  
  public float getX(){ return this.x; }
  public float getY(){ return this.y; }
  public float getZ(){ return this.z; }
  
  public void addX(float delta){ this.x += delta; }
  public void addY(float delta){ this.y += delta; }
  public void addZ(float delta){ this.z += delta; }
  
  public Vector3D normalize()
  {
    float vmag = this.magnitude();
    Vector3D vnorm = new Vector3D(this.x/vmag, this.y/vmag, this.z/vmag);    
    return vnorm;
  }
  public void invert()
  {
    this.multiply(-1);
  }

  //multiply by a scalar quantity
  public void multiply(float scalar)
  {
    this.x *= scalar;
    this.y *= scalar;
    this.z *= scalar;
  }
  //dot product
  public float dot(Vector3D v)
  {
	  return (this.x*v.x) +(this.y*v.y) +(this.z*v.z);
  }
  //cross product: returns a surface normal vector
  public Vector3D cross(Vector3D v)
  {
	  return new Vector3D(this.y*v.z-this.z*v.y,this.z*v.x-this.x*v.z,this.x*v.y-this.y*v.x);
  }
  //returns the angle between two vectors, in radians
  // 
  public float angleBetween(Vector3D v)
  {
	  //angle = inverse cosine of (dot product / product of magnitudes)
	  return (float) Math.acos(this.dot(v) / (this.magnitude()*v.magnitude()));
  }
  
  //other methods: perpindicular, parallel, 
  
}

