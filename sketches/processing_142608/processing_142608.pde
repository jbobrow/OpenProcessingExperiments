
/* @pjs font="data/andyb.ttf"; */

PImage hills;
PImage mooCow;
PFont andy = createFont("andy",32);

int posx, posy;
int r, g, b;
float distanceCheck;

//Declare and name objects
Cow moo01;

void setup() 
{
  size(900, 600);
  background(255);
  smooth();
  
  posx = width/2;
  posy = height/2;
  distanceCheck = 60;
  
  //Load background image
  hills = loadImage("rolling_hills3.jpg");
  //Load cow image
  mooCow = loadImage("cowSmall.png");
  //Call font
  textFont(andy);
  
  //Initialize objects
  moo01 = new Cow();
}

void draw()
{
  //Call background image
  image(hills, 0, 0);
  
  //Display directions - font
  fill(0);
  text("Use arrow keys to change number of cows", 20, 35);
  text("Click and hold to move tornado", 20, 70);
  
  //Animate first cow object
  moo01.update();
  moo01.display();
  
  //Call tornado function
  tornado(posx, posy, 75, r, g, b);
  if(mousePressed)
  {
    if(dist(posx,posy,mouseX,mouseY) < distanceCheck)
    {
      posx = mouseX;
      posy = mouseY - 25;
      distanceCheck = 400;
      r = 54;
      g = 26;
      b = 26;
    }
  }
  else
  {
    r = 255;
    g = 255;
    b = 255;
  }
    
}

//Begin class block
class Cow
{
  int cposx, cposy; //Declare variables for x and y position
  int cowspeed; //Declare variable for "speed"
  float scl; //Declare variable for cow scale
  int cwidth, cheight; //Declare variable for cow width and height
  boolean goingLeft;
  
  //Clas constructor
  Cow()
  {
    //Initial settings
    cposx = -170; //Set x position (random)
    cposy = int(random(200, 450)); //Set y position range
    cowspeed = int(random(1,5)); //Set cowspeed
    scl = 1.0; //Set scale
    cwidth = 160; //Set cow image width
    cheight = 113; //Set cow image height
    goingLeft = false;
  }
  
  //Method for the "math" behind the object
  void update()
  {
        
    cposx = cposx + cowspeed;
    
    if (cposx > width + 170) 
    {
      cowspeed = -cowspeed; //Flip direction
      goingLeft = true; //The cow has turned and is now going left
      cposy = int(random(200, 450));
    }
    
    //Back to start position
    if (cposx <= -170)
    {
      cowspeed = -cowspeed;
      goingLeft = false; //The cow has turned and now going right
      cposy = int(random(200, 450));
      
    }
  }
  
  //Method for drawing the object to the screen
  void display()
  {
    pushMatrix();
    translate(cposx, cposy);
    if(goingLeft) {scale(-scl, scl);}
    image(mooCow, 0-(cwidth/2), 0-(cheight/2));
    popMatrix();
  }
}
//End class block

void tornado(float x, float y, float h, int r, int g, int b)
{
  pushMatrix();
  
  translate(x,y);
  
  noFill();
  stroke(r, g, b);
  strokeWeight(2);
 
  for(float i = 0; i < h; i += 5)
  {
    float j = map(i, 0, h, 60, 5);
    float k = map(i, 0, h, 15, 1);
     
    ellipse(0+random(2), i+random(2), j, k);
  }
  
  popMatrix();
}


