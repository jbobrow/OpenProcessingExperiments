
int NUM_THINGS = 50;

// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];

void setup() 
{
  size(720, 720); 
  smooth();


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
  //bg is not conceptually part of the class
  background( 0, 0, 0);

  //call the method update everytime I draw
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
}


class Thing
{
  //parameters of my thing
  float myDiameter = 10;
  float x;
  float y;
  color col = #00FFFF;
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
    fill(col);
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
      if (this != other)
      {
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<25+i)
        {
          //and do something
          stroke(0, 125+i, 200+i);
          noFill();
          ellipse(other.x, other.y, 25+i, 25+i);
          other.x = x;
          other.y = y;
        }
      }
    }

    ////////////
  }
}
