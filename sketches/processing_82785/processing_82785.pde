
import java.util.*;

ParticleSystem physics;
ArrayList noche;
ArrayList estrellas;
PGraphics pg;
//lo copie de una imagen
color[] nochecol = {
0xFF0262D2,0xFF0070B7,0xFF253BF1,0xFF1279C4,0xFF0D81BE,0xFF02829D,0xFF0064E7,0xFF0873B9,0xFF1079BA,0xFF1879EA,0xFF005EA4,0xFF005ADC,0xFF1A53E0,0xFF1C64B6,0xFF009CBF,0xFF115CCF,0xFF0554D7,0xFF0066C7,0xFF2464D0,0xFF1183E3,0xFF3F86BE,0xFF0171C3,0xFF1C93D7,0xFF1775CC,0xFF1559D8,0xFF054F6B,0xFF032E75,0xFF0B447F,0xFF0D5993,0xFF153C83,0xFF004B72,0xFF085590,0xFF0133A3,0xFF01325B,0xFF155383,0xFF1A477E,0xFF033785,0xFF21537D,0xFF043D92,0xFF022F72,0xFF0E4680,0xFF046270,0xFF0C4774,0xFF134981,0xFF063B60,0xFF002870,0xFF385468,0xFF2C485E,0xFF2A4764,0xFF2F4A5F,0xFF2C4B66,0xFF2C4666,0xFF324556,0xFF294765,0xFF1D3447,0xFF243A58,0xFF30485C,0xFF273F5D,0xFF283F56,0xFF18353C,0xFF374F63,0xFF2F445B,0xFF203040,0xFF21374F};
color[] estrellacol  = {
0xFFFFFED7,0xFFFFE8C1,0xFFFFFED9,0xFFFFECD5,0xFFF9FCDE,0xFFFEFFD3,0xFFEAEBE1,0xFFF3FFD9,0xFFF0FFD1,0xFFF2F8BC,0xFFF2FFC5,0xFFFFF6B9,0xFFFCFFD9,0xFFF1FFD1,0xFFEEF4C0,0xFFF6FFC5,0xFFFEFFD1,0xFFFFF7BF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFDEC5,0xFFF8F9B5,0xFFFFF5BC,0xFFD3DE76,0xFFE0F7A7,0xFFF6CFA4,0xFFD1DE8E,0xFFFFFF8F,0xFFDFF471,0xFFF1FF97,0xFFECEF86,0xFFCDFF86,0xFFFBF265,0xFFFCE073,0xFFE8FC89,0xFFFFF16C,0xFFFDDDCE,0xFFFFEBA3,0xFFF1FFA5,0xFFE0E5A2,0xFFCEF8B6,0xFFD7FF83,0xFFF6FFBB,0xFFF4FFB4,0xFFFFFAB9,0xFFF8DD84,0xFFFFFC7D,0xFFFDD99B,0xFFF9E3B1,0xFFFFF4AA,0xFFFAE4B5,0xFFE4F3BA,0xFFF3FFBD,0xFFF5F7A4,0xFFF2FF7E,0xFFFFF7BC,0xFFCDEF90};

void setup()
{
    size(600,600);    
    physics = new ParticleSystem( 0.0, 0.0);
    physics.setIntegrator(1);
    pg = createGraphics(width,height);
    noche=new ArrayList();
    estrellas= new ArrayList();
    background(0);
}


void draw()
{
    color sabor;
    //Truco de fade lento para background
    noStroke();
    fill(0,2);
    rect(0,0,width,height);
    physics.tick(1.0);
    addEstrella();
    //loop para las estrellas
    pg.beginDraw();
    pg.background(0);
    for (int i= estrellas.size()-1; i>=0; i--)
    {
    Estrella e = (Estrella)estrellas.get(i);
    e.draw();
     if (e.dead())
        {
            estrellas.remove(i);
        }
    }
    pg.endDraw(); 
   
    //loop para dibujar los caminantes
    for (int i= noche.size()-1; i>=0; i--)
    {
        Caminante c = (Caminante)noche.get(i);
        c.update();
        color col=pg.get((int)c.x(),(int)c.y());
    
        if( col != color(0) ){;
          sabor=estrellacol[(int)random(64)];
        }
        else {
          sabor=nochecol[(int)random(64)];
        }
        c.draw( sabor);
        if (c.dead())
        {
          
            c.kill();
            noche.remove(i);
        }
    }
   
}

