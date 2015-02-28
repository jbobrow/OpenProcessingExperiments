
int NUM_THINGS = 10;

// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];

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
    things[i].col = color(random(0, 255), random(0, 255), random(0, 255));
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
    col = color(noise(x/50.0)*255.0, noise(y/50.0)*255.0, noise(x/50.0, y/50.0)*255.0);

    //draw the thing 
    fill(col);
    noStroke();
    beginShape();
    vertex(x+ 0, y- 6.5);
    vertex(x+ 1, y+ 0);
    vertex(x+ 4.5, y+ 1);
    vertex(x+ 1, y+ 2);
    vertex(x+ 0, y+ 7.5);
    vertex(x- 1, y+ 2);
    vertex(x- 4.5, y+ 1);
    vertex(x- 1, y+ 0);
    vertex(x+ 0, y- 4.5);
    endShape();



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
          fill(col);
          col = color(noise(x*100)*255.0, noise(y*100)*255.0, noise(x*100, y*100)*255.0);
          noStroke();
          beginShape();
          vertex(x+ 0, y- 13);
          vertex(x+ 2, y+ 0);
          vertex(x+ 9, y+ 2);
          vertex(x+ 2, y+ 4);
          vertex(x+ 0, y+ 15);
          vertex(x- 2, y+ 4);
          vertex(x- 9, y+ 2);
          vertex(x- 2, y+ 0);
          vertex(x+ 0, y- 9);
          endShape();
        }
      }
    }
  }
}

