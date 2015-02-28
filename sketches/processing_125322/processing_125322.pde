
boolean  SHOW_SPEED_VECTOR = false;
boolean  SHOW_ACCEL_VECTOR = false;
boolean  SHOW_FORCE_VECTOR = false;
boolean  WALLS = true;
boolean  IS_P2D = false;
boolean  IS_COLORFUL = true;
boolean  FAST_MODE = true;
boolean  SOLO = false;
boolean  RAND_START_SPEED= true;
boolean  VERBOSE_COLLISION = false;

int      maxSize = 5;
float    minMass=0.5;
float    maxMass=25;
float    GRAVITY_DIVISOR=70;

int      SIZE_X = 640;
int      SIZE_Y = 480;

int      SPAWN_X0 = (int)(4*SIZE_X/10);
int      SPAWN_X1 = (int)(6*SIZE_X/10);
int      SPAWN_Y0 = (int)(4*SIZE_Y/10);
int      SPAWN_Y1 = (int)(6*SIZE_Y/10);

int      NUMBER_OF_PARTICLES = 25;


Particle particleList[] = new Particle[NUMBER_OF_PARTICLES];

/* represents a vector */
class Vector
{
  public float x;
  public float y;
  
  public Vector(float x0, float y0)
  {
    x = x0;
    y = y0;
  }
  
  /* returns a normalized version of the vector */
  public Vector normalize()
  {
     float norm = norm();
     return new Vector(x/norm,y/norm);
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
    return new Vector(x+v.x,y+v.y);
  }
  
  /* returns the norm of the vector */
  public float norm()
  {
    return sqrt(sq(x)+sq(y));
  }
  
  /* prints the vector */
  public void print()
  {
     println("Vector:(" + x + "," + y + ")"); 
  }
  
  /* scales the vector */
  public void scale(float w)
  {
    x*=w;
    y*=w; 
  }
  