void addEstrella()
{
    if(random(1.0) > 0.96 )
    {
      float x=random(width);
      float y=random(height);
        estrellas.add(  new Estrella(x,y)  );
        
        int ncam=(int)random(40,150);
        for(int i=0; i < ncam; i++)
        noche.add(  new Caminante(x,y,random(1,10),physics)  );
    }
}

final float minv=0.01;
final float maxv=1;

class Caminante
{
    Particle p;
    ParticleSystem physics;
    float offset=random(10);
    
    Caminante(float x,float y,float mult,ParticleSystem physics)
    {
        this.physics=physics;
        float ang=random(0,TWO_PI);
        float rad=exp(random(log(maxv)))*mult;
        p =physics.makeParticle( 1.0, x,y, 0 );
        p.velocity.set( rad*sin(ang),rad*cos(ang),0.0f );

    }
    
    float x(){
     return p.position.x;
    }
    
    float y(){
     return p.position.y;
    }
    
    void update()
    {
        float ang=random(0,TWO_PI);
        float rad=random(minv,maxv);
        p.velocity.add( rad*sin(ang),rad*cos(ang) ,0.0f);
        
    }

    boolean dead()
    {
        return (p.position.x  > width || p.position.x < 0 ||  p.position.y < 0  || p.position.y > height );
    }

    void draw(color base)
    {
        float alpha=255;
        noFill();
        int index;
        strokeWeight(noise(p.age()+offset)*4 +1);
        stroke(base,alpha);
        line(p.position.x,p.position.y,p.position.x+p.velocity.x,p.position.y+p.velocity.y);
    }

    void kill()
    {
      physics.removeParticle(p);
    }

}






public class Estrella{
 private float life=1.0;
 float rad1,rad2,ang,angstep;
 float x,y;
 float offset=random(10),mult=random(10)+1;
 int n;
 private float step=1.0/300.0;
 
 Estrella(float x,float y){
 this.x=x;
 this.y=y;
 n=(int)random(5,12);
 rad1=exp(random(2,6));
 rad2=random(rad1*n*0.05);
 ang=random(0,TWO_PI);
 offset=random(10);
 angstep=TWO_PI/(n*3.0);
 }
 
 
 void draw(){
 life-= step;
 pg.pushMatrix();
 pg.translate(x,y);
 pg.rotate(ang);
 pg.noStroke();
 pg.fill(255*life);
 pg.beginShape();
 float r1=rad1*life;
 float r2=rad2*life;
 
 for(int i=0; i < n; i++){
   pg.vertex(r2*cos((i*angstep*3)),r2*sin((i*angstep*3) ));
   pg.vertex(r1*cos((i*angstep*3)+1),r1*sin((i*angstep*3)+1));
   pg.vertex(r2*cos((i*angstep*3) +2),r2*sin((i*angstep*3) +2));
   }
 pg.endShape();
 pg.popMatrix();
 } 
 
 boolean dead(){

  return life < 0.0 ;
 }
 
}
// Traer Physics 3.0
// Terms from Traer's download page, http://traer.cc/mainsite/physics/
//   LICENSE - Use this code for whatever you want, just send me a link jeff@traer.cc
//
// traer3a.pde 
//   From traer.physics - author: Jeff Traer
//     Attraction              Particle                     
//     EulerIntegrator         ParticleSystem  
//     Force                   RungeKuttaIntegrator         
//     Integrator              Spring
//     ModifiedEulerIntegrator Vector3D          
//===========================================================================================
//                                      Attraction
//===========================================================================================
// attract positive repel negative
//package traer.physics;
public class Attraction implements Force
{
  Particle one;
  Particle b;
  float k;
  boolean on = true;
  float distanceMin;
  float distanceMinSquared;
  
  public Attraction( Particle a, Particle b, float k, float distanceMin )
  {
    this.one = a;
    this.b = b;
    this.k = k;
    this.distanceMin = distanceMin;
    this.distanceMinSquared = distanceMin*distanceMin;
  }

  protected void        setA( Particle p )            { one = p; }
  protected void        setB( Particle p )            { b = p; }
  public final float    getMinimumDistance()          { return distanceMin; }
  public final void     setMinimumDistance( float d ) { distanceMin = d; distanceMinSquared = d*d; }
  public final void     turnOff()                     { on = false; }
  public final void     turnOn()                { on = true;  }
  public final void     setStrength( float k )        { this.k = k; }
  public final Particle getOneEnd()                   { return one; }
  public final Particle getTheOtherEnd()              { return b; }
  
