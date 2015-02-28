
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//100 Random Shapes
//URL -> http://padova.webs.com/RandomShapesSite.html

//This program draws 100 randomly shaped and colored polygons, inscribed in circles of random size.

//These are the center of the circle in which our polygon is to be inscribed.
int posX;
int posY;

//This is the radius of said circle.
float radius;

//This stores the angle of a vertex of the polygon, as it is drawn.
float holdAngle = 0;

void setup()
{
  size(500, 500);
  background(0);

  noStroke();

  randomScreen();
}

void draw()
{
}

void mouseClicked()
{
  //These erase the previous screen.
  fill(0);
  rect(0, 0, width, height);
  
  randomScreen();
}

//This actually draw the 100 shapes.
void randomScreen()
{
  //This is here so it will run 100 times.
  for (int i = 0; i < 100; i++)
  {
    //These randomly assign the current shape a center.
    posX = int(random(20, width-20));
    posY = int(random(20, height-20));

    //This gives it a random radius.
    radius = random(10, 20);

    //This gives the polygon a random number of sides between 3 and 9.
    int sides = int(random(3, 10));

    //This gives the polygon a random, bright color, with some transparency.
    fill(63+191*random(0, 1), 63+191*random(0, 1), 63+191*random(0, 1), 191);

    beginShape();

    //This draws the individual vertices.
    for (int j = 0; j < sides; j++)
    {
      //This changes the angle randomly, such that it won't (in all likelihood) overlap itself.
      holdAngle += random(PI/6, 2*PI/sides);

      //This places the vertex, based on all of the previous randomised values.
      vertex(posX+radius*cos(holdAngle), posY+radius*sin(holdAngle));
    }

    endShape();
  }
}
