
/* GAME NOTES:
    things to change:
    1. don't have the bricks come down randomly
    2. have the bricks emerge from bins at the top of the screen, 
        such that you know what the next row coming up is
    3. have more time after you lose a life before the next boxes come on screen
    4. make the playfield wider
       -not sure if this is a good idea yet, will release with wider playfield, see what happens
    5. test out moving the anchor between the points rather than jumping it between points.
      -fixed by doing #6
    6. see if the game makes more sense with more anchors
      -done
*/

//import traer.physics.*;
//import processing.opengl.*;

PFont fontLarge, fontSmall;

ParticleSystem physics;

int numberOfAttackers = 1;
int numberOfAnchors = 10;
int currentAnchor;
Attacker[] a = new Attacker[numberOfAttackers];

Particle p;
Particle[] anchors = new Particle[numberOfAnchors];
Spring[] springs = new Spring[numberOfAnchors];

void setup()
{
  /*
   String[] fontList = PFont.list();
  println(fontList);
  */
  size( 600, 400 );
  smooth();
  fontLarge = createFont("sans-serif", 72);
  fontSmall = createFont("sans-serif", 24);
  textAlign(LEFT);
textMode(MODEL);
  //fontLarge = loadFont("HelveticaNeue-UltraLight-72.vlw");
  //fontSmall = loadFont("HelveticaNeue-UltraLight-24.vlw");

  fill( 0 );
  frameRate( 24 );
  ellipseMode( CENTER );

  physics = new ParticleSystem( 5.0, 0.01 );

  p = physics.makeParticle( 1.0, width/2, height/2, 0 );
  for(int i=0;i<numberOfAnchors;i++){
    anchors[i] = physics.makeParticle(1.0, (width/numberOfAnchors)*(i+2*.25), height/2, 0);
    anchors[i].makeFixed();
    springs[i] = physics.makeSpring(p, anchors[i], 1, 0.6, 100);
    springs[i].turnOff();
  }
  currentAnchor = int(numberOfAnchors/2);
  springs[currentAnchor].turnOn();
  buildAttackers(1, 0);
}

char state = 'T';

/* GAME STATE DEFINITIONS:
 T: titlescreen
 R: titlescreen -> game
 G: game
 H: game -> scores
 S: scores
 Q: scores -> titlescreen
 */

/*void draw(){
  title();
}
*/
void draw()
{
  switch(state){
  case 'T':
    background(20);
    title();
    break;
  case 'R':
    background(100);
    transition();
    break;
  case 'G':
    background(200);
    game();
    break;
  case 'H':
    background(255);
    transition();
    break;
  case 'S':
    background(255);
    scores();
    break;
  case 'Q':
    background(255);
    transition();
    break;
  }
}

void title(){
  noStroke();
  fill(20);
  pushMatrix();
  translate(0, 0, -1);
  rect(0, 0, width, height);
  popMatrix();
  textFont(fontLarge);
  fill(100);
  //stroke(100);
  text("avoid 0.1", 20, 120);
  textFont(fontSmall);
  fill(200, 255);
  text("press any key to begin", 20, 20);
  if(keyPressed && state == 'T'){
    state = 'R';
  }
}

float i=0;
void transition(){
  i += 1.2;
  pushMatrix();
  translate(0, i*5, i);
  if(state == 'R'){
    title();
  }else if(state == 'H'){
    game();
  }else if(state == 'Q'){
    scores();
  }
  popMatrix();
  if(state == 'R'){
    game();
  }else if(state == 'H'){
    scores();
  }else if(state == 'Q'){
    title();
  }
  if(i*5>height){
    if(state == 'R'){
      state = 'G';
      i=0;
    }
    else if(state == 'H'){
      state = 'S';
      i=0;
    }else if(state == 'Q'){
      state = 'T';
      i=0;
    }
  }
}
int finalScore;
void scores(){
  pushMatrix();
  translate(0, 0, -1);
  fill(255);
  rect(0, 0, width, height);
  popMatrix();
  fill(0);
  textFont(fontSmall, 24);
  text("FINAL  SCORE:", 20, 50);
  textFont(fontLarge, 72);
  text(finalScore, 20, 110);
  textFont(fontSmall, 24);
  text("press any key to continue", 20, height-50);
  if(keyPressed){
    state = 'Q';
    lives = 3;
    gameStartTime = 0;
    numberOfAttackers = 1;
  }
}
int lives = 3;
int score = 0;
int gameStartTime = 0;

