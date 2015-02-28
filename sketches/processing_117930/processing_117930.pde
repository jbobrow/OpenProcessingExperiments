
int NUM_THINGS = 5;

// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];

void setup() 
{

  size(600, 1000, P3D); 
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
  background(0);
  
pointLight(250, 250, 250, 10, 30, 50);

normal(1, 1, 1);
 
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


    translate(200, 300, -y);
    rotateX(x/150);
    rotateY(y/150);
    strokeWeight(1.5);
    noStroke();
    fill(255);
    box(x/1.5);
  }
}
