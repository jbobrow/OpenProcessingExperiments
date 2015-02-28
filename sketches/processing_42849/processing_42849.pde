
int NUM_THINGS = 110;
int outnum = 300;
 
// creating an (empty) global array with a
// capacity of 10 elements of type Ball
Thing[] things = new Thing[NUM_THINGS];
Outside[] border = new Outside[outnum];

void setup() 
{
  size(500, 500);
 // background(255); 
  smooth();
 
 
  for (int i = 0; i < NUM_THINGS; i++) 
  {
    things[i] = new Thing();   // populating the array
    things[i].x = random(0, width);
    things[i].y = random(0, height);
    things[i].direction = random(0, 360);
  }
  
   for (int i = 0; i < outnum; i++) 
  {
    border[i] = new Outside();
    border[i].x = random(0, width);
    border[i].y = random(0, height);
    border[i].direction = random(0, 360);
  }
}
 
void draw() 
{ 
   background(5, 5, 20);
 
  //call the method update everytime I draw
  for (int i = 0; i < NUM_THINGS; i++)
  {
    things[i].update();
  }
  noFill();
  strokeWeight(80);
  stroke(5, 5, 20);
  ellipse(250, 250, 350, 350);
  
  for (int i = 0; i < outnum; i++)
  {
    border[i].update();
  }
}
 
 
class Thing
{
  //properties of my thing
  float myDiameter = 2;
  float x;
  float y;
  color col = #FAFA97;
  float speed = 1;
  float direction = 5; //they have the same speed but the direction in which they move is different
  
  //this is a constructor
  //it is a block of instruction that sets up everything from the beginning
//  Thing()
//  {
//    fill(col);
//    ellipse(x, y, myDiameter, myDiameter);
//  }
 
  //method(s) for my thing
  void update()
  {
    /*
    convert direction into radians
     break it down to the sinus and cosinus
     which are the vertical and horizontal components 
     of the angle then multiply for speed 
     (because in trigonometry you always work with a radius of 1)
     */
    float dX = cos(radians(direction))*speed/2;
    float dY = sin(radians(direction))*speed/2;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX*mouseX;
    y = y + dY*mouseY;
 
    direction++; //since you are increasing the angle of the directions by one, the objects circle around in a circle
    
    
    int big = 400;
    int small = 100;
    //managing borders
    if (x > big)
    {
      x = small;
    }
 
    if (x < small)
    {
      x = big;
    }
 
    if (y > big)
    {
      y = small;
    }
 
    if (y < small)
    {
      y = big;
    }
 
    //draw the thing 
    fill(col);
    noStroke();
    strokeWeight(0);
    ellipse(x, y, myDiameter, myDiameter);
 
    
  //  example of interaction among things//
  //  every object scans the other objects using the global array
    for (int i = 0; i < NUM_THINGS; i++)
   {
      //temporary variable to store the other
      Thing other = things[i];
 
      //it's not a good idea to make the thing interact with itself
      //this points to the specific instance
      if (this != other) //other is a variable
     {
       //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<100)
        {
          direction++;
          //and do something
          stroke(255);
          noFill();
          point(x, y);
        }
      }
    }
  }
}


 
class Outside
{
  float myDiameter = 2;
  float x;
  float y;
  color col = #BDDAFC;
  float speed = 2;
  float direction = 10; //they have the same speed but the direction in which they move is different
  
  //method(s)
  void update()
  {
   
    float dX = cos(radians(direction))*speed*2;
    float dY = sin(radians(direction))*speed*2;
 
    //the result are the steps in the vertical and horizontal direction
    x = x + dX;
    y = y + dY;
 
    direction++; //since you are increasing the angle of the directions by one, the objects circle around in a circle
 
    //managing borders
    if (x > width)
    {
      x = 380;
    }
 
    if (x < 0)
    {
      x = 120;
    }
 
    if (y > height)
    {
      y = 380;
    }
 
    if (y < 0)
    {
      y = 120;
    }
 
    //draw the thing  
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
//    beginShape();
//    curveVertex(x,  y);
//    curveVertex(x,  y);
//    curveVertex(x-10,  y-25);
//    curveVertex(x-20,  y-15);
//    curveVertex(x+15, y+10);
//    curveVertex(x+15, y+10);
//    endShape();
 
    

  }
}

