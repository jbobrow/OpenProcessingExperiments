
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Doubling Shapes
//URL -> http://padova.webs.com/DoublingShapesSite.html

//This program draws progressively more randomly shaped and colored polygons, inscribed in circles of random size.

//These are the center of the circle in which our polygon is to be inscribed.
int posX;
int posY;

//This is the radius of said circle.
float radius;

//This stores the angle of a vertex of the polygon, as it is drawn.
float holdAngle = 0;

//This stores the number of shapes that are to be drawn.
int number = 1;

void setup()
{
  size(500, 500);
  
  fill(0);
  rect(0, 0, width, height);

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

//This allows the user to reset the number.
void keyPressed()
{
  //Checks for the spacebar.
  if (key == ' ')
  {
    fill(0);
    rect(0, 0, width, height);
    
    //Resets number.
    number = 1;
    
    randomScreen();
  }
}

//This actually draw the 100 shapes.
void randomScreen()
{
  //This is here so it will run 100 times.
  for (int i = 0; i < number; i++)
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
  
  number += number;
}