void game(){
  if(gameStartTime < 1 && state == 'G'){
    gameStartTime = millis();
  }else if(state == 'R'){
    gameStartTime = millis();
  }
  physics.tick( 1.0 );
  if(keyPressed){
    if(millis() - lastKeyPress > 300){
      inputHandler();
      lastKeyPress = millis();
    }
  }
  pushMatrix();
  translate(0, 0, -1);
  fill(200);
  noStroke();
  rect(0, 0, width, height);
  popMatrix();
  textFont(fontSmall, 24);
  fill(20);
  text("R: "+ max(lives, 0), 20, 50);
  text("S: "+ int((millis()-gameStartTime)/100), 20, 80);
  fill(0);
  //conditional allows current Anchor to go below and above the number of anchors there are onscreen
  stroke(0);
  if(currentAnchor>=0&&currentAnchor<numberOfAnchors)
    line( p.position.x, p.position.y, anchors[currentAnchor].position.x, anchors[currentAnchor].position.y );
  for(int i = 0; i<numberOfAnchors;i++){
    ellipse( anchors[i].position.x, anchors[i].position.y, 5, 5 );
  }
  ellipse( p.position.x, p.position.y, 20, 20 );
  fill(50);
  if(state=='G'){
    for(int i=0;i<numberOfAttackers;i++){
      rect( a[i].x, a[i].y, 20, 20);
      a[i].move();
      if(a[i].x-10<p.position.x+2&&a[i].x+10>p.position.x-2&&a[i].y-10<p.position.y+2&&a[i].y+10>p.position.y-2){
        lives -= 1;
        if(lives < 0){
          finalScore = (millis()-gameStartTime)/100;
          state = 'H';
        }
        buildAttackers(numberOfAttackers, 0);
      }
    }
  }
}
float lastKeyPress;
void keyReleased(){
  lastKeyPress -= 300;
}

void inputHandler(){
  if(key == CODED) {
    /* NOTE: at one point I had code in here that would allow the
     ball to become unanchored, but I opted to remove it because
     I was having difficulty with the physics simulation.
     */
    if (keyCode == LEFT) {
      if(currentAnchor>0){
        springs[currentAnchor].turnOff();
        currentAnchor -= 1;
        springs[currentAnchor].turnOn();
      }
    } 
    else if (keyCode == RIGHT) {
      if(currentAnchor<numberOfAnchors-1){
        springs[currentAnchor].turnOff();
        currentAnchor += 1;
        springs[currentAnchor].turnOn();
      }
    }
  }
}

class Attacker{
  float x, y;
  float ySpeed;
  Attacker(){
    x = random(width);
    y = random(height);
    ySpeed = .2;
  }
  Attacker(float Py){
    y = Py;
    x = random(width);
  }
  void move(){
    if(y>height){
      this.reset();
      numberOfAttackers++;
      buildAttackers(numberOfAttackers, 0);
    }
    y += ySpeed;
    ySpeed += .2;
  }
  void reset(){
    this.x = random(width);
    y = 0;
    ySpeed = .2;
  }
}

void buildAttackers(int numAttackers, float yPos){
  a = new Attacker[numAttackers];
  for(int i=0;i<numberOfAttackers;i++){
    a[i] = new Attacker(yPos);
  }
}
import java.util.Iterator;

// Traer Physics 3.0
// Terms from Traer's download page, http://traer.cc/mainsite/physics/
//   LICENSE - Use this code for whatever you want, just send me a link jeff@traer.cc
//
// traer3a_01.pde 
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
//   New code - author: Carl Pearson
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
// 24 Mar 2011: Changed the switch statement in ParticleSystem.setIntegrator() to an if-then-else
//              to avoid an apparent bug introduced in Processing-1.1.0.js where the 
//              variable, RUNGE_KUTTA, was not visible inside the switch statement.
//              Changed ModifiedEulerIntegrator to use the documented PVector interfaces to work with pjs. -mrn
//  8 Jan 2013: Added "import java.util.Iterator" so it will now work in the Processing 2.0 IDE,
//              just flip the mode buttion in the upper right corner of the IDE between "JAVA" to "JAVASCRIPT".

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
//    float halftt = 0.5f*t*t;
    PVector a = new PVector();
    PVector holder = new PVector();
    
    for ( int i = 0; i < s.numberOfParticles(); i++ )
      {
  Particle p = s.getParticle( i );
  if ( p.isFree() )
    { // The following "was"s was the code in traer3a which appears to work in the IDE but not pjs
            // I couln't find the interface Carl used in the PVector documentation and have converted
            // the code to the documented interface. -mrn
            
            // was in traer3a: PVector.div(p.force, p.mass0, a);
            a.set(p.force.x, p.force.y, p.force.z);
            a.div(p.mass0);

      //was in traer3a: p.position.add( PVector.mult(p.velocity, t, holder) );
            holder.set(p.velocity.x, p.velocity.y, p.velocity.z);
            holder.mult(t);
            p.position.add(holder);

      //was in traer3a: p.position.add( PVector.mult(a, halft, a) );
            holder.set(a.x, a.y, a.z);
            holder.mult(halft); // Note that the original Traer code used halftt ( 0.5*t*t ) here -mrn
            p.position.add(holder);

            //was in traer3a: p.velocity.add( PVector.mult(a, t, a) );
            holder.set(a.x, a.y, a.z);
            holder.mult(t);
            p.velocity.add(a);
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
    //switch ( which )
    //{
    //  case RUNGE_KUTTA:
    //    this.integrator = new RungeKuttaIntegrator( this );
    //    break;
    //  case MODIFIED_EULER:
    //    this.integrator = new ModifiedEulerIntegrator( this );
    //    break;
    //}
    if ( which==RUNGE_KUTTA )
       this.integrator = new RungeKuttaIntegrator( this );
    else
    if ( which==MODIFIED_EULER )
       this.integrator = new ModifiedEulerIntegrator( this );
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