  /* returns the vector, used to copy it */
  public Vector get()
  {
    return new Vector(x,y); 
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
  public float x;
  public float y;
  
  public Position(float x0, float y0)
  {
    x = x0;
    y = y0;
  }
  
  /* adds a vector to the position */
  public Position addVector(Vector v)
  {
    return new Position(x+=v.x,y+=v.y);
    
  }
  
  /* gets the vector that goes from pa to pb */
  public Vector aTob(Position pb)
  {
    return new Vector(pb.x - x,pb.y - y);
  }
  
  /* prints the position */
  public void print()
  {
     println("Position:(" + x + "," + y + ")"); 
  }
  
  /* returns the distance between this position and another, as float */
  public float distance(Position p0)
  {
      return sqrt(sq(p0.x-x)+sq(p0.y-y));
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
  public Particle(float x, float y)
  {
    pos = new Position(x,y);
    oldPos = new Position(x,y);
    
    /* sets default acceleration, mass and force */
    accel = new Vector(0,0);
    force = new Vector(0,0);
    speed = new Vector(0,0);
    mass = 1;
    
    /*sets default colour */
    colour[0]=0;
    colour[1]=0;
    colour[2]=255;
    radius=1;
    

  }
  
   /* complete constructor */
  public Particle(float x, float y, float mass0, int c0, int c1, int c2, int r0)
  {
    pos = new Position(x,y);
    oldPos = new Position(x,y);
    
    /* sets default acceleration, mass and force */
    accel = new Vector(0,0);
    force = new Vector(0,0);
    if(RAND_START_SPEED)
      speed = new Vector(random(-1,1),random(-1,1));
    else
      speed = new Vector(0,0);
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
    Vector gravity = new Vector(0,0);
    Vector aux = new Vector(0,0);
    force = gravity.get();
    if(SOLO && myNumber == 0)
    {
       radius = 5;
       force = pos.aTob(new Position(mouseX,mouseY));
       colour[0] = 255;
       colour[1] = 255;
       colour[2] = 150; 
       mass = 10;
    }
    
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
      if(pos.y > height || pos.y < 0)
      {
        speed.y = -speed.y;
      }
      if(pos.x > width || pos.x < 0)
      {
        speed.x = -speed.x;
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
       line(pos.x,pos.y,pos.x+fromMe.x,pos.y+fromMe.y); 
     }
     
     fromMe.scale(alpha);
     
     toMe.scale(beta);
     
     float diffX = (pos.x + fromMe.x) - (p0.getPosition().x + toMe.x);
     float diffY = (pos.y + fromMe.y) - (p0.getPosition().y + toMe.y);
     diffX = abs(diffX);
     diffY = abs(diffY);
     if(VERBOSE_COLLISION)
     {
       strokeWeight(1);
       stroke(255,255,255);
       line(p0.getPosition().x,p0.getPosition().y,p0.getPosition().x+(toMe.x*beta),p0.getPosition().y+(toMe.y*beta));
       strokeWeight(1);
       stroke(255,255,255);
       line(pos.x,pos.y,pos.x+(fromMe.x*alpha),pos.y+(fromMe.y*alpha));
       println(diffX);
       println(",");
       println(diffY);
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
       Position pos1 = new Position(pos.x+s1t.x + fromMe.x,pos.y+s1t.y + fromMe.y);
       Position pos2 = new Position(p0.getPosition().x+s0t.x + toMe.x,p0.getPosition().y+s1t.y + toMe.y);
       
      if(pos1.distance(pos2)<e && pos.distance(p0.getPosition())<oldPos.distance(p0.getOldPos()))
     {
       if(VERBOSE_COLLISION)
       {
         strokeWeight(1);
         stroke(130,255,255);
         line(pos.x,pos.y,pos.x+pos.aTob(p0.getPosition()).x,pos.y+p0.getPosition().aTob(pos).y);
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
    s1.x = ((2*m0)*s0.x)/(m0+m1);
    s1.y = ((2*m0)*s0.y)/(m0+m1);

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
  
  
  /* for drawing the particle on screen */
  public void drawP()
  {

    Position rest = new Position(pos.x%1,pos.y%1);
    Position round = new Position(pos.x-rest.x,pos.y-rest.y);
    
    if(SHOW_ACCEL_VECTOR)
    {
      strokeWeight(1);
      stroke(200,20,255,255);
      line(pos.x,pos.y,pos.x+accel.x*15,pos.y+accel.y*15);
    }
    if(SHOW_SPEED_VECTOR)
    {
      strokeWeight(1);
      stroke(255,255,255,255);
      line(pos.x,pos.y,pos.x+speed.x*1,pos.y+speed.y*1);
    }
    if(SHOW_FORCE_VECTOR)
    {
      strokeWeight(1);
      stroke(150,255,255,255);
      line(pos.x,pos.y,pos.x+force.x*2,pos.y+force.y*2);      
    }
    
    
    strokeWeight(radius);
    
    if(FAST_MODE)
    {
      stroke(colour[0],colour[1],colour[2],255);
      point(pos.x,pos.y);
    }
    else
    {  
      stroke(colour[0],colour[1],colour[2],255*(1-rest.x)*(1-rest.y));
      line(oldPos.x,oldPos.y,round.x,round.y);
    
      stroke(colour[0],colour[1],colour[2],255*rest.x*(1-rest.y));
      line(oldPos.x,oldPos.y,round.x+1,round.y);
    
      stroke(colour[0],colour[1],colour[2],255*rest.x*rest.y);
      line(oldPos.x,oldPos.y,round.x+1,round.y+1);
    
      stroke(colour[0],colour[1],colour[2],255*(1-rest.x)*rest.y);
      line(oldPos.x,oldPos.y,round.x,round.y+1);
    }    
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

int fillRate =60;
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
    if(IS_P2D)
    {
      size(SIZE_X, SIZE_Y,P2D);//use P2D for more speed, no browser support.
    }
    else
    {
      size(SIZE_X, SIZE_Y,P2D);
    }
    strokeWeight(1);
    stroke(255); 
    colorMode(HSB);
    float mass;

    for(int i=0 ; i < NUMBER_OF_PARTICLES ; i++)
    {
       mass = random(minMass,maxMass);
      
      if(IS_COLORFUL)
      {
       particleList[i] = new Particle(random(SPAWN_X0,SPAWN_X1),random(SPAWN_Y0,SPAWN_Y1),mass,
       (int)(((mass-minMass)/(maxMass-minMass))*255),
       120,255,(int)(((mass-minMass)/(maxMass-minMass))*maxSize)); 
       particleList[i].myNumber = i;
      }
      else
      {
       particleList[i] = new Particle(random(0,width),random(0,height),mass,
       (int)(((mass-minMass)/(maxMass-minMass))*255),
       0,255,(int)(((mass-minMass)/(maxMass-minMass))*maxSize)); 
       particleList[i].myNumber = i;
      }
      
    }
    


}

void draw()
{  
background(0);
    //println(frameRate);
    for(int i=0 ; i < NUMBER_OF_PARTICLES ; i++)
    {
     particleList[i].updateAndDrawP(); 
    }
    //fade();
    
    //scroll();
}
