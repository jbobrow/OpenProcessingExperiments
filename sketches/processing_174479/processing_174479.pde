


int size             = 1000;
int fps              = 30;
int num              = 0; 
float G              = 0.2;
float threshold      = 10.0; 
float brightness     = 5.0; 

boolean initialSpin  = false;
boolean showQuads    = false;
boolean running      = true;
boolean useFast = true;

ArrayList<Particle> particles = new ArrayList<Particle>(num);




void setup()
{ 
  smooth();
  size(1024,768); 
 // size(2560,1440);
 // size(2560,720);   
  noStroke();
  frameRate(fps);
  
  addParticles(
    num, // how many
    new PVector(840, 450), // where
    size/2, // spread
    0 // tangential velocity
  ); 
}

void draw()
{
    background(0,0,0);
    
    if(useFast){
      drawFast();
    }
    
    deleteP();
    
    
   
}

void mouseClicked()
{
  if (mouseEvent.getClickCount() == 2)
    addParticles(
      1000, 
      new PVector(mouseX, mouseY), 
      20,
      0     
    );
}

void drawFast()
{
  QNode root = new QNode(null, new PVector(-2*size, -2*size), 5*size);

  for (Particle p : particles)
  {
    if (!root.contains(p))
      continue;
      
    root.insert(p);
    
    fill(255,255,255,100);
    ellipse((int)p.itsPos.x, (int)p.itsPos.y,2,2); 
      
  
        
  }
  
      
  


  if (running)
  {
    
    
    for (Particle p : particles)
    {
      root.updateForces(p);
      p.move(); 
    }
   
   
    
   
  }
}


void addParticles(int howMany, PVector where, float spread, float tangentialVelocity)
{
  int[] rand = new int[]{255, 0, 0};
  for (int i = 0; i < howMany; i++)
  {
    float theta      = random(0, 2*PI);
    float cosine     = cos(theta);
    float sine       = sin(theta);

    PVector position = new PVector(where.x, where.y);
    PVector displace = new PVector(cosine, sine); 
    PVector velocity = PVector.mult(new PVector(-displace.y, displace.x), tangentialVelocity);

    displace.mult(random(0, spread));
    position.add(displace);

    particles.add(new Particle(random(starmass(), 2), rand, position, velocity));

  }



}

int starmass(){
  return -4;
}

void deleteP(){
  if(particles.size()>20000){
       for(int i =0; i<100; i++){
          particles.remove(i);    
      }
  }
}

//////////////////////////////////////////////////////////////////////

class Particle
{
  float itsMass;
  int itsColor[];
  PVector itsPos;
  PVector itsVel;

  Particle(float itsMass, int itsColor[], PVector itsPos, PVector itsVel)
  {
    this.itsMass  = itsMass;
    this.itsColor = itsColor;
    this.itsPos   = itsPos;
    this.itsVel   = itsVel;
  }

  void move()
  {
    
    this.itsPos.add(this.itsVel);
     
    if(this.itsPos.y > height){
      this.itsPos.y -= height;
    }
    else if(this.itsPos.y < 0){
      this.itsPos.y += height;
    }
    else if(this.itsPos.x > width){
      this.itsPos.x -= width;
    }
    else if(this.itsPos.x < 0){
      this.itsPos.x += width;
    }
    
  }


  float x()
  {
    return this.itsPos.x;
  }

  float y()
  {
    return this.itsPos.y;
  }
}
///////////////////////////////////////////////////////////////////////////////

class QNode
{
  
  Particle itsParticle;
  float itsMass;

  PVector itsTopleft;
  float itsRegionLength;

  QNode nw, ne, sw, se;

  QNode(Particle p)
  {
    this.itsParticle = p;
    if (p != null)
      this.itsMass = p.itsMass;
  }

  QNode(Particle p, PVector tl, float length)
  {
    this.itsParticle = p;
    if (p != null)
      this.itsMass = p.itsMass;
    this.itsTopleft = tl;
    this.itsRegionLength = length;
  }

  void insert(Particle p)
  {

    if (this.itsParticle == null)
    {
      this.itsParticle = p;
      this.itsMass = p.itsMass;
    }
    else if (!this.isLeaf())
    {
      float M = this.itsMass + p.itsMass;
      this.itsParticle = 
        new Particle(M, null,
            new PVector(
              (this.itsParticle.x() * this.itsMass + p.x() * p.itsMass)/M,
              (this.itsParticle.y() * this.itsMass + p.y() * p.itsMass)/M
              ), null);

      this.itsMass = itsParticle.itsMass;

      // nw
      if (this.nw.contains(p)) this.nw.insert(p);

      // ne
      if (this.ne.contains(p)) this.ne.insert(p);

      // sw
      if (this.sw.contains(p)) this.sw.insert(p);

      // se
      if (this.se.contains(p)) this.se.insert(p);
    }
    else
    {
      this.subdivide();
      this.insert(p);
    }
  }

  void updateForces(Particle p)
  {
 
    if (this.itsParticle == p || this.itsParticle == null)
      return;

    float sd_ratio = this.itsRegionLength/p.itsPos.dist(this.itsParticle.itsPos);

    if (this.isLeaf() || sd_ratio <= threshold)
    {
      PVector v = PVector.sub(this.itsParticle.itsPos, p.itsPos);
      float r   = v.mag();
      float mag = (G*this.itsMass/(r*fps));

      v.normalize();
      v.mult(mag);
   

      p.itsVel.add(v);
    }
    else
    {
      this.nw.updateForces(p);
      this.ne.updateForces(p);
      this.sw.updateForces(p);
      this.se.updateForces(p);
    }
  }

  void subdivide()
  {
    float length = this.itsRegionLength/2;
    this.nw = new QNode(null, this.itsTopleft, length);
    this.ne = new QNode(null, new PVector(this.itsTopleft.x + length, this.itsTopleft.y), length);
    this.sw = new QNode(null, new PVector(this.itsTopleft.x, this.itsTopleft.y + length), length);
    this.se = new QNode(null, new PVector(this.itsTopleft.x + length, this.itsTopleft.y + length), length);
  }

  boolean isLeaf()
  {
    return (this.nw == null &&
        this.ne == null &&
        this.sw == null &&
        this.se == null);
  }

  boolean contains(Particle p)
  {
    return (p.x() >= this.itsTopleft.x && p.x() <= this.itsTopleft.x + this.itsRegionLength &&
        p.y() >= this.itsTopleft.y && p.y() <= this.itsTopleft.y + this.itsRegionLength);
  }
}