  public void apply() 
  { if ( on && ( one.isFree() || b.isFree() ) )
      {
        PVector a2b = PVector.sub(one.position, b.position, new PVector());
        float a2bDistanceSquared = a2b.dot(a2b);

  if ( a2bDistanceSquared < distanceMinSquared )
     a2bDistanceSquared = distanceMinSquared;

  float force = k * one.mass0 * b.mass0 / (a2bDistanceSquared * (float)Math.sqrt(a2bDistanceSquared));

        a2b.mult( force );

  // apply
        if ( b.isFree() )
     b.force.add( a2b );  
        if ( one.isFree() ) {
           a2b.mult(-1f);
     one.force.add( a2b );
        }
      }
  }

  public final float   getStrength() { return k; }
  public final boolean isOn()        { return on; }
  public final boolean isOff()       { return !on; }
} // Attraction


//===========================================================================================
//                                      EulerIntegrator
//===========================================================================================
//package traer.physics;
public class EulerIntegrator implements Integrator
{
  ParticleSystem s;
  
  public EulerIntegrator( ParticleSystem s ) { this.s = s; }
  public void step( float t )
  {
    s.clearForces();
    s.applyForces();
    
    for ( Iterator i = s.particles.iterator(); i.hasNext(); )
      {
  Particle p = (Particle)i.next();
  if ( p.isFree() )
          {
      p.velocity.add( PVector.mult(p.force, t/p.mass0) );
      p.position.add( PVector.mult(p.velocity, t) );
    }
      }
  }
} // EulerIntegrator

//===========================================================================================
//                                          Force
//===========================================================================================
// May 29, 2005
//package traer.physics;
// @author jeffrey traer bernstein
public interface Force
{
  public void    turnOn();
  public void    turnOff();
  public boolean isOn();
  public boolean isOff();
  public void    apply();
} // Force

//===========================================================================================
//                                      Integrator
//===========================================================================================
//package traer.physics;
public interface Integrator 
{
  public void step( float t );
} // Integrator

//===========================================================================================
//                                    ModifiedEulerIntegrator
//===========================================================================================
//package traer.physics;
public class ModifiedEulerIntegrator implements Integrator
{
  ParticleSystem s;
  public ModifiedEulerIntegrator( ParticleSystem s ) { this.s = s; }
  public void step( float t )
  {
    s.clearForces();
    s.applyForces();
    
    float halft = 0.5f*t;
    PVector a = new PVector();
    PVector holder = new PVector();
    for ( int i = 0; i < s.numberOfParticles(); i++ )
      {
  Particle p = s.getParticle( i );
  if ( p.isFree() )
    {
            PVector.div(p.force, p.mass0, a);  
      p.position.add( PVector.mult(p.velocity, t, holder) );
            p.velocity.add( PVector.mult(a, t, a) );
      p.position.add( PVector.mult(a, halft, a) );
    }
      }
  }
} // ModifiedEulerIntegrator

//===========================================================================================
//                                         Particle
//===========================================================================================
//package traer.physics;
public class Particle
{
  PVector position = new PVector();
  PVector velocity = new PVector();
  PVector force = new PVector();
  protected float    mass0;
  protected float    age0 = 0;
  protected boolean  dead0 = false;
  boolean            fixed0 = false;
  
  public Particle( float m )
  { mass0 = m; }
  
  // @see traer.physics.AbstractParticle#distanceTo(traer.physics.Particle)
  public final float distanceTo( Particle p ) { return this.position.dist( p.position ); }
  
  // @see traer.physics.AbstractParticle#makeFixed()
  public final Particle makeFixed() {
    fixed0 = true;
    velocity.set(0f,0f,0f);
    force.set(0f, 0f, 0f);
    return this;
  }
  
  // @see traer.physics.AbstractParticle#makeFree()
  public final Particle makeFree() {
    fixed0 = false;
    return this;
  }

  // @see traer.physics.AbstractParticle#isFixed()
  public final boolean isFixed() { return fixed0; }
  
  // @see traer.physics.AbstractParticle#isFree()
  public final boolean isFree() { return !fixed0; }
    
  // @see traer.physics.AbstractParticle#mass()
  public final float mass() { return mass0; }
  
  // @see traer.physics.AbstractParticle#setMass(float)
  public final void setMass( float m ) { mass0 = m; }
    
