
/* @pjs font="data/andyb.ttf"; */

PImage hills;
PImage mooCow;
PFont andy = createFont("andy",32);

float posx, posy;

//Elephant elephant01, elephant02; //Declare and name objects

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
  //Load font
  //andy = loadFont("AndyB.vlw");
  textFont(andy);
  
  //Initialize objects
  //moo01 = new Cow();
  //moo02 = new Cow();
}

void draw()
{
  //Call background image
  image(hills, 0, 0);
  
  //Show directions - font
  fill(0);
  //textSize(24);
  //text("Use arrow keys to change number of cows", 20, 35);
  text("Click and hold to move tornado", 20, 70);
  
  //Animate first cow object
  //moo01.update();
  //moo01.display();
  
  //Animate second cow object
  //moo02.update();
  //moo02.display();
  
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
  float cposx, cposy; //Declare variables for x and y position
  float cowspeed; //Declare variable for "speed"
  float sclx, scly; //Declare variables for cow scale
  float cwidth; //Declare variable for cow width
  int cdir; //Declare variable for direction
  
  //Clas constructor
  Cow()
  {
    cposx = random(width); //Set intital x position (random)
    cposy = random(200, 500); //Set intial y position range
    cowspeed = 5; //Set initial cowspeed
    sclx = 0.5; //Set initial x scale
    scly = 0.5; //Set initial y scale
    cwidth = sclx * 320;
    cdir = 1; //Set initial direction
    
  }
  
  //Method for the "math" behind the object
  void update()
  {
    pushMatrix();
    
    cposx += cowspeed * cdir;
    if ((cposx > width - cwidth) || (cposx < 320)) 
    {
      cdir = -cdir; //Flip direction
    }
    if (cdir == 1)
    {
      //pushMatrix();
      scale(sclx, scly);
      image(mooCow, 0, 0 ); //Face right
      //popMatrix();
    }
    else
    {
      //pushMatrix();
      scale(-sclx, scly);
      image(mooCow, -mooCow.width, 0); //Face left
      //popMatrix();
    }
    
    popMatrix();
  }
  
  //Method for drawing the object to the screen
  void display()
  {
    //Draw the cow right
    //scale(0.5, 0.5);
    //image(mooCow, cposx, cposy);
  }
}
//End class block

//Begin class block
class Twister
{
  float tposx, tposy; //Declare variables for x and y position
}
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


