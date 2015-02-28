
/* @pjs font="data/andyb.ttf"; */

PImage hills;
PImage mooCow;
PFont andy = createFont("andy",32);

float posx, posy;

//Declare and name objects
Cow moo01;

void setup() 
{
  size(900, 600);
  background(255);
  smooth();
  
  posx = width/2;
  posy = height/2;
  
  //Load background image
  hills = loadImage("rolling_hills3.jpg");
  //Load cow image
  mooCow = loadImage("cow1.png");
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
  tornado(posx, posy, 75);
  if(mousePressed)
  {
    
    if(dist(posx,posy,mouseX,mouseY) < 50)
    {
       posx = mouseX;
       posy = mouseY;
    }
  }
}

//Begin class block
class Cow
{
  int cposx, cposy; //Declare variables for x and y position
  int cowspeed; //Declare variable for "speed"
  int sclx, scly; //Declare variables for cow scale
  int cwidth, cheight; //Declare variable for cow width and height
  boolean goingLeft;
  
  //Clas constructor
  Cow()
  {
    //Initial settings
    cposx = -170; //Set x position (random)
    cposy = 250; //Set y position range
    cowspeed = 4; //Set cowspeed
    sclx = 1; //Set x scale
    scly = 1; //Set y scale
    cwidth = 160; //Set cow image width
    cheight = 113; //Set cow image height
    //cdir = 1; //Set direction
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
    }
    
    //Back to start position
    if (cposx <= -170)
    {
      cowspeed = -cowspeed;
      goingLeft = false; //The cow has turned and now going right
      
    }
    
  }
  
  //Method for drawing the object to the screen
  void display()
  {
    pushMatrix();
    translate(cposx,cposy); //From here on 0.0 will be at x,y
    if(goingLeft) {rotate(PI);} //If the cow is going left, rotate the cow 180 degrees
    image(mooCow, 0-(cwidth/2), 0-(cheight/2)); // Draw the image so it's center point is at 0,0
    popMatrix();
  }
}
//End class block

void tornado(float x, float y, float h)
{
  pushMatrix();
  
  translate(x,y);
  
  noFill();
  stroke(255);
  strokeWeight(2);
 
  for(float i = 0; i < h; i += 5)
  {
    float j = map(i, 0, h, 60, 5);
    float k = map(i, 0, h, 15, 1);
     
    ellipse(0+random(2), i+random(2), j, k);
  }
  
  popMatrix();
}


