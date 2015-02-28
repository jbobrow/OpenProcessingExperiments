
/* @pjs font="lucon.ttf"; */

// Margins of the active area
// (where squirrel can move and where nuts disappear)
final int LEFT_MARGIN = 2;
final int RIGHT_MARGIN = 2;
final int BOTTOM_MARGIN = 10;
// Maximal number in equation
final int MAX = 10;

// Stores if the last answer was correct or incorrect
int lastAnswer;
final int BAD_ANSWER = 0;
final int GOOD_ANSWER=1;


// Do not exceed 10, infinitive loop will happen
// cause all nuts need to be different
final int ANSWERS_N = 3;

boolean gameRunning = false;
boolean roundFinished = false;
// if score should be displayed when app goes back to start screen
boolean scoreDisplay = false;

// nut image is here to request it only once, in setup function
PImage nutImg;

// how many rounds there are per game
final int ROUNDS_PER_GAME = 5;

int roundFinishedTimeoutCounter=0;
// The amount of frames the round result should be displayed
final int ROUND_FINISHED_TIMEOUT=90;


// Background instance
Background bg;
// Current equation instance
Equation cEquation;
// Previous equation instance
Equation pEquation;
// Squirrel instance
Squirrel sq;

// Font
PFont mono;
// Starting image
PImage startImg;

// Array of nuts
Nut [] nuts=new Nut [ANSWERS_N];

// Boolean switch for pausing
boolean paused = false;

// roundsWon
int roundsWon = 0;
// roundsWon possible
int rounds = 0;
// Rounds counter

// Correct nut ID
int correctNut;

void setup ()
{
  size(800, 600);
  // framerate decreased to make the game run more fluently
  frameRate(30);
  
  // Loading font
  mono = createFont("lucon.ttf", 50);
  textFont(mono);
  
  // Loading starting image
  startImg = requestImage("start.png");
  // Load nut image
  nutImg = requestImage("acorn.png");
  
  // Creating objects
  bg = new Background();
  sq = new Squirrel();
  cEquation = new Equation();
}



void draw ()
{
  // Background display
  bg.display();
  
  // If game is not started - display starting screen
  // and wait for the user to click anywhere
  if ( !gameRunning )
  {
    // Display start image (prevent null pointer error when the image hasn't loaded yet)
    if ( startImg.width > 0 )
    {
      imageMode (CENTER);
      // Display the img in the middle of the screen
      image ( startImg, width/2, height/2);
      // Switch the mode back to normal
      imageMode (CORNER);
    }
    // Display score, if needed
    if ( scoreDisplay )
    {
      textAlign(CENTER, TOP);
      textSize(50);
      fill(255);
      text("GAME FINISHED!\nYOU SCORED " + str(roundsWon) + " OUT OF " + str(rounds), width/2, 91);
      textAlign(BASELINE);
    }
    // If any mouse button is pressed, start the game
    if ( mousePressed )
    {
      // reset counters
      rounds = 0;
      roundsWon = 0;
      // start game
      gameRunning = true;
      // start a new round
      newRound();
    }
  }

  // If the game is not paused, calling all objects to move
  // Pause also stops the game between rounds - that's why 'frame-based timer'
  // is used instead of millis() timing
  if ( !paused && gameRunning )
  {
    if ( roundFinished == false )
    {
      sq.move();
      for ( int i=0; i < ANSWERS_N; i++ )
      {
        nuts[i].move();
        // If squirrel collides with one of nuts
        if ( sq.collidesWith(nuts[i]) )
        {
          nuts[i].destroy();
          // If the nut was the correct one
          if ( i == correctNut )
          {
            roundsWon++;
            rounds++;
            lastAnswer=GOOD_ANSWER;
            roundFinished=true;
          }
          else
          {
            // Increase only roundsWon that was possible to be gained
            rounds++;
            lastAnswer=BAD_ANSWER;
            roundFinished=true;
          }
        }
        // Checking if any nut hits the ground
        if ( nuts[i].hitsGround() )
        {
          nuts[i].destroy();
          // Check if that was the nut with the correct answer - if so, the round is lost
          if ( i == correctNut )
          {
            // Increase only roundsWon that was possible to be gained
            rounds++;
            lastAnswer=BAD_ANSWER;
            roundFinished=true;
          }
        }
      }
    } // if-round-not-finished if end
    // when the round is finished
    else if ( roundFinishedTimeoutCounter < ROUND_FINISHED_TIMEOUT )
    {
      roundFinishedTimeoutCounter++;
      // display correct result on red or green if the answer was okay
      if ( lastAnswer == BAD_ANSWER )
      {
        cEquation.showCorrect();
      }
      else
      {
        cEquation.confirmCorrect();
      }
    }
    else
    {
      roundFinishedTimeoutCounter=0;
      roundFinished=false;
      newRound();
    }
  }// pause and gamseStarted-handling if end
  
  
  
  // Calling all objects to display
  if ( gameRunning )
  {
    for ( int i=0; i < ANSWERS_N; i++ )
    {
      nuts[i].display();
    }
  }
  // squirrel is in front of nuts
  sq.display();
  
  if ( gameRunning )
  {
    // equation is in front of everything
    cEquation.display();
    displayScore();
  }
  
} // draw() end

