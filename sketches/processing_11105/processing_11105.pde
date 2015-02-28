

// animals

class Predator
{
  Tail m_tail = null;
  Boid m_boid = null;
  boolean m_seeking;
  PVector m_prevSteerForce;
  PVector c1;
  
  public Predator( PVector pos, int strength)
  {
    m_boid = new Boid(pos, strength);
    m_tail = new Tail( m_boid.position,1,5);
    m_seeking=false;
    m_prevSteerForce = new PVector(0.,0.,0.);  
    c1 = new PVector( random(0.6,1),random(0.2,0.8),random(0.0,0.4));
}
   boolean SeekMagicZone(PVector mpos)
   {
     m_seeking=true;
      m_prevSteerForce.add(m_boid.Seek(mpos) );
      if ( mpos.dist(m_boid.position) < m_boid.radius )  {
        if ( !m_tail.Empty())
        {
          m_tail.shrink();
          return true;
        }
      }
      return false;
   }
     Prey[] Update(Prey[] food, Predator[] others, float dt)
    { 
     PVector steerForce = new PVector();
    steerForce.set(m_prevSteerForce);
    
    if (!m_seeking)
    {
        float closestFood = 180.0f;
        int tIdx = -1;   
        for ( int i =0; i < food.length;i++)
        {
          Boid baby= food[i].m_boid;
          float d = m_boid.position.dist(baby.position);
           if ( d < closestFood)
           {
             tIdx = i;
             closestFood = d;           
           }
        }
        if ( tIdx != -1 && closestFood < (m_boid.radius+ food[tIdx].m_boid.radius))
        {
          // remove baby as it has been eaten and add to snake radius
          m_tail.grow();
          food[tIdx]=food[food.length-1];
          food=(Prey[])shorten(food);
        }
        else if ( tIdx !=-1)
        {
          PVector tpos = food[tIdx].m_boid.position;
          float r = food[tIdx].m_boid.radius;
          rect(tpos.x-r,tpos.y-r,r,r);
          steerForce.add(m_boid.Seek(food[tIdx].m_boid.position));
         
         
        }
        else  // just wander
        {
          PVector wander = m_boid.Wander( dt);//steeg_boid.steerForWander (dt);
          wander.mult(2.);
          wander.add(m_boid.steerForTargetSpeed (16.0));         
          steerForce.add(wander);
        }
    }
     
    Sensor whiskers = new Sensor(m_boid);
    for ( Predator p: others )
    {
      if (Overlap( p.m_tail.bmin, p.m_tail.bmax, whiskers.bmin,
                  whiskers.bmax))
        steerForce.add( Avoidance(m_boid, whiskers, p.m_tail.pts,0));
    }
    
    steerForce.add( handleBoundary(  m_boid));
     
    m_boid.Apply( steerForce, dt );
    m_tail.Update( m_boid.position);
    m_prevSteerForce.set(0,0,0);
    m_seeking=false;
    return food;
    }
    void Draw()
   {
      noFill();
     stroke(c1.x*255,c1.y*255,c1.z*255,128);
        m_boid.Draw();
     strokeWeight( (float)m_boid.radius);   
     m_tail.Draw();
   }
}
class Prey
{
  Tail m_tail = null;
  PVector c1,c2;
  public Boid m_boid = null;
  public Prey( PVector pos, float strength)
  {
    m_boid = new Boid(pos, strength);
    m_tail = new Tail( m_boid.position,3,4);
    c1 = new PVector( random(00.5),random(0.3,1),random(0.5,1));
  }
  void Update( PVector foePosition, float dt)
  {
     PVector wander = m_boid.Wander( dt);//steeg_boid.steerForWander (dt);
      wander.mult(1.);
      wander.add(m_boid.steerForTargetSpeed (4.0));      
                   
       float d = foePosition.dist(m_boid.position);
       if ( d < 150)
       {
         wander.mult(0.);
         wander.add( m_boid.Flee( foePosition ));
       }
       wander.add( handleBoundary(  m_boid));
      //wander.add(m_boid.Avoidance( lpts));
      m_boid.Apply( wander, dt );
      m_tail.Update( m_boid.position);
   }
     
  void Draw()
   {
     //fill(c1.x*255,c1.y*255,c1.z*255,128);
     noFill();
     stroke(c1.x*255,c1.y*255,c1.z*255,128);
      m_boid.Draw();    
     strokeWeight( (float)m_boid.radius);
     m_tail.Draw();
   }
}