  // @see traer.physics.AbstractParticle#age()
  public final float age() { return age0; }
  
  protected void reset()
  {
    age0 = 0;
    dead0 = false;
    position.set(0f,0f,0f);
    velocity.set(0f,0f,0f);
    force.set(0f,0f,0f);
    mass0 = 1f;
  }
} // Particle

//===========================================================================================
//                                      ParticleSystem
//===========================================================================================
// May 29, 2005
//package traer.physics;
//import java.util.*;
public class ParticleSystem
{
  public static final int RUNGE_KUTTA = 0;
  public static final int MODIFIED_EULER = 1;
  protected static final float DEFAULT_GRAVITY = 0;
  protected static final float DEFAULT_DRAG = 0.001f;  
  ArrayList  particles = new ArrayList();
  ArrayList  springs = new ArrayList();
  ArrayList  attractions = new ArrayList();
  ArrayList  customForces = new ArrayList();
  Integrator integrator;
  PVector    gravity = new PVector();
  float      drag;
  boolean    hasDeadParticles = false;
  
  public final void setIntegrator( int which )
  {
    switch ( which )
    {
      case RUNGE_KUTTA:
  this.integrator = new RungeKuttaIntegrator( this );
  break;
      case MODIFIED_EULER:
  this.integrator = new ModifiedEulerIntegrator( this );
  break;
    }
  }
  
  public final void setGravity( float x, float y, float z ) { gravity.set( x, y, z ); }

  // default down gravity
  public final void     setGravity( float g ) { gravity.set( 0, g, 0 ); }
  public final void     setDrag( float d )    { drag = d; }
  public final void     tick()                { tick( 1 ); }
  public final void     tick( float t )       {
    integrator.step( t );
    
  }
  
  public final Particle makeParticle( float mass, float x, float y, float z )
  {
    Particle p = new Particle( mass );
    p.position.set( x, y, z );
    particles.add( p );
    return p;
  }
  
  public final int makeParticle2( float mass, float x, float y, float z )
  { // mrn
    makeParticle(mass, x, y, z);
    return particles.size()-1;
  }
  
  public final Particle makeParticle() { return makeParticle( 1.0f, 0f, 0f, 0f ); }
  
  public final Spring   makeSpring( Particle a, Particle b, float ks, float d, float r )
  {
    Spring s = new Spring( a, b, ks, d, r );
    springs.add( s );
    return s;
  }
  
  public final Attraction makeAttraction( Particle first, Particle b, float k, float minDistance )
  {
    Attraction m = new Attraction( first, b, k, minDistance );
    attractions.add( m );
    return m;
  }
  
  public final int makeAttraction2( Particle a, Particle b, float k, float minDistance )
  { // mrn
    makeAttraction(a, b, k, minDistance);
    return attractions.size()-1; // return the index 
  }

  public final void replaceAttraction( int i, Attraction m )
  { // mrn
    attractions.set( i, m );
  }  

  public final void clear()
  {
    particles.clear();
    springs.clear();
    attractions.clear();
    customForces.clear();
  }
  
  public ParticleSystem( float g, float somedrag )
  {
    setGravity( 0f, g, 0f );
    drag = somedrag;
    integrator = new RungeKuttaIntegrator( this );
  }
  
  public ParticleSystem( float gx, float gy, float gz, float somedrag )
  {
    setGravity( gx, gy, gz );
    drag = somedrag;
    integrator = new RungeKuttaIntegrator( this );
  }
  
  public ParticleSystem()
  {
    setGravity( 0f, ParticleSystem.DEFAULT_GRAVITY, 0f );
    drag = ParticleSystem.DEFAULT_DRAG;
    integrator = new RungeKuttaIntegrator( this );
  }
  
  protected final void applyForces()
  {
    if ( gravity.mag() != 0f )
      {
        for ( Iterator i = particles.iterator(); i.hasNext(); )
    {
            Particle p = (Particle)i.next();
            if (p.isFree()) p.force.add( gravity );
    }
      }
      
    PVector target = new PVector();
    for ( Iterator i = particles.iterator(); i.hasNext(); )
      {
        Particle p = (Particle)i.next();
        if (p.isFree()) p.force.add( PVector.mult(p.velocity, -drag, target) );

      }
      
    applyAll(springs);
    applyAll(attractions);
    applyAll(customForces);
      
    
  }
  
