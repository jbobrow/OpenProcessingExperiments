

// SECTION 1: INTERFACES ////////////////////////////////////////////
/** This interface describes something that 
  * has a discrete, obtainable position.
  */
interface Locatable
{
  float getX();
  float getY();
}

/** This interface describes something that 
  * can be moved around OR warped around.
  * you must be able to call display to execute
  * the entire display cycle.
  */
interface Controllable
{
  void moveTo( float x, float y );
  void jumpTo( float x, float y );
  void display();
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
  float x, y, xSpeed, ySpeed, goToX, goToY;

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

  void moveTo( float x, float y )
  {
    this.goToX = x;
    this.goToY = y;  
  }
  
  void jumpTo( float x, float y )
  {
    this.x = x;
    this.y = y;
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
    this.easing = .05;
  }
  
  void setEasing( float easing )
  {
    this.easing = easing;
  }
  
  void move()
  {
    float dx = goToX - x;
    float dy = goToY - y;
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

// SECTION 3: PROCESSING CODE ///////////////////////////////////

Ball b;

void setup()
{
  size( 700, 300 );
  smooth();
  b = new Ball();
}

void draw()
{
  background( 255, 1 );
  b.moveTo( mouseX, mouseY );
  b.display();
}
    