// Handles keyPressed event for restarting and pausing the game
void keyPressed()
{
  // if space pressed - pause
  if ( key == ' ' && gameRunning )
  {
    // switch paused state
    paused = paused? false : true;
  }
} // keyPressed() end

// Starts a new round, if the maximal number of rounds hasn't been reached
void newRound ()
{
  if ( rounds >= ROUNDS_PER_GAME )
  {
    // stop the game
    gameRunning = false;
    // tell that the score has to be displayed
    scoreDisplay = true;
    /*DEBUG_LINE_OFF*///println("Game finished");
  }
  else
  {
    // Generate new equation, different than the previous one
    // Save current equation as the previous one
    pEquation = cEquation;
    // Loop that ensures new equiation is different than the previous one
    do
    {
      cEquation = new Equation();
    }
    while ( cEquation.equals(pEquation) );
    
    // Select which nut is correct
    correctNut = round( random(0, ANSWERS_N-1) );
    
    // Create new nuts, including the one with correct answer
    for (int i=0; i < ANSWERS_N; i++)
    {
      if ( i == correctNut )
      {
        nuts[i] = new Nut( cEquation.getResult(), -80-250*i );
      }
      else
      {
        int temp=0;
        boolean confirmed=false;
        // Ensure there every nut is different
        while ( !confirmed )
        {
          confirmed = true;
          // Randomize new number
          temp = round(random(0,MAX-1));
          // Compare the number with all previous nuts
          for (int j=0; j < i; j++)
          {
            if ( temp == nuts[j].getNumber() )
            {
              confirmed=false;
            }
          }
          // Compare the number with the correct answer
          if ( temp == cEquation.getResult() )
          {
            confirmed=false;
          }
        }
        nuts[i] = new Nut(  temp ,  -80-250*i  );
      }
    }
  } // main if end
} // newRound() end

void displayScore ()
{
  textAlign(LEFT, TOP);
  textSize(25);
  fill(255);
  text("Score: " + str(roundsWon) + " / " + str(rounds), 400, 16);
}
class Background
{
  PImage bgimage;
  
