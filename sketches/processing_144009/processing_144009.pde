
//import ddf.minim.*;

/* @pjs font="data/andyb.ttf"; */

//Images and font
PImage hills;
PImage cowPic;
PFont andy = createFont("andy",32);

//Tornado variables
int posx, posy; //Position
int r, g, b; //Color
float distanceCheck; //Distance between pointer and tornado

//Sound stuff
//Minim minim = new Minim(this);
//AudioSample moo;

//Declare and name objects
Cow cow01, cow02, cow03;

void setup() 
{
  size(900, 600);
  background(255);
  smooth();
  
  //Initialize tornado variables
  posx = width/2;
  posy = height/2;
  distanceCheck = 60;
  
  //Load background image
  hills = loadImage("rolling_hills3.jpg");
  //Load cow image
  cowPic = loadImage("cowSmaller.png");
  //Load moo sound
  //moo = minim.loadSample("moo2.wav");
  //Call font
  textFont(andy);
  
  //Initialize objects
  cow01 = new Cow();
  cow02 = new Cow();
  cow03 = new Cow();
}

void draw()
{
  //Call background image
  image(hills, 0, 0);
  
  //Display directions - font
  fill(0);
  text("Click and drag to move tornado", 20, 35);
    
  //Animate cow objects
  cow01.update();
  cow01.display();
  
  cow02.update();
  cow02.display();
  
  cow03.update();
  cow03.display();
  
  //Call tornado function
  tornado(posx, posy, 100, r, g, b);
  if(mousePressed)
  {
    if(dist(posx,posy,mouseX,mouseY) < distanceCheck)
    {
      distanceCheck = 400;
      posx = mouseX;
      posy = mouseY - 50;
      
      //Dirty tornado
      r = 175;
      g = 152;
      b = 152;
    }
  }
  else
  {
    //Clean tornado
    r = 255;
    g = 255;
    b = 255;
  }
     
}

//Begin Cow class block
class Cow
{
  int cposx, cposy; //Declare variables for x and y position
  int cowspeed; //Declare variable for "speed"
  float scl; //Declare variable for cow scale
  int cwidth, cheight; //Declare variable for cow width and height
  boolean goingLeft; //Boolean for cow direction
  int ctDistanceCheck; //Cow/tornado distance checking variable
  int followerx,followery; //Easing follower variables
  float easing = 0.01; //Easing speed
  float targetx, targety; //Easing target variables
    
  //Clas constructor
  Cow()
  {
    //Initial settings
    cposx = -170; //Set x position (random)
    cposy = int(random(200,520)); //Set y position range
    cowspeed = int(random(1,4)); //Set cowspeed
    scl = 1.0; //Set scale
    cwidth = 113; //Set cow image width
    cheight = 80; //Set cow image height
    goingLeft = false; //Set initial direction boolean
    ctDistanceCheck = 50;
    followerx = cposx; //Set follower variables equal to cow position
    followery = cposy;
    
  }
  
  //Method for the "math" behind the object
  void update()
  {
        
    cposx = cposx + cowspeed;
    
    //tornado + cow interaction
    if (dist(posx,posy,followerx,followery)<50)
    {
      //Randomly change location
      cposx = int(random(0,787));
      cposy = int(random(200,520));
      //Moo sound
      //moo.trigger();
    }
    else
    {
      //Making the cow go back and forth at random y values
      if (cposx > width+170) 
      {
        cowspeed = -cowspeed; //Flip direction
        goingLeft = true; //The cow has turned and is now going left
        cposy = int(random(200,520));
      }
      //Back to start position
      if (cposx <= -170)
      {
        cowspeed = -cowspeed;
        goingLeft = false; //The cow has turned and now going right
        cposy = int(random(200,520));
      }
    }
    //Easing

    targetx = cposx;
    targety = cposy;
    followerx += ((targetx - followerx) * easing);
    followery += ((targety - followery) * easing);
    
  }
  
  //Method for drawing the object to the screen
  void display()
  {
  
    pushMatrix();
    translate(followerx,followery);
    if (goingLeft) {scale(-scl,scl);}
    image(cowPic, 0-(cwidth/2), 0-(cheight/2));
    popMatrix();
  }
}
//End Cow class block


//Begin tornado function
void tornado(float x, float y, float h, int r, int g, int b)
{
  pushMatrix();
  
  translate(x,y);
  
  noFill();
  stroke(r, g, b);
  strokeWeight(2);
 
  for(float i = 0; i < h; i += 5)
  {
    float j = map(i, 0, h, 100, 5);
    float k = map(i, 0, h, 15, 1);
     
    ellipse(0+random(2), i+random(2), j, k);
  }
  
  popMatrix();
}
//End tornado function