  private void applyAll(ArrayList forces) {
    if( forces.size()!=0 ) for ( Iterator i = forces.iterator(); i.hasNext(); ) ((Force)i.next()).apply();
  }
  
  protected final void clearForces()
  {
    for (Iterator i = particles.iterator(); i.hasNext(); ) ((Particle)i.next()).force.set(0f, 0f, 0f);
  }
  
  public final int        numberOfParticles()              { return particles.size(); }
  public final int        numberOfSprings()                { return springs.size(); }
  public final int        numberOfAttractions()            { return attractions.size(); }
  public final Particle   getParticle( int i )             { return (Particle)particles.get( i ); }
  public final Spring     getSpring( int i )               { return (Spring)springs.get( i ); }
  public final Attraction getAttraction( int i )           { return (Attraction)attractions.get( i ); }
  public final void       addCustomForce( Force f )        { customForces.add( f ); }
  public final int        numberOfCustomForces()           { return customForces.size(); }
  public final Force      getCustomForce( int i )          { return (Force)customForces.get( i ); }
  public final Force      removeCustomForce( int i )       { return (Force)customForces.remove( i ); }
  public final void       removeParticle( int i )          { particles.remove( i ); } //mrn
  public final void       removeParticle( Particle p )     { particles.remove( p ); }
  public final Spring     removeSpring( int i )            { return (Spring)springs.remove( i ); }
  public final Attraction removeAttraction( int i )        { return (Attraction)attractions.remove( i ); }
  public final void       removeAttraction( Attraction s ) { attractions.remove( s ); }
  public final void       removeSpring( Spring a )         { springs.remove( a ); }
  public final void       removeCustomForce( Force f )     { customForces.remove( f ); }
} // ParticleSystem

//===========================================================================================
//                                      RungeKuttaIntegrator
//===========================================================================================
//package traer.physics;
//import java.util.*;
public class RungeKuttaIntegrator implements Integrator
{  
  ArrayList originalPositions = new ArrayList();
  ArrayList originalVelocities = new ArrayList();
  ArrayList k1Forces = new ArrayList();
  ArrayList k1Velocities = new ArrayList();
  ArrayList k2Forces = new ArrayList();
  ArrayList k2Velocities = new ArrayList();
  ArrayList k3Forces = new ArrayList();
  ArrayList k3Velocities = new ArrayList();
  ArrayList k4Forces = new ArrayList();
  ArrayList k4Velocities = new ArrayList();
  ParticleSystem s;

  public RungeKuttaIntegrator( ParticleSystem s ) { this.s = s;  }
  
  final void allocateParticles()
  {
    while( s.particles.size() > originalPositions.size() ) {
        originalPositions.add( new PVector() );
    originalVelocities.add( new PVector() );
    k1Forces.add( new PVector() );
    k1Velocities.add( new PVector() );
    k2Forces.add( new PVector() );
    k2Velocities.add( new PVector() );
    k3Forces.add( new PVector() );
    k3Velocities.add( new PVector() );
    k4Forces.add( new PVector() );
    k4Velocities.add( new PVector() );
    }
  }
  
  private final void setIntermediate(ArrayList forces, ArrayList velocities) {
    s.applyForces();
    for ( int i = 0; i < s.particles.size(); ++i )
      {
  Particle p = (Particle)s.particles.get( i );
  if ( p.isFree() )
    {
      ((PVector)forces.get( i )).set( p.force.x, p.force.y, p.force.z );
      ((PVector)velocities.get( i )).set( p.velocity.x, p.velocity.y, p.velocity.z );
            p.force.set(0f,0f,0f);
    }
      }
  }
  
  private final void updateIntermediate(ArrayList forces, ArrayList velocities, float multiplier) {
    PVector holder = new PVector();
    
    for ( int i = 0; i < s.particles.size(); ++i )
      {
  Particle p = (Particle)s.particles.get( i );
  if ( p.isFree() )
    {
        PVector op = (PVector)(originalPositions.get( i ));
            p.position.set(op.x, op.y, op.z);
            p.position.add(PVector.mult((PVector)(velocities.get( i )), multiplier, holder));    
      PVector ov = (PVector)(originalVelocities.get( i ));
            p.velocity.set(ov.x, ov.y, ov.z);
            p.velocity.add(PVector.mult((PVector)(forces.get( i )), multiplier/p.mass0, holder));  
          }
       }
  }
  
