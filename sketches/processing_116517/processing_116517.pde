
// Constants
final int ballBaseSize=10;
final float ballSizeFluct=0.3;
// Tells that internal FPS shouldn't be calculated more often than n ms
final int internalFPSRefreshTime=1000;
// sets the speed of the balls
final float speed=5;
// go out ratio changes the speed the balls that go out of the screen
final float goOutRatio=0.05;


int i, j=0;

float FPS=0;
long starttime=0;
long prevtime=0;
int staticRate;

int runs=0;

// we cannot use color fadeColor - it doesn't work in JavaScript runtime;
// please change colour directly inside fade() function
// color fadeColor;

// we cannot exceed the maximal value of the
// data type we'll use to store runs count
int runsMax=100000;
int lastRuns=0;
boolean computed=false;


// the list of all balls created by the user
ArrayList<Ball> balls = new ArrayList<Ball>();

/*DEBUG_LINE*///Ball ball_debug;

void setup() {
  /*// if we want as fast FPS as possible
   frameRate(65535);
   staticRate=400; // some rational value to start with
   */
  ///*// if we want the fps no greater than
  staticRate=100; // we set the static rate to intended frame rate
  frameRate(staticRate); // and we say we want that framerate
  //*/

  size(600, 600);
  background(0);
  strokeWeight(ballBaseSize);
  smooth();
  colorMode(HSB, 255);
  // we cannot use color fadeColor - it doesn't work in JavaScript runtime
  //fadeColor=color(0, 0, 0, 10);
  starttime=millis();
  prevtime=millis();
}



float FPS()
{
  if (runs == 0)
  {
    FPS=(runsMax-lastRuns+1)*1.0/( ( (millis()-prevtime)*1.0 ) / 1000 );
    lastRuns=runs;
    prevtime=millis();
    return FPS;
  }
  else if ( millis()-prevtime >= internalFPSRefreshTime )
  {
    FPS=(runs-lastRuns)*1.0/( ( (millis()-prevtime)*1.0 ) / 1000 );
    lastRuns=runs;
    prevtime=millis();
    /*DEBUG_LINE*///    println("Computed new FPS");
    return FPS;
  }
  else
  {
    return FPS;
  }
}

void fade()
{
  noStroke();
  colorMode(RGB, 255);
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  colorMode(HSB, 255);
}

// When mouse is pressed, new ball is created
// (This function is called only once after the mouse state is changed to pressed)
void mousePressed()
{
  balls.add(new Ball( mouseX, mouseY ));
}

void draw()
{
  /*DEBUG_BEGIN
  // Frame Rate printout, every 3 seconds
  if (runs % (staticRate*3) == 0)   
  {
    println( "FPS: "+FPS()+"\tProcessing FPS: "
      +frameRate+"\tstaticRate: "+staticRate+"\truns: "+runs+
      "\t\tdisplayWidth: "+displayWidth+"\tAlive balls: "+balls.size());
  }
  DEBUG_END*/

  // Fading
  // Modulo controls the speed - that's why we need runs counter
  if (int(staticRate/7)!=0)
  {
    if (runs%int(staticRate/7) == 0)
      fade();
  }
  else fade();

  // Saving staticRate
  if (!computed && millis()-starttime >= 3000)
  {
    if ( (millis()-starttime)*1.0 / 1000 != 0 )
    {
      staticRate=round(runs*1.0/( ( (millis()-starttime)*1.0 ) / 1000 ));
      computed=true;
    }
    else
    {
      computed=false;
    }
    /*DEBUG_LINE*///    println("staticRate set to "+staticRate);
  }

  // Runs counter - increasing and refreshing
  if (runs == runsMax)
  {  
    runs=0;
    starttime=millis();
    /*DEBUG_LINE*///    println("Counter reset");
  }
  else runs++;

  /*DEBUG_BEGIN
  if (keyPressed)
  {
    for (int z = balls.size()-1; z >= 0; z--)
    {
      // displaying debug info
      balls.get(z).debug();
    }
  }
  DEBUG_END*/

  // Main internal loop - adjusts speed to frame rate
  for (i=0; i<1+int(staticRate*speed/frameRate); i++)
  {  
    // go throught the list of objects and call them to display
    // going backwards because we're deleting stuff
    for (j = balls.size()-1; j >= 0; j--)
    {
      // displaying each ball and checking if it is still alive
      // (display() returns false when ball is dead)
      if ( balls.get(j).display() == false )
      {
        // ball is dead
        /*DEBUG_BEGIN
        println("Removing dead ball: "+balls.get(j).getID()
          +"\t item: "+j+"\tfrom the list");
        DEBUG_END*/
        // Remove ball number j from the list
        balls.remove(j);
      }
    }
  }
} // draw() end

long BallsCounter=0;

