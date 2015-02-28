
boolean  SHOW_SPEED_VECTOR = false;
boolean  SHOW_ACCEL_VECTOR = false;
boolean  SHOW_FORCE_VECTOR = false;
boolean  WALLS = false;
boolean  FLOOR = false;
boolean  IS_COLORFUL = true;
boolean  FAST_MODE = true;
boolean  SOLO = false;
boolean  RAND_START_SPEED= true;
boolean  VERBOSE_COLLISION = false;

int      maxSize = 5;
float    minMass=0.5;
float    maxMass=25;
float    GRAVITY_DIVISOR=70;
float    FLOOR_POS = -100;

int      SIZE_X = 1200;
int      SIZE_Y = 720;
int      SIZE_Z = 500;

int      SPAWN_X0 = 200;
int      SPAWN_X1 = -SPAWN_X0;
int      SPAWN_Y0 = 200;
int      SPAWN_Y1 = -SPAWN_Y0;
int      SPAWN_Z0 = 200;
int      SPAWN_Z1 = -SPAWN_Z0;

int      NUMBER_OF_PARTICLES = 10;

float wallY = 500;
float wallX = 500;
float wallZ = 500;

Particle particleList[] = new Particle[NUMBER_OF_PARTICLES];

/* represents a vector */
class Vector
{
  public float x;
  public float y;
  public float z;
  
  public Vector(float x0, float y0, float z0)
  {
    x = x0;
    y = y0;
    z = z0;
  }
  
  /* returns a normalized version of the vector */
  public Vector normalize()
  {
     float norm = norm();
     return new Vector(x/norm,y/norm,z/norm);
  }
  
  /* rotates the vetor in d degrees counter-clockwise NOT WORKING PROPERLY */
  public void rotate(float d)
  {
     d = radians(d);
     x = x*cos(d) + y*sin(d);
     y = y*cos(d) - x*sin(d) ;
  }
  
  /* adds the vector v to the current vector and returns */
  public Vector addVector(Vector v)
  {
    return new Vector(x+v.x,y+v.y,z+v.z);
  }
  
  /* returns the norm of the vector */
  public float norm()
  {
    return sqrt(sq(x)+sq(y)+sq(z));
  }
  
  /* prints the vector */
  public void print()
  {
     println("Vector:(" + x + "," + y + "," + z + ")"); 
  }
  
  /* scales the vector */
  public void scale(float w)
  {
    x*=w;
    y*=w; 
    z*=w;
  }
  
  /* returns the vector, used to copy it */
  public Vector get()
  {
    return new Vector(x,y,z); 
  }
  
  /* returns the angle in degrees between the vector and the Vector v */
  public float angle(Vector v)
  {
    float a1 = asin(x/norm());
    float a2 = asin(v.x/v.norm());
    return a1-a2;
  }
}

/* represents a position */
class Position
{
  public float z;
  public float x;
  public float y;
  
  public Position(float x0, float y0, float z0)
  {
    x = x0;
    y = y0;
    z = z0;
  }
  
  /* adds a vector to the position */
  public Position addVector(Vector v)
  {
    return new Position(x+=v.x,y+=v.y,z+=v.z);
    
  }
  
  /* gets the vector that goes from pa to pb */
  public Vector aTob(Position pb)
  {
    return new Vector(pb.x - x,pb.y - y,pb.z - z);
  }
  
  /* prints the position */
  public void print()
  {
     println("Position:(" + x + "," + y + "," + z + ")"); 
  }
  
  /* returns the distance between this position and another, as float */
  public float distance(Position p0)
  {
      return sqrt(sq(p0.x-x)+sq(p0.y-y)+sq(p0.z-z));
  }
  
}

/* represents the particles */
class Particle
{
  
  
  private Position pos;
  private Position oldPos; /* oldpos is used to better the lines */
  
  private float mass;
  private Vector speed;
  private Vector accel;
  private Vector force;
  
  public int myNumber=0;
  
  private int radius;
  private int[] colour = new int[3];
  
  /* constructor with position */
  public Particle(float x, float y, float z)
  {
    pos = new Position(x,y,z);
    oldPos = new Position(x,y,z);
    
    /* sets default acceleration, mass and force */
    accel = new Vector(0,0,0);
    force = new Vector(0,0,0);
    speed = new Vector(0,0,0);
    mass = 1;
    
    /*sets default colour */
    colour[0]=0;
    colour[1]=0;
    colour[2]=255;
    radius=1;
    

  }
  