  public Background ()
  {
     background(#5AC4FF);
     bgimage = requestImage("background.png");
  }
  
  void display()
  {
    if ( bgimage.width == 0 )
    {
        // backup refresh with colour
        background(#5AC4FF);
      /*DEBUG_LINE_OFF*///println("BACKGROUND NOT LOADED YET...");
    }
    else if ( bgimage.width == -1 )
    {
        // backup refresh with colour
        background(#5AC4FF);
      /*DEBUG_LINE_OFF*///println("ERROR WHILE LOADING!");
    }
    else
    {
      image( bgimage, 0, 0 );
    }
  }
}
// This class will display the message somewhere on the tree

class Equation
{
// Two numbers of the equation
private int a, b;
private int result;
// Type of the equation - subtraction or addition
boolean type;

// Equation types flags
private final boolean SUBTRACTION = false;
private final boolean ADDITION = true;

// Color of equation text
color eCol=color(255);

private String message;

// Constructor of equation - generates and stores new equation and its result
public Equation()
{
 // select type randomly - must use round() instead of int(), otherwise
 // getting '1' would be extremely inprobable
 type =  round(random(1))==0? false : true;
 
 // Genreating the equation
 if ( type == SUBTRACTION )
 {
   // a will be the larger or equal number, from 0 to MAX
   a = round ( random(0, MAX) );
   // b should be smaller than or equal a, but the result should be lower than MAX
   if ( a == MAX )
   {
     b = round ( random(1, a) );
   }
   else
   {
     b = round ( random(0, a) );
   }
   
   // Storing the result
   result = a - b;
 }
 else if (type == ADDITION)
 {
   // Sum should be lower than MAX
   // a will now be the larger number
   a = round ( random(0, MAX-1) );
   // a+b should be lower than MAX
   b = round ( random(0, MAX-1-a) );
   
   // order the numbers in the equation randomly
   // (50% chance to swap them)
   if ( round( random(0, 1) ) == 1 )
   {
     int temp=a;
     a=b;
     b=temp;
   }
   
   result = a + b;
 }
 
 // Save the message string
 message = str(a) + " " + (type? "+" : "-") + " " + str(b) + " = ?";
  
} // Constructor Equation() end

// method displaying the equation
public void display()
{
  textAlign(RIGHT, TOP);
  fill (eCol);
  textSize(50);
  text (message, 321, 24);
}

// function displaying red correct answer
public void showCorrect()
{
  // Reddish colour for bad equation
  eCol=color(#FF766F);
  // set message to correct equation
  message = str(a) + " " + (type? "+" : "-") + " " + str(b) + " = " + str(result);
  // display the message
  display();
}

// function displaying green correct answer
public void confirmCorrect()
{
  // Greenish colour for correct equation
  eCol=color(#48DE64);
  // set message to correct equation
  message = str(a) + " " + (type? "+" : "-") + " " + str(b) + " = " + str(result);
  // display the message
  display();
}

// Accessors

public boolean getType()
{
  return type;
}

public int getA()
{
  return a;
}

public int getB()
{
  return b;
}

public int getResult()
{
  return result;
}


// Function to compare equations
public boolean equals(Equation eq)
{
  if ( eq.getType()==type && eq.getA()==a && eq.getB()==b )
  {
    return true;
  }
  return false;
}

} // class Equation end
class Nut
{
// variables here
private int x,y;    //coordinates of the nut
private int speed = 2;
private color c;      //color
private int number;
public final int R = 38;
private final int NWIDTH = 75;
private final int NHEIGHT = 75;
boolean alive = true;


// Constructor
Nut (int inNumber, int inY)
{
  number = inNumber;
  //start in random x location
  x = round( random(LEFT_MARGIN, width-RIGHT_MARGIN-NWIDTH) );
  y = inY;
  c = color (75,40,20); //color brown
}

//make nut fall down screen
void move()
{
  if ( alive )
  {
    y+=speed;
  }
}
 
//if nut hits ground
// if y = -1 then make that nut fall again

// Display method that draws the nut in (x, y)
void display()
{
  if ( alive )
  {
    if ( nutImg.width == 0 )
    {
      /*DEBUG_LINE_OFF*///println("NUT IMAGE NOT LOADED YET...");
    }
    else if ( nutImg.width == -1 )
    {
      /*DEBUG_LINE_OFF*///println("ERROR WHILE LOADING NUT IMAGE!");
    }
    else
    {
      image( nutImg, x, y );
      fill (0);
      textAlign(LEFT, TOP);
      textSize(50);
      text ( str(number), x+22, y+15);
    }
  }
} // display() end

// Checks if nut hasn't reached the ground
boolean hitsGround()
{
  if ( y >= height - BOTTOM_MARGIN - NHEIGHT )
  {
    return true;
  }
  return false;
}

// Stops displaying the nut
void destroy()
{
  y = -500; // change the position so that the squirrel cannot hit the nut again
  alive = false; // stop moving and displaying the object
}




//then run followig sequence
//check equation
//display message
//message ="correct answer" or "incorrect answer"

// Accessor methods

public int getR()
{
  return R;
}

public int getCentreX()
{
  return x + NWIDTH/2;
}

public int getCentreY()
{
  return y + NHEIGHT/2;
}

public int getNumber()
{
  return number;
}

} // class Nut end


class Squirrel
{
/*
 *  Squirrel frames order in the array:
 *  stopped, starting, accelerating, moving, stopping
 */

// ANIMATION SEQUENCE CONSTANTS
// Constants for frame range boundaries, showing different movement phases
private final int STOPPED_FRAME = 0;
private final int STARTING_END_FRAME = 1;
private final int ACCELERATING_END_FRAME = 2;
private final int RUNNING_BEGIN_FRAME = 3;
private final int RUNNING_END_FRAME = 8;
private final int STOPPING_END_FRAME = 9;

// Constant for total number of frames
private final int NUMBER_OF_FRAMES = 10;
// Frame duration in milliseconds - actual time used is that value / MAX_SPEED
private final int FRAME_DURATION = 610;

// OTHER CONSTANTS
// The fraction of MAX_SPEED the squirrel has when accelerating
private final float ACCELERATION_RATIO = 0.5;
private final float STOPPING_RATIO = 0.6;
// Full speed - pixels/frame
private final float MAX_SPEED = 10;
// Constants for squirrel dimensions
private final int SWIDTH = 285;
private final int SHEIGHT = 134;
// Radius for collsion detection - public
public final int R = 116;

// Movement vector
private float vector;

// "If any arrow is pressed"  variable
private boolean arrowPressed = false;

// Direction flags
private final int DIR_LEFT = -1; // also the vector direction
private final int DIR_RIGHT = 1; // also the vector direction
// Direction variable - right by default
private int direction = DIR_LEFT;
 
// Movement stage flags
private final int STOPPED = 0;
private final int MOVING = 1;
private final int STOPPING = 2;
// Movement stage variable
private int stage = STOPPED;

// Boundary reaching variable
private boolean leftBoundary = false;
private boolean rightBoundary = false;

private int lastFrameMillis = 0;

// Arrays of frames for both left and right movement
private PImage [] leftFrames;
private PImage [] rightFrames;

// Movement variables
private int x, y;

// Frame files - paths and suffix/extension
private final String IMG_SUFFIX = ".png";
private final String L_PREFIX = "sl";
private final String R_PREFIX = "sr";

// Index of current frame
private int cframe;

// A constructor of a Squirrel that initialises its variables
public Squirrel()
{
  // Initialise the arrays
  leftFrames = new PImage [NUMBER_OF_FRAMES];
  rightFrames = new PImage [NUMBER_OF_FRAMES];
  
  // Loop loading the images from files
  for (int i=0; i < NUMBER_OF_FRAMES; i++)
  {
    // Loading left-motion cframe number i
    leftFrames[i] = requestImage( L_PREFIX + str(i) + IMG_SUFFIX );
    
    // Loading right-motion cframe number i
    rightFrames[i] = requestImage( R_PREFIX + str(i) + IMG_SUFFIX );
  }
  
  // Set initial cframe
  cframe = STOPPED_FRAME;
  
  // Set initial squirrel x position on right of the active area
  x = width - RIGHT_MARGIN - SWIDTH;
  // Set initial squirrel y position on the grass
  y = height - SHEIGHT - BOTTOM_MARGIN;
  
} // Squirrel() constructor end

// Moving method
public void move ()
{
  // Check if the edge of permitted movement area has been reached
  if ( x <= LEFT_MARGIN )
  {
    // Save that left boundary has been reached
    leftBoundary = true;
    // Stop the squirrel immediately
    vector = 0;
    // Animate the stopping
    stage = STOPPING;
  }
  else if ( x + SWIDTH >= width - RIGHT_MARGIN )
  {
    // Save that right boundary has been reached
    rightBoundary = true;
    // Stop the squirrel immediately
    vector = 0;
    // Animate the stopping
    stage = STOPPING;
  }
  
  // (processing has some problem with key handling and
  //  arrows movement doesn't work as expected, i.e. when switching
  //  arrows rapidly, it takes some time to react or doesn't react at all).
  // Movement - getting keyboard events, checking if squirrel hasn't reached boundaries
  // reset the 'any arrow pressed' status
  arrowPressed = false;
  if ( keyPressed )
  {
    if ( key == CODED )
    {
      if ( keyCode == LEFT )
      {
        // Check if left boundary isn't reached
        if ( !leftBoundary )
        {
          /*DEBUG_LINE_OFF*///text ("L", 300, 50);
          // Reset right boundary
          rightBoundary = false;
          stage = MOVING;
          direction = DIR_LEFT;
          arrowPressed=true;
        }
      }
      else if ( keyCode == RIGHT )
      {
        if ( !rightBoundary )
        {
          /*DEBUG_LINE_OFF*///text ("R", 300, 50);
          // Reset left boundary
          leftBoundary = false;
          stage = MOVING;
          direction = DIR_RIGHT;
          arrowPressed=true;
        }
      }
    }
  }
  // If the squirrel was already moving, but the arrow is no longer pressed
  if ( arrowPressed == false && stage == MOVING )
  {
    stage = STOPPING;
  }
  
  // ###### ANIMATING AND MOVING ######
  // Animation sequence is connected with movement features
  // Limits the animation speed
  if ( millis() - lastFrameMillis  >=  FRAME_DURATION/MAX_SPEED )
  {
    // Save time
    lastFrameMillis = millis();
    // Animation switching sequence
    if ( stage == MOVING )
    {
      // go to next frame
      cframe++;
      if ( cframe <= STARTING_END_FRAME )
      {
        // empty - just to make the conditions sequence easier
      }
      // Accelerating frames - starting sequence omitted
      else if ( cframe <= ACCELERATING_END_FRAME )
      {
        setVectorLen( MAX_SPEED * ACCELERATION_RATIO );
      }
      // Full speed movement frames
      else if ( cframe < RUNNING_END_FRAME )
      {
        // Set vector length to full speed
        setVectorLen(MAX_SPEED);
        
      }
      // if we have reached the end of running animation
      else if ( cframe > RUNNING_END_FRAME ) 
      {
        // overrite cframe to the beginning of running animation
        cframe = RUNNING_BEGIN_FRAME;
      }
    }
    else if ( stage == STOPPING )
    {
      // when user releases the arrow when the movement wasn't started yet
      // (prevents 'animating to stopped frame, but not moving' case)
      if  ( cframe <= STARTING_END_FRAME )
      {
        // stop the squirrel immediatelly
        cframe = STOPPED_FRAME;
        stage = STOPPED;
        /*DEBUG_LINE_OFF*///println("-\nIMMEDIATE STOP");
      }
      // was already moving - not stopped yet
      else if ( cframe < STOPPING_END_FRAME )
      {
        vector *= STOPPING_RATIO; // decrease the vector STOPPING_RATIO times
        cframe++;
      }
      else if ( cframe == STOPPING_END_FRAME )
      {
        cframe = STOPPED_FRAME;
        stage = STOPPED;
        vector = 0;
      }
    }
    
    
  }
  
  // Move the squirrel
  x += vector;
  
  /*DEBUG_BLOCK_BEGIN_OFF 
  switch ( stage )
  {
    case STOPPED:
      text("STOPPED", 320, 50 );
      break;
    case MOVING:
      text("RUNNING", 320, 50);
      break;
    case STOPPING:
      text("STOPPING", 320, 50);
      break;
  }
  DEBUG_BLOCK_END_OFF*/
  
} // move() end

// Displaying method
public void display()
{
  if ( direction == DIR_LEFT )
  {
    if ( leftFrames[cframe].width == 0 )
    {
      /*DEBUG_LINE_OFF*///println("LEFT FRAME "+cframe+" NOT LOADED YET...");
    }
    else if ( leftFrames[cframe].width == -1 )
    {
      /*DEBUG_LINE_OFF*///println("ERROR WHILE LOADING!");
    }
    else
    {
      image( leftFrames[cframe], x, y );
    }
  }
  else if ( direction == DIR_RIGHT )
  {
    if ( rightFrames[cframe].width == 0 )
    {
      /*DEBUG_LINE_OFF*///println("RIGHT FRAME "+cframe+" NOT LOADED YET...");
    }
    else if ( rightFrames[cframe].width == -1 )
    {
      /*DEBUG_LINE_OFF*///println("ERROR WHILE LOADING!");
    }
    else
    {
      image( rightFrames[cframe], x, y );
    }
  }
} // display() end

// Sets length of the vector
private void setVectorLen (float vectorLength)
{
  vector = direction * vectorLength;
} // setVectorLen end()

// Returns X coord of centre
private int getCentreX ()
{
  return x + SWIDTH/2;
}

// Returns Y coord of centre
private int getCentreY ()
{
  return y + SHEIGHT/2;
}

// Method to detect collision with nut
public boolean collidesWith(Nut nut)
{
  // Compare distance - circle-based collision system
  if ( pow( nut.getCentreX() - this.getCentreX(), 2) + pow( nut.getCentreY() - this.getCentreY(), 2) <= pow( nut.getR() + R, 2 ) )
  {
    return true;
  }
  return false;
}

} // Squirrel class end
