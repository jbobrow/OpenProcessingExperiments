
////BITCH, CREATE A COLOR ARRAY AND SET things[i].color to it


int NUM_THINGS = 30;
int NUM_BOUNCYS = 5;

// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Bouncy[] bouncys = new Bouncy[NUM_THINGS];
Thing[] things = new Thing[NUM_THINGS];
color[] colors = {
  #81FF97, #198B2D, #07DE2C
};

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
  
  for (int i = 0; i < NUM_BOUNCYS; i++) 
  {
    bouncys[i] = new Bouncy();   // populating the array

    bouncys[i].x = random(0, width);
    bouncys[i].y = random(0, height);
    bouncys[i].ySpeed = random(-3, 3);
    bouncys[i].xSpeed = random(-3, 3);
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
    things[i].col = colors[i%3];
  }
  for (int i = 0; i < NUM_BOUNCYS; i++)
  {
    bouncys[i].col = #AAAAAA;
    bouncys[i].update();
  }
}


class Bouncy
{
  //parameters of my thing
  float myWidth = 35;
  float myHeight = 18;
  float x;
  float y;
  color col = #AAAAAA;
  float xSpeed = -1;
  float ySpeed = -1;
  float direction = 0;

  //Constructor function - same name as the class
  Bouncy()
  {
  }

  //method(s) for my thing
  void update()
  {

    //the result are the steps in the vertical and horizontal direction
    x = x + xSpeed;
    y = y + ySpeed;

    //direction++;

    //managing borders
    if (x > width)
    {
      xSpeed *= -1;
    }

    if (x < 0)
    {
      xSpeed *= -1;
    }

    if (y > height)
    {
      ySpeed *= -1;
    }

    if (y < 0)
    {
      ySpeed *= -1;
    }

    //draw the thing  
    fill(col);
    noStroke();
    ellipse(x, y, myWidth, myHeight);
  }
}

class Thing
{
  //parameters of my thing
float myDiameter = 15;
float x;
float y;
color col = #00FFFF;
float speed = -1;
float direction = 0;
boolean bounced = false;

//Constructor function - same name as the class
Thing()
{
}
void update()
{
  float dX = cos(radians(direction))*speed;
  float dY = sin(radians(direction))*speed;
  x = x + dX;
  y = y + dY;
  if (x > width)
  {
    x = 0;
    bounced = false;
  }

  if (x < 0)
  {
    x = width;
    bounced = false;
  }
  if (x < width/4)
  {
    bounced = false;
  }

  if (y > height)
  {
    y = 0;
    bounced = false;
  }

  if (y < 0)
  {
    y = height;
    bounced = false;
  }
  fill(col);
  noStroke();
  ellipse(x, y, myDiameter, myDiameter);
  for (int i = 0; i < NUM_THINGS; i++)
  {
    Bouncy check = bouncys[i % NUM_BOUNCYS];
    Thing other = things[i];
    if (this != other)
    {
      if (dist(x, y, other.x, other.y)<50)
      {
        if (bounced == false)  {
          y = y*19 + other.y;
          y /= 20;
          y *= 1.01;
          other.bounced = false;
        }
        if (bounced == true)  {
          y = y*19 + other.y;
          y /= 20;
          y *= .99;
        }
        stroke(255);
        line(x, y, other.x, other.y);
      }
      if (dist(x, y, check.x, check.y)<30)
      {
      check.col = #064CD3; 
      bounced = true;
      }
      
    }

  ////////////
}
}
}               
