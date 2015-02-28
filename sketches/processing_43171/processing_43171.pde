
// 2011 Tim Hutton <tim.hutton@gmail.com> - http://www.sq3.org.uk

// A model of oil-water phase separation
// Based on Naoaki Ono's PhD thesis

final int R = 6;

final float STRONG_FORCE_RANGE = 10*R;
final float MEDIUM_FORCE_RANGE = 3*R;

final float STRONG_FORCE_MAGNITUDE = 0.02;
final float MEDIUM_FORCE_MAGNITUDE = 0.1;

final int WATER = 0;
final int HYDROPHOBIC = 1;

final float MAX_SPEED = 0.3*R;

Atom[] atoms;
int N_ATOMS;

void setup()
{
  size(500,500,P2D); // change the size of the world here
  
  N_ATOMS = width * height / ( R * 70 );
  atoms = new Atom[N_ATOMS];
  for(int i=0;i<N_ATOMS;i++)
  {
    switch(i%5) {
      default: atoms[i] = new Atom(WATER); break;
      case 0: atoms[i] = new Atom(HYDROPHOBIC); break;
    }
  }
  noStroke();
}

void draw()
{
  // update the positions
  recomputeAccelerations();
  recomputeVelocities();
  recomputePositions();
  // draw
  background(255,255,255);
  for(int i=0;i<N_ATOMS;i++)
    atoms[i].drawAtom();
  // draw the mouse-controlled water atom
  fill(color(0,0,255));
  ellipse(mouseX,mouseY,max(4,R),max(4,R));
}

void recomputeAccelerations()
{
  for(int i=0;i<N_ATOMS;i++)
    atoms[i].acceleration.x = atoms[i].acceleration.y = 0;

  float d,f;    
  PVector force,to;
  for(int i=0;i<N_ATOMS;i++)
  {
    for(int j=i+1;j<N_ATOMS;j++)
    {
      to = PVector.sub(atoms[i].position,atoms[j].position);
      d = to.mag();
      
      // apply repulsion forces between this pair of atoms
      if(d<STRONG_FORCE_RANGE)
      {    
        if( (atoms[i].type == WATER && atoms[j].type == HYDROPHOBIC) ||
            (atoms[i].type == HYDROPHOBIC && atoms[j].type == WATER) )
        {
          // strong repulsion
          f = repulsion_force(STRONG_FORCE_RANGE,d,STRONG_FORCE_MAGNITUDE);
        }
        else
        {
          // medium repulsion
          f = repulsion_force(MEDIUM_FORCE_RANGE,d,MEDIUM_FORCE_MAGNITUDE);
        }
        force = PVector.mult(to,f);
        atoms[i].acceleration.add(force);
        atoms[j].acceleration.sub(force);
      }
    }
    
    // atoms are repelled by the walls
    for(int wall_test=0;wall_test<4;wall_test++)
    {
      // pretend there's a water atom at the nearby wall, repelling us
      PVector wall;
      switch(wall_test) {
        default:
        case 0: wall = new PVector(0,atoms[i].position.y); break;
        case 1: wall = new PVector(width,atoms[i].position.y); break;
        case 2: wall = new PVector(atoms[i].position.x,0); break;
        case 3: wall = new PVector(atoms[i].position.x,height); break;
      }
      to = PVector.sub(atoms[i].position,wall);
      switch(atoms[i].type) {
        case WATER: f = repulsion_force(MEDIUM_FORCE_RANGE,to.mag(),MEDIUM_FORCE_MAGNITUDE); break;
        default: f = repulsion_force(STRONG_FORCE_RANGE,to.mag(),STRONG_FORCE_MAGNITUDE); break;
      }
      atoms[i].acceleration.add(PVector.mult(to,f));
    }
    
    // the mouse cursor acts as another water molecule
    to = PVector.sub(atoms[i].position,new PVector(mouseX,mouseY));
    d = to.mag();
    if(d<STRONG_FORCE_RANGE)
    {    
      if( atoms[i].type == HYDROPHOBIC )
      {
        // strong repulsion
        f = repulsion_force(STRONG_FORCE_RANGE,d,STRONG_FORCE_MAGNITUDE);
      }
      else
      {
        // medium repulsion
        f = repulsion_force(MEDIUM_FORCE_RANGE,d,MEDIUM_FORCE_MAGNITUDE);
      }
      force = PVector.mult(to,f);
      atoms[i].acceleration.add(force);
    }

  }
}

void recomputeVelocities()
{
  for(int i=0;i<N_ATOMS;i++)
  {
    atoms[i].velocity.add(atoms[i].acceleration);
    atoms[i].velocity.limit(MAX_SPEED);
  }
}

void recomputePositions()
{
  for(int i=0;i<N_ATOMS;i++)
  {
    atoms[i].position.add(atoms[i].velocity);
    if(atoms[i].position.x<0) atoms[i].position.x = MEDIUM_FORCE_RANGE;
    if(atoms[i].position.x>width) atoms[i].position.x = width-MEDIUM_FORCE_RANGE;
    if(atoms[i].position.y<0) atoms[i].position.y = MEDIUM_FORCE_RANGE;
    if(atoms[i].position.y>height) atoms[i].position.y = height-MEDIUM_FORCE_RANGE;
  }
}

float repulsion_force(float range,float d,float magnitude)
{
  d = max(d,0.1);
  if(d<range)
    return magnitude * ( range / d - 1 );
  else
    return 0;
}

// -------------------------- Atom -----------------------------

class Atom 
{
  public PVector position,velocity,acceleration;
  public int type;
  
  public Atom(int t)
  {
    position = new PVector(random(width),random(height));
    velocity = new PVector(random(-3,3),random(-3,3));
    acceleration = new PVector();
    type = t;
  }
  
  public void drawAtom()
  {
    switch(type) {
      case WATER: fill(color(0,0,255)); break;
      case HYDROPHOBIC: fill(color(255,0,0)); break;
      default: fill(color(255,0,255)); break;
    }
    ellipse(position.x,position.y,max(4,R),max(4,R));
  }
  
}