class Ball
{
  // Fields    
  private long id=0; // ball unique ID - not neccessary; additional feature
  private float X, Y;
  private int mX, mY;
  private boolean live=true; // the program is alive on the beginning
  private boolean goOut=false; // we don't go out on the beginning
  private boolean stopped=true; // indicates if the ball is stopped - on the beginning, it is
  private float a=0, b=0; // movement temporary variables
  private float h=0, v=0; // movement vector [h, v]
  private color col; // ball colour
  private int size; // ball size



  // Constructor of the ball - saves settings and initial X and Y coordinates of the ball
  public Ball(int inX, int inY)
  {
    id=BallsCounter; // saving ball's unique ID
    BallsCounter++;
    // setting ball colour using HSBA colour mode with some randomisation
    colorMode(HSB, 255);
    col=color( random(255), random(150, 255), random(150, 255), random(150, 255) );
    colorMode(RGB, 255);
    // setting the size to a random size from relatively defined range
    size=int(  ( 1 + random( (-1)*ballSizeFluct, ballSizeFluct ) ) * ballBaseSize  );

    // Saves initial ball coordinates
    X=inX; 
    Y=inY;

    /*DEBUG_LINE*///    println("Ball "+id+"\t: Started new curve");
  }

  // Methods

  public long getID()
  {
    return id;
  }


  // Printing debug info
  /*DEBUG_BEGIN
  public void debug()
  {
    println("Ball "+id+"\t: X: "+X+"\tmX:"+mX+"\t, Y: "+Y+"\tmY: "+mY);
  }
  DEBUG_END*/

  // Recalculates movement vector[h, v] using class internal variables
  // The vector is scaled that way that at least one of it's
  // coordinates equals 1, unless it's a 0 vector
  // Therefore, the real speed varies slightly, depending on the direction
  private void vector()
  {
    a=mX-X; // horizontal distance between mouse and ball
    b=mY-Y; // vertical distance between mouse and ball
    // If there is no difference - the vector is 0
    if ( a == 0 && b == 0)
    {
      h=0; 
      v=0;
    }
    else if ( a == 0 )
    {
      h=0; 
      v=b/abs(b);
    }
    else if ( b == 0 )
    {
      h=a/abs(a); 
      v=0;
    }
    else if ( abs(a) >= abs(b) )
    {
      h=a/abs(a); 
      v=b/abs(a);
    }
    else if ( abs(a) < abs(b) )
    {
      h=a/abs(b); 
      v=b/abs(b);
    }
  }

  // Just draws a ball image on X, Y
  private void drawBall()
  {
    // Ball with no border
    noStroke();
    // Set the ball colour
    fill(col);
    // Draw the ball
    // Here we use int(), not round(), because it probably is faster
    ellipse( int(X), int(Y), size, size );
  }

  // main display method - moves the ball and displays it
  // returns false when ball wasn't displayed because
  // it's dead
  public boolean display()
  {
    // This is to make sure that the code won't run when we are dead
    if ( !live )
    {
      return false;
    }

    // Handles mouse release - ignores it when we are already going out the screen
    if ( !goOut && !mousePressed )
    {
      // If mouse is released when the ball is stopped, the ball will be destroyed
      // immediately
      if (stopped)
      {
        // We die
        live=false; return false;
      }
      // Else we indicate that the ball should continue it's movement out of the screen
      else
      {
        goOut=true;
        /*DEBUG_LINE*///      println("Ball "+id+"\t: goOut");
      }

      /*DEBUG_LINE*///      println("Ball "+id+"\t: mouseReleased");
    }

    // Updates the vector when the mouse is moved
    // We shouldn't update the vector when the ball is supposed to go out the screen
    if ( !goOut )
    {
      // Checks if the mouse was dragged
      if ( mouseX!=mX || mouseY!=mY )
      {
        // Update mouse coordinates
        mX=mouseX; 
        mY=mouseY;

        // We update the scaled vector
        vector();

        /*DEBUG_LINE*///        //println("Ball "+id+"\t: Mouse dragged to "+mouseX+ ", "+mouseY);
      }
    }

    // We have to move either if we are not on the mouse position, or we are supposed to go out the screen
    // If we have to go out the screen
    if ( goOut )
    {
      // We check if we aren't out of the screen already
      if ( X > width+size || X < (-1)*size || Y > height+size || Y < (-1)*size )
      {
        // We die
        live=false; return false;
      }
      else
      {
        // We add the vector to coordinates; goOutRatio changes the speed
        X += h*goOutRatio; 
        Y += v*goOutRatio;
      }
    }
    // If we aren't supposed to go out, we check if we haven't reached the mouse
    // We have to use round(); otherwise the ball would miss the target
    else if ( round(X) != mX || round(Y) != mY )
    {
      // We save that the ball is in motion
      stopped=false;

      // We add the vector to coordinates
      X += h; 
      Y += v;
    }
    else
    {
      // We save that the ball is stopped
      stopped=true;
    }
    
    // Finally, we draw the ball
    drawBall();
    
    // We return the status; live should always equal true when we reach here
    return live;
  } // display() end
} // class Ball end