   /* complete constructor */
  public Particle(float x, float y, float z, float mass0, int c0, int c1, int c2, int r0)
  {
    pos = new Position(x,y,z);
    oldPos = new Position(x,y,z);
    
    /* sets default acceleration, mass and force */
    accel = new Vector(0,0,0);
    force = new Vector(0,0,0);
    if(RAND_START_SPEED)
      speed = new Vector(random(-1,1),random(-1,1),random(-1,1));
    else
      speed = new Vector(0,0,0);
    /* sets the mass */
    mass = mass0;
    
    /*sets the colour */
    colour[0]=c0;
    colour[1]=c1;
    colour[2]=c2;
    radius=r0;
    

  }
  
  /* for updating the position, speed, accleration, etc of the particle */
  public void updateP()
  {
    oldPos.x = pos.x;
    oldPos.y = pos.y;
    oldPos.z = pos.z;
    Vector gravity;
    if(FLOOR)
    {
      gravity = new Vector(0,-2,0);
    }
    else
    {
      gravity = new Vector(0,0,0);
    }
    Vector aux = new Vector(0,0,0);
    force = gravity.get();
    
    for(int i=0 ; i < NUMBER_OF_PARTICLES ; i++)
    {
      if(i!=myNumber)
      {
        if(pos.distance(particleList[i].getPosition())>radius*1.2 && particleList[i].getPosition().distance(pos)>particleList[i].getRadius()*1.2)
        {
        aux = pos.aTob(particleList[i].getPosition());
        if(aux.norm()!=0)        
          aux.scale(((particleList[i].getMass())/sq(aux.norm()))/GRAVITY_DIVISOR);
        force = force.addVector(aux);
        }
        
        if(detectCollision(particleList[i]))
        {
          receiveForce(particleList[i]);
          particleList[i].receiveForce(this);
        }
      }
    }
    
    aux = force.get();
    aux.scale(1/mass);
    accel = aux.get();
    
    speed = speed.addVector(accel);
    
    pos = pos.addVector(speed);
     if(WALLS)
     {
      if(pos.y > wallY || pos.y < 0)
      {
        speed.y = -speed.y;
      }
      if(pos.x > wallX || pos.x < 0)
      {
        speed.x = -speed.x;
      }
      if(pos.z > wallZ || pos.z < 0)
      {
        speed.z = -speed.z; 
      }
    }
    if(FLOOR)
    {
      if(pos.y < FLOOR_POS)
      {
        speed.y = -speed.y;
      }
    }  
  }
  /* detects a collision between this particle and particle p0 */
  public boolean detectCollision(Particle p0)
  {
     int k = 1;
     float e = 1/k;
     
     Vector fromMe = pos.aTob(p0.getPosition());
     Vector toMe = p0.getPosition().aTob(pos);

     float alpha = radius/fromMe.norm();
     alpha/=2;

     
     float beta = p0.getRadius()/toMe.norm();
     beta/=2;
     
     if(VERBOSE_COLLISION)
     {
       strokeWeight(1);
       stroke(255);
       line(pos.x,pos.y,pos.z,pos.x+fromMe.x,pos.y+fromMe.y,pos.z+fromMe.z); 
     }
     
     fromMe.scale(alpha);
     
     toMe.scale(beta);
     
     float diffX = (pos.x + fromMe.x) - (p0.getPosition().x + toMe.x);
     float diffY = (pos.y + fromMe.y) - (p0.getPosition().y + toMe.y);
     float diffZ = (pos.z + fromMe.z) - (p0.getPosition().z + toMe.z);
     diffX = abs(diffX);
     diffY = abs(diffY);
     diffZ = abs(diffZ);
     if(VERBOSE_COLLISION)
     {
       strokeWeight(1);
       stroke(255,255,255);
       line(p0.getPosition().x,p0.getPosition().y,p0.getPosition().z,p0.getPosition().x+(toMe.x*beta),p0.getPosition().y+(toMe.y*beta),p0.getPosition().z+(toMe.z*beta));
       strokeWeight(1);
       stroke(255,255,255);
       line(pos.x,pos.y,pos.z,pos.x+(fromMe.x*alpha),pos.y+(fromMe.y*alpha),pos.z+(fromMe.z*alpha));
       println(diffX);
       println(",");
       println(diffY);
       println(",");
       println(diffZ);
       println("---");
     }
     Vector s0 = p0.getSpeed();
     Vector s1 = getSpeed();
     
     boolean retValue = false;
     
     
     for(int i=0 ; i < k ; i++)
     {
       for(int j=0 ; j < k ; j++)
       {
       Vector s0t = s0.get();
       Vector s1t = s1.get();
       s0t.scale(i/k);
       s1t.scale(j/k);
       Position pos1 = new Position(pos.x+s1t.x + fromMe.x,pos.y+s1t.y + fromMe.y, pos.z+s1t.z + fromMe.z);
       Position pos2 = new Position(p0.getPosition().x+s0t.x + toMe.x,p0.getPosition().y+s1t.y + toMe.y,p0.getPosition().z+s1t.z + toMe.z);
       
      if(pos1.distance(pos2)<e && pos.distance(p0.getPosition())<oldPos.distance(p0.getOldPos()))
     {
       if(VERBOSE_COLLISION)
       {
         strokeWeight(1);
         stroke(130,255,255);
         line(pos.x,pos.y,pos.z,pos.x+pos.aTob(p0.getPosition()).x,pos.y+p0.getPosition().aTob(pos).y,pos.z+p0.getPosition().aTob(pos).z);
         println("Detected!");
       }  
       retValue =  true;
     }
     else
     {
       retValue =  false;
     }
       }
     }
     
     return retValue;

  }
  
  
  
