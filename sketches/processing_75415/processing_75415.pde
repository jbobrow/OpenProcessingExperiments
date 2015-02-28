
int NUM_LITTLE_THINGS = 10;
int NUM_BIG_THINGS=3;
int[] selectionHistory= new int[500];
int count=1;

// creating an (empty) global array with a
// capacity of 10 elements of type Ball
LittleThing[] littleThings = new LittleThing[NUM_LITTLE_THINGS];

BigThing[] bigThings=new BigThing[NUM_BIG_THINGS];
//////////////////////////////////////////////////////////////////////////

void setup() 
{
  size(500, 500); 
  smooth();


  for (int i = 0; i < NUM_LITTLE_THINGS; i++) 
  {
    littleThings[i] = new LittleThing();   // populating the array

    littleThings[i].x = random(0, width);
    littleThings[i].y = random(0, height);
    littleThings[i].direction = random(0, 360);
  }
  for (int i=0; i<NUM_BIG_THINGS;i++) {
    bigThings[i] = new BigThing();   // populating the array

    bigThings[i].x = random(0, width);
    bigThings[i].y = random(0, height);
    bigThings[i].direction = random(0, 360);
  }
}


////////////////////////////////////////////////////////////


void draw() 
{ 
  //bg is not conceptually part of the class
  background( 0, 0, 0);

  //call the method update everytime I draw
  for (int i = 0; i < NUM_LITTLE_THINGS; i++)
  {
    littleThings[i].update();
  }
  for (int i = 0; i < NUM_BIG_THINGS; i++)
  {
    bigThings[i].update();
  }
  count++;
  if (count==500)
    count=1;
  if (mousePressed==true)
    selectionHistory[count]=1;
  else
    selectionHistory[count]=0;
}

///////////////////////////////////////////////////////

class BigThing {
  float myDiameter = 25;
  float x;
  float y;
  int r=170;
  int g=5;
  int b=5;
  float speed = random(1, 5);
  float direction = 0;
  float friction=.02;
  float minSpeed=random(.3, 3);

  //Constructor function - same name as the class
  BigThing()
  {
    /*
  like the setup in the main sketch the constructor function 
     is executed once as soon as the object is created
     */
  }


  //////////////////////////////////////////////////////////////////////
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

    ///////////////////////
    if (speed>0)
      speed=speed - speed*friction/speed;
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

    ///////Set dragability
    if (mousePressed==true && abs(mouseX-x)<20 && abs(mouseY-y)<20) {
      x=mouseX;
      y=mouseY;
    }

    //draw the thing  
    fill(r, g, b);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);


    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_BIG_THINGS; i++)
    {
      //temporary variable to store the other
      BigThing other = bigThings[i];

      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (this != other)
      {
        if (mousePressed==true && abs(mouseX-x)<20 && abs(mouseY-y)<20 && dist(x, y, other.x, other.y)<200) {
          stroke(255);
          line(x, y, other.x, other.y);
        }
        //////////////////////////////
        if (mousePressed==false && selectionHistory[count-1]==1 && abs(mouseX-x)<20 && abs(mouseY-y)<20 && dist(x, y, other.x, other.y)<200) {
          direction= (x-other.x)/(y-other.y);
          other.speed=map(dist(x,y,other.x,other.y),0,200,0,10);
        }
        ///////////////////////////////////////////////////////////////////////

        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<100)
        {
          //and do something

          stroke(255);
          line(x, y, other.x, other.y);
        }
      }
    }
    //////////////////////////////////
    for (int i = 0; i < NUM_LITTLE_THINGS; i++)
    {
      //temporary variable to store the other
      LittleThing other = littleThings[i];

      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (mousePressed==true && abs(mouseX-x)<20 && abs(mouseY-y)<20 && dist(x, y, other.x, other.y)<200) {
        stroke(255);
        line(x, y, other.x, other.y);
      }
      //////////////////////////////
        if (mousePressed==false && selectionHistory[count-1]==1 && abs(mouseX-x)<20 && abs(mouseY-y)<20 && dist(x, y, other.x, other.y)<200) {
          direction= radians((x-other.x)/(y-other.y)*360);
          other.speed=map(dist(x,y,other.x,other.y),0,200,0,10);
        }
        ///////////////////////////////////////////////////////////////////////
      //after I determine it's another thing I check the distance
      if (dist(x, y, other.x, other.y)<100)
      {
        //and do something
        stroke(255);
        line(x, y, other.x, other.y);
      }
    }

    /////////
  }
}

///////////////////////////////////////////////////////////

class LittleThing 
{
  //parameters of my thing
  float myDiameter = 10;
  float x;
  float y;
  color col = #00FFFF;
  float speed = random(1, 5);
  float direction = 0;
  float friction=.04;
  float minSpeed=random(.3, 3);

  //Constructor function - same name as the class
  LittleThing()
  {
    /*
  like the setup in the main sketch the constructor function 
     is executed once as soon as the object is created
     */
  }


  //////////////////////////////////////////////////////////////////////
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

    ///////////////////////
    if (speed>0)
      speed=speed - speed*friction/speed;
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

    ////////////select
    if (mousePressed==true && abs(mouseX-x)<10 && abs(mouseY-y)<10) {
      x=mouseX;
      y=mouseY;
    }
    //draw the thing  
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);


    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_LITTLE_THINGS; i++)
    {
      //temporary variable to store the other
      LittleThing other = littleThings[i];

      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (this != other)
      {
        if (mousePressed==true && abs(mouseX-x)<20 && abs(mouseY-y)<20 && dist(x, y, other.x, other.y)<200) {
          stroke(255);
          line(x, y, other.x, other.y);
        }
        
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<100)
        {
          //and do something
          stroke(255);
          line(x, y, other.x, other.y);
        }
      }
    }

    /////////
  }
}
