
PImage tadpole;
PImage green;

int NUM_stuff = 5;
int NUM_stffu = 2;
 
// creating an (empty) global array with a
// capacity of 10 elements of type Ball
stuff[] stuff = new stuff[NUM_stuff];
stffuClass[] stffu = new stffuClass[NUM_stffu];
 
void setup()
{
  tadpole = loadImage("tadpole.png");
  green = loadImage("green.png");
  size(500, 500);
  smooth();
 
 
  for (int i = 0; i < NUM_stuff; i++)
  {
    stuff[i] = new stuff();   // populating the array
 
    stuff[i].x = random(0, width);
    stuff[i].y = random(0, height);
    stuff[i].direction = random(0, 360);
  }
 
  for (int i = 0; i < NUM_stffu; i++)
  {
    stffu[i] = new stffuClass();   // populating the array
 
    stffu[i].x = random(0, width);
    stffu[i].y = random(0, height);
    stffu[i].direction = random(0, 360);
  }
}
 
void draw()
{
  //bg is not conceptually part of the class
  background( 63, 28, 17);
 
  //call the method update everytime I draw
  for (int i = 0; i < NUM_stuff; i++)
  {
    stuff[i].update();
  }
 
  for (int i = 0; i < NUM_stffu; i++)
  {
     stffu[i].update();
  }
}
 
 
class stuff
{
  //parameters of my thing
  float x;
  float y;
  color col = #00FFFF;
  float speed = 1.5;
  float direction = 0;
 
  //Constructor function - same name as the class
  stuff()
  {
    /*
  like the setup in the main sketch the constructor function
     is executed once as soon as the object is created
     */
  }
 
  //method(s) for my thing
  void update()
  {
    /*
    convert direction into radians
     break it down to the sinus and cosinus
     which are the vertical and horizontal component
     of the angle then multiply for speed
     (because in trigonometry you always work with a radius of 1)
     */
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;
 
    //direction++;
 
    //managing borders
    if (x > width)
    {
      x = 0;
    }
 
    if (x < 0)
    {
      x = width;
    }
 
    if (y > height)
    {
      y = 0;
    }
 
    if (y < 0)
    {
      y = height;
    }
 
    if (dX < 0)
    {
      pushMatrix();
      scale(-1.0, 1.0);
      image(tadpole, -x, y,75,75);
      popMatrix();
    }
 
    else
    {
      //draw the thing 
      image(tadpole, x, y,75,75);
    }
  }
}
 
class stffuClass
{
  //parameters of my thing
  float x;
  float y;
  color col = #33190B;
  float speed = 1;
  float direction = 0;
 
  //Constructor function - same name as the class
  stffuClass()
  {
    /*
  like the setup in the main sketch the constructor function
     is executed once as soon as the object is created
     */
  }
  void update()
  {
    /*
    convert direction into radians
     break it down to the sinus and cosinus
     which are the vertical and horizontal component
     of the angle then multiply for speed
     (because in trigonometry you always work with a radius of 1)
     */
    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;
 
    //direction++;
 
    //managing borders
    if (x > width)
    {
      x = 0;
    }
 
    if (x < 0)
    {
      x = width;
    }
 
    if (y > height)
    {
      y = 0;
    }
 
    if (y < 0)
    {
      y = height;
    }
 
 
    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_stuff; i++)
    {
      //temporary variable to store the other
      stuff other = stuff[i];
 
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      float distance;
      //after I determine it's another thing I check the distance
      if ((distance = dist(x, y, other.x, other.y))<255)
      {
        //and do something
       translate(mouseX*.2,mouseY*.2);
       rotate(radians(distance*.3));
      }
    }
 
 
 
    if (dX < 0)
    {
      pushMatrix();
      scale(-1.0, 1.0);
      image(green, -x, y,100,100);
      popMatrix();
    }
 
    else
    {
      //draw the thing 
      image(green, x, y,100,100);
    }
    
  }
}