  /* collides with particle p, receiving its momentum and giving it too */
  public void receiveForce(Particle p)
  {

    Vector s0 = p.getSpeed();
    Vector s1 = speed.get();
    float m0 = p.getMass();
    float m1 = mass;
    
    s0.x = ((m0-m1)*s0.x)/(m0+m1);
    s0.y = ((m0-m1)*s0.y)/(m0+m1);
    s0.z = ((m0-m1)*s0.z)/(m0+m1);
    s1.x = ((2*m0)*s0.x)/(m0+m1);
    s1.y = ((2*m0)*s0.y)/(m0+m1);
    s1.z = ((2*m0)*s0.z)/(m0+m1);

    s0.scale(-1.8);
    s1.scale(-1.8);
    p.setSpeed(s0);
    setSpeed(s1);
    p.setPosition(p.getOldPos());
    pos = oldPos;
  }
  
  public int getRadius()
  {
    return radius;
  }
  
  Position getColour()
  {
     return new Position(colour[0],colour[1],colour[2]); 
  }
  
  
  /* for drawing the particle on screen */
  public void drawP()
  {


    
    if(SHOW_ACCEL_VECTOR)
    {
      strokeWeight(1);
      stroke(200,20,255,255);
      line(pos.x,pos.y,pos.z,pos.x+accel.x*15,pos.y+accel.y*15,pos.z+accel.z*15);
    }
    if(SHOW_SPEED_VECTOR)
    {
      strokeWeight(1);
      stroke(255,255,255,255);
      line(pos.x,pos.y,pos.z,pos.x+speed.x*20,pos.y+speed.y*20,pos.z+speed.z*20);
    }
    if(SHOW_FORCE_VECTOR)
    {
      strokeWeight(1);
      stroke(150,255,255,255);
      line(pos.x,pos.y,pos.z,pos.x+force.x*60,pos.y+force.y*60,pos.z+force.z*60);      
    }
    
    fill(colour[0],colour[1],colour[2]);
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    noStroke();
    sphere(radius);
    popMatrix();
    
  }
  
  /* one function for updating and drawing */
  public void updateAndDrawP()
  {
    updateP();
    drawP();     
  }
  
  /* returns the mass, as a float */
  public float getMass()
  {
    return mass;
  }
  
  public Vector getSpeed()
  {
    return speed.get(); 
  }
  
  public void setSpeed(Vector s0)
  {
    speed = s0.get();
  }
  
  /* adds the Vector s0 to the position */
  public void setPosition(Position s0)
  {
    pos = s0;
  }
  
