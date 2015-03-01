
int NUM_THINGS = 100;
int NUM_THINGS2 = 200;
// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];
Thing[] things2 = new Thing[NUM_THINGS2];
Thing[] things3 = new Thing[NUM_THINGS2];
  
void setup()
{
  size(800, 800);
  smooth();
 frameRate(15);
  
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i] = new Thing();   // populating the array
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 800);
    things[i].myDiameter = random(0,15);
  }
   
    for (int i = 0; i < NUM_THINGS; i++)
  {
    things2[i] = new Thing();   // populating the array
    things2[i].x = random(0, .25*width);
    things2[i].y = random(0, .25*height);
    things2[i].direction = random(200, 800);
    things2[i].myDiameter = random(0,15);
  }
   
    for (int i = 0; i < NUM_THINGS; i++)
  {
    things3[i] = new Thing();   // populating the array
    things3[i].x = random(0, width);
    things3[i].y = random(0, height);
    things3[i].direction = random(0, 800);
    things3[i].myDiameter = random(0,15);
  }
   
}
  
void draw()
{ 
  background( 0, 0, 0);
  
  //call the method update everytime I draw
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
   
    for (int i = 0; i < NUM_THINGS; i++)
  {
    things2[i].update();
  }
  for(int i = 0; i<NUM_THINGS; i++)
  {
    things3[i].update();
  }
}
  
  
class Thing
{
  //parameters of my thing
  float myDiameter = 15;
  float x;
  float y;
  color col = #EA0707;
  float speed = 3;
  float direction = 0;
  
  
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
    x = x + dY;
    y = y + dX;
  
    direction++;
  
    //managing borders
    if (x > width-30)
    {
      x = 0;
    }
  
    if (x < 0)
    {
      x = width;
    }
  
    if (y > height-30)
    {
      y = 0;
    }
  
    if (y < 0)
    {
      y = height;
    }
  
    //draw the thing 
    noFill();
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
  
 
    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_THINGS; i++)
    {
      //temporary variable to store the other
      Thing other = things[i];
  
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if ( this != other || this == other)
      {
        //after I determine it's another thing I check the distance
        if (dist(y, x, other.y, other.x)<100)
        {
          //and do something
          //stroke(255, 255, 255, 150);
          //noStroke();
          //stroke(255);
          strokeWeight(5);
          //line(y, x, other.x, other.y);
          fill(random(x), random(x), random(x), 50);
           
          //HERE!
           
          rect(x, y, other.x/5, other.y/5);
          //rect(x, y, random(10, 30), random(10, 30));
        }
      }
    }
 
  }
}

