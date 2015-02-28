
int NUM_THINGS = 15;
int NUM_SMALLERTHINGS=50;
 
// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];
SmallerThing[] smallerthings = new SmallerThing[NUM_SMALLERTHINGS];
 
void setup() 
{
  size(500, 500); 
  smooth();
 
 
  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();   // populating the array
 
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }
  
    for (int i = 0; i < NUM_SMALLERTHINGS; i++) 
  {
    smallerthings[i] = new SmallerThing();   // populating the array
 
    smallerthings[i].x = random(0, width);
    smallerthings[i].y = random(0, height);
    smallerthings[i].direction = random(0, 360);
  }
  
}
 
void draw() 
{ 
  //bg is not conceptually part of the class
  background( 0, 0, 0, 50);
 
  //call the method update everytime I draw
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
  
    for (int i = 0; i < NUM_SMALLERTHINGS; i++)
  {
    smallerthings[i].update();
  }
  
}
 
 
class Thing
{
  //parameters of my thing
  float myDiameter = 10;
  float x;
  float y;
  color col = #4593D6;
  float speed = 1;
  float direction = 0;
 
  //Constructor function - same name as the class
  Thing()
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
 
    //draw the thing
    float diameter = random(20, 50);  
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    fill(col, 50);
    ellipse(x, y, diameter, diameter);
    fill(col, 20);
 
    
    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_THINGS; i++)
    {
      //temporary variable to store the other
      Thing other = things[i];
 
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (this != other)
      {
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<100)
        {
          //and do something
          stroke(255);
          line(x, y, other.x, other.y);
          ellipse(x, y, diameter, diameter);
        }
      }
    }
    
    ////////////
  }
}


class SmallerThing
{
  //parameters of my thing
  float myDiameter = 10;
  float x;
  float y;
  color col = #92B0C9;
  float speed = 1;
  float direction = 0;
 
  //Constructor function - same name as the class
  SmallerThing()
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
 
    //draw the thing
    float diameter = random(10, 30);  
    fill(255, 255, 255);
    noStroke();
    ellipse(x, y, 5, 5);
    fill(255, 255, 255, 50);
    ellipse(x, y, diameter, diameter);
    fill(255, 255, 255);
 
    /*
    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_SMALLERTHINGS; i++)
    {
      //temporary variable to store the other
      SmallerThing other = smallerthings[i];
 
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (this != other)
      {
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<100)
        {
          //and do something
          stroke(255);
          line(x, y, other.x, other.y);
          ellipse(x, y, diameter, diameter);
        }
      }
    }
    */
    ////////////
  }
}