  private final void initialize() {
    for ( int i = 0; i < s.particles.size(); ++i )
      {
  Particle p = (Particle)(s.particles.get( i ));
  if ( p.isFree() )
    {    
      ((PVector)(originalPositions.get( i ))).set( p.position.x, p.position.y, p.position.z );
      ((PVector)(originalVelocities.get( i ))).set( p.velocity.x, p.velocity.y, p.velocity.z );
    }
  p.force.set(0f,0f,0f);  // and clear the forces
      }
  }
  
  public final void step( float deltaT )
  {  
    allocateParticles();
    initialize();       
    setIntermediate(k1Forces, k1Velocities);
    updateIntermediate(k1Forces, k1Velocities, 0.5f*deltaT );
    setIntermediate(k2Forces, k2Velocities);
    updateIntermediate(k2Forces, k2Velocities, 0.5f*deltaT );
    setIntermediate(k3Forces, k3Velocities);
    updateIntermediate(k3Forces, k3Velocities, deltaT );
    setIntermediate(k4Forces, k4Velocities);
    
    /////////////////////////////////////////////////////////////
    // put them all together and what do you get?
    for ( int i = 0; i < s.particles.size(); ++i )
      {
  Particle p = (Particle)s.particles.get( i );
  p.age0 += deltaT;
  if ( p.isFree() )
    {
      // update position
      PVector holder = (PVector)(k2Velocities.get( i ));
            holder.add((PVector)k3Velocities.get( i ));
            holder.mult(2.0f);
            holder.add((PVector)k1Velocities.get( i ));
            holder.add((PVector)k4Velocities.get( i ));
            holder.mult(deltaT / 6.0f);
            holder.add((PVector)originalPositions.get( i ));
            p.position.set(holder.x, holder.y, holder.z);
                          
      // update velocity
      holder = (PVector)k2Forces.get( i );
      holder.add((PVector)k3Forces.get( i ));
            holder.mult(2.0f);
            holder.add((PVector)k1Forces.get( i ));
            holder.add((PVector)k4Forces.get( i ));
            holder.mult(deltaT / (6.0f * p.mass0 ));
            holder.add((PVector)originalVelocities.get( i ));
      p.velocity.set(holder.x, holder.y, holder.z);
    }
      }
  }
} // RungeKuttaIntegrator

//===========================================================================================
//                                         Spring
//===========================================================================================
// May 29, 2005
//package traer.physics;
// @author jeffrey traer bernstein
public class Spring implements Force
{
  float springConstant0;
  float damping0;
  float restLength0;
  Particle one, b;
  boolean on = true;
    
  public Spring( Particle A, Particle B, float ks, float d, float r )
  {
    springConstant0 = ks;
    damping0 = d;
    restLength0 = r;
    one = A;
    b = B;
  }
  
  public final void     turnOff()                { on = false; }
  public final void     turnOn()                 { on = true; }
  public final boolean  isOn()                   { return on; }
  public final boolean  isOff()                  { return !on; }
  public final Particle getOneEnd()              { return one; }
  public final Particle getTheOtherEnd()         { return b; }
  public final float    currentLength()          { return one.distanceTo( b ); }
  public final float    restLength()             { return restLength0; }
  public final float    strength()               { return springConstant0; }
  public final void     setStrength( float ks )  { springConstant0 = ks; }
  public final float    damping()                { return damping0; }
  public final void     setDamping( float d )    { damping0 = d; }
  public final void     setRestLength( float l ) { restLength0 = l; }
  
  public final void apply()
  {  
    if ( on && ( one.isFree() || b.isFree() ) )
      {
        PVector a2b = PVector.sub(one.position, b.position, new PVector());

        float a2bDistance = a2b.mag();  
  
  if (a2bDistance!=0f) {
          a2b.div(a2bDistance);
        }

  // spring force is proportional to how much it stretched 
  float springForce = -( a2bDistance - restLength0 ) * springConstant0; 
  
        PVector vDamping = PVector.sub(one.velocity, b.velocity, new PVector());
        
        float dampingForce = -damping0 * a2b.dot(vDamping);
                           
  // forceB is same as forceA in opposite direction
  float r = springForce + dampingForce;
    
  a2b.mult(r);
      
  if ( one.isFree() )
     one.force.add( a2b );
  if ( b.isFree() )
     b.force.add( PVector.mult(a2b, -1, a2b) );
      }
  }
  protected void setA( Particle p ) { one = p; }
  protected void setB( Particle p ) { b = p; }
} // Spring



