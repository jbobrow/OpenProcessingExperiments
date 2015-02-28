
ArrayList <Mover> mover = new ArrayList <Mover>();

ArrayList <Cell> cell = new ArrayList <Cell>();
ArrayList <Neutrophil> neutro = new ArrayList <Neutrophil>();

float k = 0.1; // controls the elasticity of the collisions, with 0 being inelastic, 1 being totally elastic
Mover moverI,moverJ;

float timer = 0;
float timerCap = 60;


float ballCount = 1;
float ballMassLow = 5;
float ballMassHigh = 10;

float moverCount = 1;
float moverMassLow = 15;
float moverMassHigh = 20;


void setup()
{
  //frameRate(24);
  size(400,400);
  background(255);


  //mover.add(new Cell(300,100,0,3,15));
  //mover.add(new Cell(300,500,0,-1,30));
  
  for (int i = 0; i < ballCount;i++)
  {
   mover.add(new Cell(random(0,width),random(0,height),0.1,0,random(ballMassLow,ballMassHigh))); // xpos, ypos, xvelo, yvelo, mass

  }
  
  for (int i = 0; i < moverCount; i++)
  {
    mover.add(new Neutrophil(random(0,width),random(0,height),0,0,random(moverMassLow,moverMassHigh)));
    //mover.add(new Neutrophil(300,300,3,3,30));
  }
 
 //checkForOverlap(); 
}

void draw()
{
  for (int i = 0; i < mover.size();i++)
    {
      if (mover.get(i).myType == 2)
      {
        
       moverI = (Mover) mover.get(i);
       moverI.upTimer();
      }

    } 
  
  
  background(255);
  //fill(255,200);
  //rect(0,0,width,height);
  
  frame.setTitle(int(frameRate) + " fps");

  for (int i = 0;i< mover.size(); i++)
  {
   mover.get (i).render();
  }


  for (int i = 0; i < mover.size();i++)
  {

    moverI = (Mover) mover.get(i);
    
    PVector friction = moverI.velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(0.1);

    moverI.applyForce(friction);

    for (int j = 0; j <mover.size();j++)
    {
      moverJ = (Mover) mover.get(j);
      if (i != j)
      {
        PVector P = PVector.sub(moverJ.location,moverI.location);
        float d = P.mag();
        
        if (d<=(moverI.mass+moverJ.mass))
        {
           P.normalize();                          // parallel vector in collision direction
                  // set back both balls along collision direction so that they are just touching again
                  // Use their speed as "weighening" of this shift
            
            d -= (moverI.mass+moverJ.mass);
            float n = moverI.velocity.mag()+moverJ.velocity.mag();
            moverI.location.add(PVector.mult(P,d*moverI.velocity.mag()/(n)));
            moverJ.location.add(PVector.mult(P,-1*d*moverJ.velocity.mag()/(n)));

            // calculate speed components along and normal to collision direction
            PVector N = new PVector(P.y,P.x*(-1),0);
            float vp1 = moverI.velocity.dot(P);
            float vn1 = moverI.velocity.dot(N);
            float vp2 = moverJ.velocity.dot(P);
            float vn2 = moverJ.velocity.dot(N);
            
            float vp1_after=0;
            float vp2_after=0;
            
            //calculate collision               
            vp1_after = (-1)*(sqrt(k)*moverJ.mass*abs(vp1-vp2)-moverI.mass*vp1-moverJ.mass*vp2)/(moverI.mass+moverJ.mass);
            vp2_after =      (sqrt(k)*moverI.mass*abs(vp1-vp2)+moverI.mass*vp1+moverJ.mass*vp2)/(moverI.mass+moverJ.mass);
            
            moverI.velocity = PVector.add(PVector.mult(P,vp1_after),PVector.mult(N,vn1));
            moverJ.velocity = PVector.add(PVector.mult(P,vp2_after),PVector.mult(N,vn2));
        }
      }
    }

    mover.get (i).checkEdges();
    mover.get (i).update();
    mover.get (i).render();
  }
  

}

void checkForOverlap()
{
  
  for (int i = cell.size()-1; i >= 0; i--)
  {
    for (int j = cell.size()-1; j >= 0; j--)
    {
      if (i != j)
      {
        if (dist(cell.get (i).location.x,cell.get (i).location.y,cell.get (j).location.x,cell.get (j).location.y) < (cell.get (i).mySize + cell.get (j).mySize)/2 )
        {
          //cell.get (i).changeFill();
          mover.remove(i);
          cell.remove(i);
          break;
        }
      }
    }
  }  
  
  for (int i = 0; i < neutro.size(); i++)
  {
    for (int j = cell.size()-1; j >= 0; j--)
    {
        if (dist(neutro.get (i).location.x,neutro.get (i).location.y,cell.get (j).location.x,cell.get (j).location.y) < (neutro.get (i).mySize + cell.get (j).mySize)/2 )
        {
          //cell.get (i).changeFill();
          mover.remove(j);
          cell.remove(j);
        }
    }
  }
  
}

class Cell extends Mover
{
  
  Cell(float xpos, float ypos, float xvelo, float yvelo, float inputmass)
  {
    super(xpos,ypos,xvelo,yvelo,inputmass);
    myType = 1;
  }
}
class Mover  {
  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;
  float mySize, timerCap, timer;
  int myType;
  
  Mover(float xpos, float ypos, float xvelo, float yvelo, float inputmass)  
      {
        
        location = new PVector(xpos, ypos);
        velocity = new PVector(xvelo,yvelo);
        acceleration = new PVector(0,0);
        mass = inputmass;
        mySize = mass*2;
        myType = 0;
      }
  
  void applyForce(PVector force)  {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);

  }
  
  void render()  
      {
        noStroke();
        fill(0);
        //fill(random(0,255),random(0,255),random(0,255));
        ellipse(location.x, location.y,mySize,mySize);
      }
  
  void checkEdges()  {
    
    if (location.x >= width)
    {
     velocity.x *= -1; 
    location.x = width;
    }
    
    if (location.x <= 0)
    {
     velocity.x *= -1;
    location.x = 0;
    }
    
    if (location.y >= height)
    {
     velocity.y *= -1;
    location.y = height;
    }
    
    if (location.y <= 0)
    {
     velocity.y *= -1;
     location.y =0;
    }
  }
  
  void update()  
    {
      velocity.add(acceleration);
      //velocity = constrain(velocity,0,5);
      velocity.limit(8);
      location.add(velocity);
      acceleration.mult(0);
    }
  
  void upTimer()
  {
  }
}
class Neutrophil extends Mover
{

  float timerCap;
  float timer;
  
  Neutrophil(float xpos, float ypos, float xvelo, float yvelo, float inputmass)
  {
    super(xpos,ypos,xvelo,yvelo,inputmass);
//    location = new PVector(xpos,ypos);
//    velocity = new PVector(xvelo,yvelo);
//    mass = inputmass;
    myType = 2;
    timerCap = random(4,12);
    timer = 4;
  }
  
  void render()
  {
    fill(255,0,0);
    ellipse(location.x,location.y,mySize,mySize);
  }
  
  void upTimer()
  {
   timer++; 
   
   if (timer > timerCap)
   {
     changeDirection();
     timer = 0;
     
   }
  }
  
  void changeDirection()
  {
         PVector f = new PVector(random(-90,90),random(-90,90));
         applyForce(f);

  }
  
}


