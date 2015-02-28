
int NUM_THINGS = 20;
Thing[] things = new Thing[NUM_THINGS];
int NUM_BIGGERTHINGS=20;
BiggerThing[] biggerthings = new BiggerThing[NUM_BIGGERTHINGS];


void setup()
{
  size (500, 500);
  smooth ();


  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i] = new Thing();   // populating the array

    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }
   for (int i = 0; i < NUM_BIGGERTHINGS; i++)
  {
    biggerthings[i] = new BiggerThing();

   biggerthings[i].x = random(0, width);
   biggerthings[i].y = random(0, height);
   biggerthings[i].direction = random(0, 360);
  }

}

void draw()
{
  background(215, 233, 234);
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }

  for (int i = 0; i < NUM_BIGGERTHINGS; i++)
  {
    biggerthings[i].update();
  }


}

class Thing
{

  float myDiameter = 10;
  float x;
  float y;
  color col = #D1D814;
  float speed = 5;
  float direction = 0;

  //Constructor function - same name as the class
  Thing()
  {

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
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);

    /*
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
        }
      }
    }
    */
    ////////////
  }
}

  class BiggerThing
{
  //parameters of my thing
  float myDiameter = 40;
  float x;
  float y;
  color col = #92B0C9;
  float speed = 1;
  float direction = 0;

  //Constructor function - same name as the class
  BiggerThing()
  {

  }

  //method(s) for my thing
  void update()
  {

    float dX = cos(radians(direction))*speed;
    float dY = sin(radians(direction))*speed;


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

    fill(247, 7, 100);
    noStroke();
    ellipse(x, y, 10, 10);
    fill (232, 250, 249);
    ellipse(x, y, 5, 5);
    fill(247, 7, 100, 20);
    ellipse(x, y, myDiameter, myDiameter);
    fill(247, 7, 100);



        }
      }
