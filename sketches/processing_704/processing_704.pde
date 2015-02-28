
/**
 * Tail 1: demonstration of how to make things follow each other
 * using OO programming. You can add almost anything to this 
 * queue if you write it right.
 * 
 * @author Myer Nore
 * @version 20081204 
 **/

//SECTION 1: INTERFACES ////////////////////////////
interface Locatable
{
  float getX();
  float getY();
}

interface Controllable extends Locatable
{
  void setX( float x );
  void setY( float y );
  /** provides the appearance of the object centered at 0,0 )**/
  void display();
}

// SECTION 2: CLASSES ////////////////////////////////////////
abstract class Thing implements Locatable
{
  float x, y;

  float getX() { 
    return x;       
  }
  float getY() { 
    return y;       
  }

  /** this displays the thing at its coordinates.
    * notice how the appearance is totally separate 
    * from the display.  this enables us to make any appearance
    * that we want, even an appearance that consists of many 
    * in different places in relationship to its actual location.
    ***/
  void display()
  {
    pushMatrix();
    pushStyle();
    translate( x, y ); // here is where the position is set
    appearance();
    popStyle();
    popMatrix();
  }

  /** this must draw the Thing at 0,0 **/
  abstract void appearance();
}

/** A Queue is a Thing that holds Things.  **/
class Queue extends Thing implements Controllable
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

  void appearance()
  {
    Controllable leader;
    Controllable follower;
    for( int i = 0; i < followers.size()-1; i++ )
    {
      leader = (Controllable) followers.get( i );
      follower = (Controllable) followers.get( i+1 );
      control( leader, follower );
    }
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
    follower.setX( newX );
    follower.setY( newY );
  }
  /** you can also control the leader by controlling the Queue.**/
  void setX( float x ){ 
    Controllable leader = (Controllable) followers.get( 0 );
    leader.setX( x );    
  }

  /** you can also control the leader by controlling the Queue.**/
  void setY( float y ){    
    Controllable leader = (Controllable) followers.get( 0 );
    leader.setY( y );      
  }
}

class Ball extends Thing implements Controllable
{
  float xSpeed, ySpeed;

  Ball()
  {
    x = random(width);
    y = random(height);
    xSpeed = random(3)-1.5;
    ySpeed = random(3)-1.5;
  }
  void appearance()
  {
    fill( #2827B7, 127 );
    stroke( #16156A, 127 );
    ellipse( 0, 0, 20, 20 );
  }
  void setX( float x ){ 
    this.x = x;             
  }
  void setY( float y ){ 
    this.y = y ;            
  }
}


// SECTION 3: PROCESSING CODE //////////////////////////////
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
  background( 255 );
  queue.setX( mouseX ); // this sets the position of the leader
  queue.setY( mouseY ); // you could also say leader.setX( mouseX )
  queue.display();
}

