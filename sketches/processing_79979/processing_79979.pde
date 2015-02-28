
/* @pjs preload="sigradi_web.jpg"; */
//import traer.physics.*;


float MIN_MASS = 0.5;      // the minimum mass of a particle
float MAX_MASS = 2;      // the maximum mass of a particle
int NTHPIXEL = 7;          // to speed things up multiply this with 2,
// only each nth pixel will get into the particle system
int ELLIPSE_W = (int)(NTHPIXEL*0.8);  // ellipse diameter
int MIN_ELLIPSE_W = (int)(NTHPIXEL*0.2);
int MAX_ELLIPSE_W = (int)(NTHPIXEL*0.3);

Particle mouse;            // particle on mouse position

Particle[] particles;      // the moving particle
Particle[] orgParticles;   // original particles - fixed
color[] colors;            // color values from the image
ParticleSystem physics;    // the particle system

PImage img;                // the original image
int numPixels;             // the number of pixels in the original image
int numPixelsSmall;        // the number of pixels in the scaled-down-version of the image
int widthSmall;            // width of the scaled-down-version of the image
int heightSmall;           // height of the scaled-down-version of the image



void setup() {
  size(900, 300); 
  background(255);

  img = loadImage("sigradi_web.jpg");

  numPixels = img.width * img.height;
  widthSmall = img.width/NTHPIXEL;
  heightSmall = img.height/NTHPIXEL;
  numPixelsSmall = widthSmall * heightSmall;

  // Processing Setup
  noStroke();
  ellipseMode(CENTER);
  smooth();

  // Particle System + Detect Colors
  physics = new ParticleSystem(0, 0.1);
  mouse = physics.makeParticle();            // create a particle for the mouse
  mouse.makeFixed();                         // don't let forces move it
  particles = new Particle[numPixelsSmall];
  orgParticles = new Particle[numPixelsSmall]; 
  colors = new color[numPixelsSmall];
  

  
  img.loadPixels();
  int a;
  for (int x=0; x<widthSmall; x++) {           // go through all rows
    for (int y=0; y<heightSmall; y++) {        // go through all columns
      a = y*widthSmall+x;
      colors[a] = img.pixels[y*NTHPIXEL*img.width+x*NTHPIXEL];
      particles[a] = physics.makeParticle(random(MIN_MASS, MAX_MASS), x*NTHPIXEL, y*NTHPIXEL, 0);
      orgParticles[a] = physics.makeParticle(random(MIN_MASS, MAX_MASS), x*NTHPIXEL, y*NTHPIXEL, 0);
      orgParticles[a].makeFixed();
      // make the moving particles go to their former positions
      physics.makeSpring(particles[a], orgParticles[a], 0.4, 0.1, 0 );
      // make the moving particles get away from the mouse
      physics.makeAttraction(particles[a], mouse, -10000, 50);

    }
  }

}

void draw() {

background(255);
  noStroke();

  //mouse.position().set(mouseX-100, mouseY-100, 0 );
  mouse.position = new PVector(mouseX-100, mouseY-100, 0 );
  physics.tick();
  pushMatrix();
    translate(100, 100);
  dibujarLineas();
  dibujarElipses();
  
  popMatrix();
  

}

void dibujarElipses(){
  int a;
  float w;
  float posx, posy,posu,posv;

  
  for (int x=0; x< widthSmall; x++) {
    for (int y=0; y< heightSmall; y++) {
      a = y*widthSmall + x;

      posx = particles[a].position.x;
      posy = particles[a].position.y;
      posu = orgParticles[a].position.x;
      posv = orgParticles[a].position.y;


      //w = map(dist(posx, posy, mouseX, mouseY), 0, sqrt(width*width + height*height), MAX_ELLIPSE_W, MIN_ELLIPSE_W);
      w = map(dist(posx, posy, posu, posv), 0, sqrt(width*width + height*height), 3, 220);
      if (colors[a] != color(255)) {

        noFill();
        noStroke();
        fill(colors[a]);  // fill with the colour on this position from the image
        //fill(0);
        ellipseMode(CENTER);
        ellipse(posx, posy, w, w);
      }
      
    }
    
  }
}

