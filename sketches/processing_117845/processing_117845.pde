
PImage regGhost;
PImage awkGhost;

int NUM_THINGS = 5;
int NUM_AWKGHOSTS = 2;

// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];
AwkGhostClass[] awkGhosts = new AwkGhostClass[NUM_AWKGHOSTS];

void setup() 
{
  regGhost = loadImage("regghost.png");
  awkGhost = loadImage("awkghost.png");
  size(500, 500); 
  smooth();


  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();   // populating the array

    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }

  for (int i = 0; i < NUM_AWKGHOSTS; i++) 
  {
    awkGhosts[i] = new AwkGhostClass();   // populating the array

    awkGhosts[i].x = random(0, width);
    awkGhosts[i].y = random(0, height);
    awkGhosts[i].direction = random(0, 360);
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

  for (int i = 0; i < NUM_AWKGHOSTS; i++)
  {
    awkGhosts[i].update();
  }
}


class Thing
{
  //parameters of my thing
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

    if (dX < 0)
    {
      pushMatrix();
      scale(-1.0, 1.0);
      image(regGhost, -x, y);
      popMatrix();
    }

    else
    {
      //draw the thing  
      image(regGhost, x, y);
    }
  }
}

class AwkGhostClass
{
  //parameters of my thing
  float x;
  float y;
  color col = #00FFFF;
  float speed = 1;
  float direction = 0;

  //Constructor function - same name as the class
  AwkGhostClass()
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
    for (int i = 0; i < NUM_THINGS; i++)
    {
      //temporary variable to store the other
      Thing other = things[i];

      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      float distance;
      //after I determine it's another thing I check the distance
      if ((distance = dist(x, y, other.x, other.y))<255)
      {
        //and do something
        tint(255, distance);
      }
    }



    if (dX < 0)
    {
      pushMatrix();
      scale(-1.0, 1.0);
      image(awkGhost, -x, y);
      popMatrix();
    }

    else
    {
      //draw the thing  
      image(awkGhost, x, y);
    }
    noTint();
  }
}



