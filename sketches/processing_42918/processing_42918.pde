
int NUM_THINGS = 30;

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
  float myDiameter = 5;
  float x;
  float y;
  color col = #FFFFFF;
  float speed = 2;
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
    float dX = cos(radians(direction/2))*speed;
    float dY = sin(radians(direction/6))*speed;

    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;

    //direction++;

    //managing borders
    if (x > width)
    {
      speed = -speed;
    }

    if (x < 0)
    {
      speed = -speed ;
    }

    if (y > height)
    {
      speed = -speed;
    }

    if (y < 0)
    {
      speed = -speed;
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
        if (dist(x, y, other.x, other.y)<200)
         {
         //and do something
         stroke(255, 255, 255, 20); //lines 
         line(x, y, other.x, other.y);
         //ellipse(x,y,myDiameter*5, myDiameter*5);
         }
        if (dist(x, y, other.x, other.y)<50)
        {
          //and do something
          fill(242, 18, 10, 100);//med circle
          noStroke();
          ellipse(x, y, myDiameter*5, myDiameter*5);
        }
        if (dist(x, y, other.x, other.y)<20)
        {
          fill(126, 15, 28, 100);//inner most circle 
          noStroke();
          ellipse(x, y, myDiameter*10, myDiameter*10);
        }
        if (dist(x, y, other.x, other.y)<5)
        {
          fill(255, 255, 255, 50);//max circle
          noStroke();
          ellipse(x, y, myDiameter*20, myDiameter*20);
        }
        
      }
      if (mousePressed == true) {
        x = mouseX;
        y = mouseY;
      }
    }
  }
}


