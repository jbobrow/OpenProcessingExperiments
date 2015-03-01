
/*
  Wish you were... here
  a creative coding project by Jeff Sandefur
  created as part of Creative Coding course from FutureLearn and Monash University

  Artist statement: As part of the Creative Creative coding course, in a way our final, 
  we were to undertake making a 'postcard', using the knowledge we gained fromt he course.
  Being odd, I decided to take the idea of what I post card does, the 'wish you were here'
  aspect, and have the 'here' to be everywhere. 
  
  It is my way of saying "Everywhere is a here to your there, and you are 'here' to everyone
  else's 'there'.
  
  This was based on a heavily modified version of Week 5-2 sketch, with some help from the Week 4 sketches.
*/

// declare array for heres
Here hereIsThere[];
int numHeres = 10;

//set up for image background
PImage bgImg;


void setup() {
  size(700, 350);
  
  // initialises hereIsThere and fills it
  hereIsThere = new Here[numHeres];
  for(int index = 0; index < numHeres; index++)
  {
   float hereSize = constrain(20 + (randomGaussian() * 3), 1, 100);
   println(hereSize);
   hereIsThere[index] = new Here(random(width), random(height), hereSize);
   hereIsThere[index].randomiseDirection();    
  }
  
  //initialize and setup image
  bgImg = loadImage("world_map.png");
}

void draw() 
{
  //ToDo: Add background image, may mean changing font color
  //background(0);
  image(bgImg,0,0);
  for (int index = 0; index < numHeres; index++)
  {
     hereIsThere[index].move();
     hereIsThere[index].show();   
  }
}  



void keyPressed()
{
 if(key == 'r')
  {
   for(int index = 0; index < numHeres; index++)
    {
     //to do, reset all Heres to have new direction and placement.
     //needs to be in class
     hereIsThere[index].reset();    
    } 
  }   
}

/*
 * declaration of the class "Here"
 * reappropriated from the class "Ball" as they do similar things.
 * Which represents the concept of a moving Here with a direction, speed
 * and rate of change in direction.
 *
 */
class Here 
{

  // instance variables
  float x;        // x position
  float y;        // y position
  float speed;    // how fast the Here is moving
  float direction;// direction of travel
  float omega;    // rotational speed
  PFont Font; //font that will be used
  

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Here(float x_, float y_, float hSize)
  {
    // store supplied values in the instance variables
    x = x_;
    y = y_;

    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
    
    //get the font loaded
    Font = loadFont("Papyrus-Regular-72.vlw");
    textFont(Font,hSize);
  }


  // randomiseDirection
  // randomise the speed and direction of the Here
  void randomiseDirection() 
  {
    speed = random(1);
    direction = random(360);
    omega = randomGaussian() * 0.3;
  }

  // move method
  // moves the Here in the current direction
  void move() 
  {
    float dx, dy; 
    /*
     * direction is an angle that represents the current
     * direction of travel.
     * speed is the current speed in units/frame
     */
    dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;
    x += dx;
    y += dy;
    direction += omega;
    checkBounds();
  }

  // checkBounds
  // checks that the Here is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() 
  {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      direction += 180;
      direction = direction % 360;
    }
  }
    

  // display method
  // draws the Here as text that reads "Wish You Were here"
  //
  void show() 
  {
    String theText = "Wish you were here.";
    //noStroke();
    fill(255,0,0);
    //ellipse(x, y, size, size);
    //stroke(255,0,0);
    //point(x,y);
    float tWidth = textWidth(theText);
    text(theText,x - (tWidth/2),y);
  }
  void reset()
  {
   //hereIsThere[index] = new Here(random(width), random(height), hereSize);
   //hereIsThere[index].randomiseDirection(); 
   x = random(width);
   y = random(height);
   this.randomiseDirection();
  }
  
}

