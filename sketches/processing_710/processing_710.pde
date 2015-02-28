
/**
 * Demonstrates how to combine Following and Easing using 
 * Object Oriented Principles.  Inspired by the Follow and Easing
 * examples included with processing.
 * 
 * @author Myer Nore
 * @version Monday, December 8
 **/

// SECTION 1: INTERFACES ////////////////////////////////////////////
/** This interface describes something that 
  * has a discrete, obtainable position.
  */
interface Locatable
{
  /** displays the object at the correct position **/
  void display();
  float getX();
  float getY();
}

/** This interface describes something that 
  * can be moved around OR warped around.
  * you must be able to call display to execute
  * the entire display cycle.
  */
interface Controllable extends Locatable
{
  void setDestination( float x, float y );
  void setPosition( float x, float y );
  void setSpeed( float dx, float dy );
}

// SECTION 2: CLASSES ///////////////////////////////////////
/** This Thing class encapsulates something that 
  * is locatable, and controllable either by 
  * setting speed or by setting a destination.
  * the appearance is separated from the positioning,
  * so you must define appearance if you extend this class. 
  */
abstract class Thing implements Controllable 
{
  float x, y, xSpeed, ySpeed, destinationX, destinationY;

  void display()
  {
    move();
    pushMatrix();
    pushStyle();
    translate( x, y );
    appearance();
    popStyle();
    popMatrix();
  }
  
  void setDestination( float x, float y )
  {
    this.destinationX = x;
    this.destinationY = y;  
  }
  
  void setPosition( float x, float y )
  {
    this.x = x;
    this.y = y;
  }
 
  void setSpeed( float dx, float dy )
  {
    this.xSpeed = dx;
    this.ySpeed = dy;
  }
  
  float getX()
  {
    return this.x;
  }
  
  float getY()
  {
    return this.y;
  }
  
  /** the appearance method must draw the object
    * at 0, 0.
    */
  abstract void appearance();
  
  /** 
   * the move method is in charge of changing
   * the values of x and y according to rules
   * using the xSpeed and ySpeed or using
   * the easing.
   **/
  abstract void move();
}

/** this is a class that implements "easing" movement. **/
abstract class SoftMover extends Thing
{
  float easing;
  
  SoftMover()
  {
    this.easing = .5;
  }
  
  void setEasing( float easing )
  {
    this.easing = easing;
  }
  
  void move()
  {
    float dx = destinationX - x;
    float dy = destinationY - y;
    if( abs( dx ) > 1 )
    {
      x += dx * easing;
    }
    if( abs( dy ) > 1 )
    {
      y += dy * easing;
    }
  }
  
  abstract void appearance();
}

/** an "easing" ball. **/
class Ball extends SoftMover
{
  void appearance()
  {
    fill( #BF2121, 127 );
    stroke( #5F1E1E, 127 );
    strokeWeight( 3 );
    ellipse( 0, 0, 100, 100 );
  }
}

/** A Queue is a Thing that holds Things.  **/ 
class Queue extends Thing
{ 
  float segmentLength; 
  ArrayList followers; 
 
  /** you must provide a Thing to start the queue. **/ 
  Queue( Thing leader ) 
  { 
    segmentLength = 15; 
    followers = new ArrayList(); 
    // as wacky as it sounds, this object 
    // is going to be the first object in the collection 
    followers.add( leader ); 
  } 
 
  void addFollower( Controllable follower ) 
  { 
    followers.add( follower ); 
  } 
  
 void move()
  {
    Controllable leader; 
    Controllable follower; 
    for( int i = 0; i < followers.size()-1; i++ ) 
    { 
      leader = (Controllable) followers.get( i ); 
      follower = (Controllable) followers.get( i+1 ); 
      control( leader, follower ); 
    }
  }
  
  void appearance() 
  { 
    Controllable leader; 
    Controllable follower; 
    for( int i = followers.size()-1; i > 0; i-- ) 
    { 
      leader = (Controllable) followers.get( i ); 
      leader.display(); 
    } 
  } 
 
  /** 
   * This is the juicy part where the position of each follower 
   * is determined by the one directly in front. 
   **/ 
  void control( Controllable leader, Controllable follower ) 
  { 
    // find the difference in x between two consecutive balls 
    float changeInX = leader.getX() - follower.getX(); 
    // find the difference in y between two consecutive balls 
    float changeInY = leader.getY() - follower.getY(); 
    // find the angle by using the inverse tangent 
    float angle = atan2( changeInY, changeInX ); 
    // the new follower x coordinate is defined as a certain  
    // distance from the x coordinate of the leader 
    // cos( angle ) produces values from zero to one,  
    // so segmentLength scales them to a certain distance. 
    float newX = leader.getX() - cos(angle) * segmentLength; 
    float newY = leader.getY() - sin(angle) * segmentLength; 
    follower.setDestination( newX, newY );
  }
  
  void setPosition( float x, float y )
  {
    Controllable leader = (Controllable) followers.get( 0 ); 
    leader.setPosition( x, y );    
  }
}

// SECTION 3: PROCESSING CODE ///////////////////////////////////

Ball leader;
Queue queue;
int numberOfFollowers;

void setup()
{
  size( 700, 400 );
  smooth();
  leader = new Ball(); 
  queue = new Queue( leader ); 
  numberOfFollowers = 50; 
  for( int i = 0; i < numberOfFollowers; i++ ) 
  { 
    queue.addFollower( new Ball() ); 
  } 
}

void draw()
{
  background( 255, 1 );
  queue.setPosition( mouseX, mouseY );
  queue.display();
}
    


