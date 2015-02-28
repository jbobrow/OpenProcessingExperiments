
int NUM_THINGS = 1000;
float partition;;
 
// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];
 
void setup() 
{
  size(500, 500); 
  partition = width/7;
  smooth();
  //frameRate(30);
  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();   // populating the array
 
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }
}
 
void draw() 
{ 
   lights();
  translate(width/2, height/2);
  //bg is not conceptually part of the class
 // background( 0,0,0);
 fill(0, 10);
 rect(-500, -500, 750, 1000);
 
  //call the method update everytime I draw
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
}
 
 
class Thing
{
  //parameters of my thing
  float myDiameter = 1.5;
  float x;
  float y;
  float z;
  color col = #00FFFF;
  float speed = (int(random(-1, 1)))*2.5;
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
    float dX = .8*cos(radians(direction))*-speed;
    float dY = sin(radians(direction))*speed;
   
    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;
    
    direction++;
    //managing borders
    if (x > width)
      x = -width;
    if (x < -width)
      x = width;
    if (y > height)
      y = -height;
    if (y < -height)
      y = height;
 
    
   if(x > partition*5 && y > partition*5)
     speed = 25;
   
    //draw the thing  
    fill(getColor(x));
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    //noStroke();
    
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
          other.speed = 7;
        }
        else
          other.speed = 2.5;
      }
    }
  }
  
  color getColor(float x) {
   
    int v = -width;
    
    if (x < v+partition)
      return color(#FF0000);
    if (x < v+partition*2)
      return  color(#FF7F00);
    if (x < v+partition*3)
      return  color(#FFFF00);
    if (x < v+partition*4)
      return  color(#00FF00);
    if (x < v+(partition*5))
      return  color(#0000FF);
    if (x < v+(partition*6))
      return  color(#6600FF);
    else 
      return  color(#8B00FF);
  }
}