void dibujarLineas(){
  float posx, posy, posu,posv;
  
   for (int i=0; i< particles.length; i++) {


      posx = particles[i].position.x;
      posy = particles[i].position.y;
      
       for (int j=0; j< numPixelsSmall; j++){


         posu = particles[j].position.x;
         posv = particles[j].position.y;
         
         float d = dist(posx, posy, posu, posv);

         
         if (d < NTHPIXEL*2 && colors[i] != color(255)){
         stroke(colors[i],150);
         //stroke(alfa);
         strokeWeight(0.4);
         line(posx, posy, posu, posv);
         }
       }
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
//
//   From traer.animator - author: Jeff Traer   
//     Smoother                                       
//     Smoother3D                  
//     Tickable     
//
//   New - author: Carl Pearson
//     UniversalAttraction
//     Pulse
//

// 13 Dec 2010: Copied 3.0 src from http://traer.cc/mainsite/physics/ and ported to Processingjs,
//              added makeParticle2(), makeAttraction2(), replaceAttraction(), and removeParticle(int) -mrn (Mike Niemi)
//  9 Feb 2011: Fixed bug in Euler integrators where they divided by time instead of 
//              multiplying by it in the update steps,
//              eliminated the Vector3D class (converting the code to use the native PVector class),
//              did some code compaction in the RK solver,
//              added a couple convenience classes, UniversalAttraction and Pulse, simplifying 
//              the Pendulums sample (renamed to dynamics.pde) considerably. -cap (Carl Pearson)

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
//                                    UniversalAttraction
//===========================================================================================
// attract positive repel negative
public class UniversalAttraction implements Force {
  public UniversalAttraction( float k, float distanceMin, ArrayList targetList )
  {
    this.k = k;
    this.distanceMin = distanceMin;
    this.distanceMinSquared = distanceMin*distanceMin;
    this.targetList = targetList;
  }
  
  float k;
  boolean on = true;
  float distanceMin;
  float distanceMinSquared;
  ArrayList targetList;
  public final float    getMinimumDistance()          { return distanceMin; }
  public final void     setMinimumDistance( float d ) { distanceMin = d; distanceMinSquared = d*d; }
  public final void     turnOff()                     { on = false; }
  public final void     turnOn()                { on = true;  }
  public final void     setStrength( float k )        { this.k = k; }
  public final float   getStrength() { return k; }
  public final boolean isOn()        { return on; }
  public final boolean isOff()       { return !on; }

  
  public void apply() 
  { 
    if ( on ) {
        for (int i=0; i < targetList.size(); i++ ) {
          for (int j=i+1; j < targetList.size(); j++) {
            Particle a = (Particle)targetList.get(i);
            Particle b = (Particle)targetList.get(j);
            if ( a.isFree() || b.isFree() ) {
              PVector a2b = PVector.sub(a.position, b.position, new PVector());
              float a2bDistanceSquared = a2b.dot(a2b);
              if ( a2bDistanceSquared < distanceMinSquared )
              a2bDistanceSquared = distanceMinSquared;
              float force = k * a.mass0 * b.mass0 / (a2bDistanceSquared * (float)Math.sqrt(a2bDistanceSquared));
              a2b.mult( force );

              if ( b.isFree() ) b.force.add( a2b );  
              if ( a.isFree() ) {
                 a2b.mult(-1f);
                 a.force.add( a2b );
              }
            }
          }
        }
    }
  }
} //UniversalAttraction

//===========================================================================================
//                                    Pulse
//===========================================================================================
public class Pulse implements Force {
  public Pulse( float k, float distanceMin, PVector origin, float lifetime, ArrayList targetList )
  {
    this.k = k;
    this.distanceMin = distanceMin;
    this.distanceMinSquared = distanceMin*distanceMin;
    this.origin = origin;
    this.targetList = targetList;
    this.lifetime = lifetime;
  }
  
  float k;
  boolean on = true;
  float distanceMin;
  float distanceMinSquared;
  float lifetime;
  PVector origin;
  ArrayList targetList;
  
  public final void     turnOff() { on = false; }
  public final void     turnOn()  { on = true;  }
  public final boolean  isOn()    { return on; }
  public final boolean  isOff()   { return !on; }
  public final boolean  tick( float time ) { 
    lifetime-=time; 
    if (lifetime <= 0f) turnOff(); 
    return on;
  }
  
  public void apply() {
    if (on) {
      PVector holder = new PVector();
      int count = 0;
      for (Iterator i = targetList.iterator(); i.hasNext(); ) {
        Particle p = (Particle)i.next();
        if ( p.isFree() ) {
          holder.set( p.position.x, p.position.y, p.position.z );
          holder.sub( origin );
          float distanceSquared = holder.dot(holder);
          if (distanceSquared < distanceMinSquared) distanceSquared = distanceMinSquared;
          holder.mult(k / (distanceSquared * (float)Math.sqrt(distanceSquared)) );
          p.force.add( holder );
        }
      }
    }
  }
}//Pulse

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
  ArrayList  pulses = new ArrayList();
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
    for (int i = 0; i<pulses.size(); ) {
      Pulse p = (Pulse)pulses.get(i);
      p.tick(t);
      if (p.isOn()) { i++; } else { pulses.remove(i); }
    }
    if (pulses.size()!=0) for (Iterator i = pulses.iterator(); i.hasNext(); ) {
      Pulse p = (Pulse)(i.next());
      p.tick( t );
      if (!p.isOn()) i.remove();
    }
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

  public final void addPulse(Pulse pu){ pulses.add(pu); }

  public final void clear()
  {
    particles.clear();
    springs.clear();
    attractions.clear();
    customForces.clear();
    pulses.clear();
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
    applyAll(pulses);
      
    
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

//===========================================================================================
//                                       Smoother
//===========================================================================================
//package traer.animator;
public class Smoother implements Tickable
{
  public Smoother(float smoothness)                     { setSmoothness(smoothness);  setValue(0.0F); }
  public Smoother(float smoothness, float start)        { setSmoothness(smoothness); setValue(start); }
  public final void     setSmoothness(float smoothness) { a = -smoothness; gain = 1.0F + a; }
  public final void     setTarget(float target)         { input = target; }
  public void           setValue(float x)               { input = x; lastOutput = x; }
  public final float    getTarget()                     { return input; }
  public final void     tick()                          { lastOutput = gain * input - a * lastOutput; }
  public final float    getValue()                      { return lastOutput; }
  public float a, gain, lastOutput, input;
} // Smoother

//===========================================================================================
//                                      Smoother3D
//===========================================================================================
//package traer.animator;
public class Smoother3D implements Tickable
{
  public Smoother3D(float smoothness)
  {
    x0 = new Smoother(smoothness);
    y0 = new Smoother(smoothness);
    z0 = new Smoother(smoothness);
  }
  public Smoother3D(float initialX, float initialY, float initialZ, float smoothness)
  {
    x0 = new Smoother(smoothness, initialX);
    y0 = new Smoother(smoothness, initialY);
    z0 = new Smoother(smoothness, initialZ);
  }
  public final void setXTarget(float X) { x0.setTarget(X); }
  public final void setYTarget(float X) { y0.setTarget(X); }
  public final void setZTarget(float X) { z0.setTarget(X); }
  public final float getXTarget()       { return x0.getTarget(); }
  public final float getYTarget()       { return y0.getTarget(); }
  public final float getZTarget()       { return z0.getTarget(); }
  public final void setTarget(float X, float Y, float Z)
  {
    x0.setTarget(X);
    y0.setTarget(Y);
    z0.setTarget(Z);
  }
  public final void setValue(float X, float Y, float Z)
  {
    x0.setValue(X);
    y0.setValue(Y);
    z0.setValue(Z);
  }
  public final void setX(float X)  { x0.setValue(X); }
  public final void setY(float Y)  { y0.setValue(Y); }
  public final void setZ(float Z)  { z0.setValue(Z); }
  public final void setSmoothness(float smoothness)
  {
    x0.setSmoothness(smoothness);
    y0.setSmoothness(smoothness);
    z0.setSmoothness(smoothness);
  }
  public final void tick()         { x0.tick(); y0.tick(); z0.tick(); }
  public final float x()           { return x0.getValue(); }
  public final float y()           { return y0.getValue(); }
  public final float z()           { return z0.getValue(); }
  public Smoother x0, y0, z0;
} // Smoother3D

//===========================================================================================
//                                      Tickable
//===========================================================================================
//package traer.animator;
public interface Tickable
{
  public abstract void tick();
  public abstract void setSmoothness(float f);
} // Tickable
// widgets.pde
//   Button       
//     StateButton  
//     StartPauseStopButton
//     RestartButton
//   HScrollbar
// 
// Last updated: 16 Dec 2010 16:43, Mike Niemi

class Button
{
  int       x, y, buttonSize, ibackgroundcolor, ihighlightcolor, ibasecolor;
  color     currentcolor;
  boolean   over0    = false,
            pressed0 = false,
            locked0  = false;   

  void update() 
  {
    if (over()) 
       currentcolor = color(ihighlightcolor);
    else 
       currentcolor = color(ibasecolor);
  }

  boolean pressed() 
  {
    if (over0) 
      {
        locked0 = true;
        return true;
      } 
    else 
      {
        locked0 = false;
        return false;
      }     
  }

  boolean over() 
  { return true; }

  boolean overRect(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) 
       return true;
    else 
       return false;
  }

  boolean overCircle(int x, int y, int diameter) 
  {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) 
       return true;
    else 
       return false;
  }

  boolean overArc(int x, int y, int width, int height) 
  {
    if (mouseX >= x && mouseX <= x+width && 
        mouseY >= (y-height/2) && mouseY <= (y-height/2)+height) 
       return true;
    else 
       return false;
  }
  
} // Button

class StateButton extends Button
{ 
  final static int STATEoff = 0, STATEon = 1;
  int cx, cy;
  
  StateButton(int ix, int iy, int isize, int icolor, int ihighlight, int ibackground) 
  {
    x = ix; // x and y are the upper left corner (like ellipseMode(CORNER))
    y = iy; 
    buttonSize = isize;
    cx = x + buttonSize/2; // cx and cy will be the center
    cy = y + buttonSize/2;
    ibasecolor = icolor;
    ihighlightcolor = ihighlight;
    currentcolor = color(ibasecolor);
    ibackgroundcolor = ibackground;
  }

  boolean over() 
  {
    if ( overCircle(cx, cy, buttonSize) ) 
      {
        over0 = true;
        return true;
      } 
    else 
      {
        over0 = false;
        return false;
      }
  }

  void display(int state, int numCyclesLeft) 
  {
    if (state == STATEon)
      { 
        stroke(128);
        
        if (numCyclesLeft < 20) // fade in the idled color
          { 
            float f0 = 1.0 - ((float)numCyclesLeft)/20.0; // 0.0 - 1.0
            float f1 = ibasecolor - f0 * (float)(ibasecolor-ibackgroundcolor);
            if (ibackgroundcolor == 0)
               fill(f1,0,0);
            else
              {   
                float f2 = f0 * 255.0;
                fill(f1,f2,f2);
              }  
          }    
        else
          fill(ibasecolor,0,0); 
          
        ellipse(cx, cy, buttonSize, buttonSize);
      }  
    else
      { 
        stroke(128);
        fill(color(ibackgroundcolor));
        ellipse(cx, cy, buttonSize, buttonSize);
      }  
  }
} // StateButton

class StartPauseStopButton extends Button
{ 
  final static int SHOWrun = 0, SHOWpause = 1, SHOWstop = 2; 
  
  StartPauseStopButton(int ix, int iy, int isize, 
                       int icolor, int ihighlight, int ibackground) 
  {
    x = ix; // x and y are the upper left corner
    y = iy;
    buttonSize = isize;
    ibasecolor = icolor;
    ihighlightcolor = ihighlight;
    currentcolor = color(ibasecolor);
    ibackgroundcolor = ibackground;
  }

  boolean over() 
  {
    if ( overRect(x, y, buttonSize, buttonSize) ) 
      {
        over0 = true;
        return true;
      } 
    else 
      {
        over0 = false;
        return false;
      }
  }

  void display(int whatToShow) 
  {
    if (whatToShow == SHOWstop)
      { 
        stroke(255, 80, 80);
        fill(255,0,0);
        rect(x, y, buttonSize, buttonSize);
      }  
    else
    if (whatToShow == SHOWpause)
      { 
        stroke(128);
        fill(0);
        rect(x+2,                y, buttonSize/4, buttonSize);
        rect(x+2*buttonSize/3-2, y, buttonSize/4, buttonSize);
      }  
    else
    if (whatToShow == SHOWrun)
      { 
        stroke(80, 255, 80);
        fill(0,255,0);
        triangle(x,y, x+buttonSize,y+buttonSize/2, x,y+buttonSize);
      }  
  }
} // StartPauseStopButton

class RestartButton extends Button
{ 
  int cx, cy;
  
  RestartButton(int ix, int iy, int isize, 
                int icolor, int ihighlight, int ibackground) 
  {
    x = ix;                // x and y are the upper left corner
    y = iy;
    buttonSize = isize;
    cx = x + buttonSize/2; // cx and cy will be the center
    cy = y + buttonSize/2;
    ibasecolor = icolor;
    ihighlightcolor = ihighlight;
    currentcolor = color(ibasecolor);
    ibackgroundcolor = ibackground;
  }

  boolean over() 
  {
    if ( overCircle(cx, cy, buttonSize) ) 
      {
        over0 = true;
        return true;
      } 
    else 
      {
        over0 = false;
        return false;
      }
  }

  void display() 
  {
    stroke(0);
    noFill();
    arc(cx, cy, buttonSize, buttonSize, PI/2, 2*PI);
    arc(cx, cy, buttonSize-10, buttonSize-10, PI/2, 2*PI);
    line(x+buttonSize-3, cy+5, x+buttonSize+4,  cy-3);
    line(x+buttonSize-3, cy+5, x+buttonSize-10, cy-3);
    line(cx, y+buttonSize-4, cx, y+buttonSize);
  }
} // RestartButton

class HScrollbar
{
  int     swidth, sheight;  // width and height of bar
  int     xpos, ypos;       // x and y position of bar
  float   spos, newspos;    // x position of slider
  int     sposMin, sposMax; // max and min values of slider
  int     loose;            // how loose/heavy
  boolean over0;            // is the mouse over the slider?
  boolean locked0;
  float   ratio;
  int     cyclesLeft = 9999;

  HScrollbar (int xp, int yp, int sw, int sh, int l) 
  {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    //spos = xpos + swidth/2 - sheight/2;
    spos = xpos;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  boolean update(int i) 
  {
    float oldNewspos = newspos;
    
    cyclesLeft = i;
      
    if (over()) 
       over0 = true;
    else 
       over0 = false;
        
    if (mousePressed && over0) 
       locked0 = true;
    
    if (!mousePressed) 
       locked0 = false;
    
    if (locked0) 
       newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    
    if (abs(newspos - spos) > 1) 
       spos = spos + (newspos-spos)/loose;
       
    return ( oldNewspos != newspos );
  }

  int constrain (int val, int minv, int maxv) 
  { return min(max(val, minv), maxv); }

  boolean over() 
  {
    over0 = (mouseX > xpos && mouseX < xpos+swidth && 
             mouseY > ypos && mouseY < ypos+sheight);
    return over0;
  }
  
  boolean locked()
  { 
    locked0 = over0 && mousePressed;
    return locked0; 
  }

  void display() 
  { 
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    
    boolean quiescing = false;
    if ( cyclesLeft < 50 )
      {
        if (over0 || locked0)
          {
            float f = ((float)cyclesLeft)/50.0; // 1.0-0.0 .. fade-out over 50 cycles
            f = 102 + f*(200-102);
            fill(f,102,0);
            quiescing = true;
          }
      }
      
    if (!quiescing)  
      { if (over0 || locked0) 
           fill(200, 102, 0);
        else 
           fill(102, 102, 102);
      }     
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() 
  { return spos * ratio; } // 0 - total width of the scrollbar
  
  float getValue()
  { return (newspos-xpos)/(swidth-sheight); } // 0.0 - 1.0
} // HScrollbar