  /* returns the position, as a Position object */
  public Position getPosition()
  {
    return pos;
  }
  
  public Position getOldPos()
  {
   return oldPos; 
  }
}

int fillRate =120;
void fade()
{
  fill(0,fillRate);
  noStroke();
  quad(0,0,width,0,width,height,0,height); 
  if(mousePressed && mouseX < 25)
  {
    fillRate = mouseY/5;
  }
  strokeWeight(width/50);
  stroke(255);
  point(0,fillRate*5);
}


void keyPressed()
{
  setup();
}

void setup()
{  
    background(0);
    size(SIZE_X, SIZE_Y,P3D);
    strokeWeight(1);
    stroke(255); 
    colorMode(HSB);
    smooth(0);
    float mass;

    for(int i=0 ; i < NUMBER_OF_PARTICLES ; i++)
    {
       mass = random(minMass,maxMass);
       if(i<5)
       {
           particleList[i] = new Particle(random(-80,80),random(-80,80),random(-80,80),mass,
           255,0,255,
           (int)(((mass-minMass)/(maxMass-minMass))*maxSize)); 
           particleList[i].myNumber = i;
       }
       else
       {
          if(IS_COLORFUL)
          {
           particleList[i] = new Particle(random(-80,80),random(-80,80),random(-80,80),mass,
           (int)(((mass-minMass)/(maxMass-minMass))*255),120,255,
           (int)(((mass-minMass)/(maxMass-minMass))*maxSize)); 
           particleList[i].myNumber = i;
          }
          else
          {
           particleList[i] = new Particle(random(-80,80),random(-80,80),random(-80,80),mass,
           (int)(((mass-minMass)/(maxMass-minMass))*255),
           0,255,(int)(((mass-minMass)/(maxMass-minMass))*maxSize)); 
           particleList[i].myNumber = i;
          }
       }
      
    }
    


}
int k=128;
void draw()
{ 
  perspective(radians(90),float(width)/float(height),8,800);
  lightFalloff(0,.08,0);
  background(0);
  //pointLight(255,0,255,0,0,0);

  if(FLOOR)
  {
      k = (k+(int)random(1,2))%256;
      fill(k,250,100);
      pushMatrix();
      translate(0,FLOOR_POS,0);
      pointLight(k,250,100,0,FLOOR_POS,0);
      box(500,1,500);
      popMatrix();
  }
    //lights();
    println(frameRate);
    camera(-mouseX+width/2, -mouseY+height/2, 80, 0, 0, 0, 0, -1, 0);
   
     
    //camera(particleList[1].getPosition().x, particleList[1].getPosition().y, particleList[1].getPosition().z, 0, 0, 0, particleList[1].getSpeed().x, particleList[1].getSpeed().y, particleList[1].getSpeed().z);
    pointLight(255,0,255,particleList[0].getPosition().x,particleList[0].getPosition().y-particleList[0].getRadius(),particleList[1].getPosition().z);
    pointLight(255,0,255,particleList[1].getPosition().x,particleList[1].getPosition().y,particleList[1].getPosition().z);
    pointLight(255,0,255,particleList[2].getPosition().x,particleList[2].getPosition().y,particleList[2].getPosition().z);
    pointLight(255,0,255,particleList[3].getPosition().x,particleList[3].getPosition().y,particleList[3].getPosition().z);
    pointLight(255,0,255,particleList[4].getPosition().x,particleList[4].getPosition().y,particleList[4].getPosition().z);
    pointLight(255,0,255,particleList[5].getPosition().x,particleList[5].getPosition().y,particleList[5].getPosition().z);
    pointLight(255,0,255,particleList[6].getPosition().x,particleList[6].getPosition().y,particleList[6].getPosition().z);
    for(int i=0 ; i < NUMBER_OF_PARTICLES ; i++)
    {
      noStroke();
      if(i<7)
      {
        emissive(particleList[i].getColour().x,particleList[i].getColour().y,particleList[i].getColour().z);
      }
      else
      {
        emissive(0,0,0);
      }
      ambient(128,255,255);
      specular(particleList[i].getColour().x,particleList[i].getColour().y,particleList[i].getColour().z);
      shininess(0.5);
     particleList[i].updateAndDrawP(); 
    }
    //box(10);
    //fade();
    
    //scroll();
}

