
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
    things[i].count = random(0, 1000);
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
 
 float count = 0;
 
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
    count++;
    
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

    noStroke();
    //body
    fill(255, 255, 255, 150);
      ellipse(x+9, y+25, myDiameter+30, myDiameter+100); 
   //hand
   fill(255, 255, 255, 120);   
      ellipse(x+40, y+25, myDiameter+3, myDiameter+5); 
    //eyes
        fill(200, 200, 0);
   
   if(count % 100 > 0 && count % 100 < 5)
   { 
    
  }
  else
    {
      ellipse(x, y, myDiameter+5, myDiameter-4);
    ellipse(x+18, y, myDiameter+5, myDiameter-4);
    //pupils
    fill(0);
    ellipse(x, y, myDiameter-7, myDiameter-7);
    ellipse(x+18, y, myDiameter-7, myDiameter-7);
    }
    
    //pumpkin
    fill(155, 100, 0);
          ellipse(x+30, y+48, myDiameter+3, myDiameter+15); 
          ellipse(x+37, y+48, myDiameter+3, myDiameter+17); 
          ellipse(x+44, y+48, myDiameter+3, myDiameter+17);
          ellipse(x+51, y+48, myDiameter+3, myDiameter+15);
//pumpkin eyes
fill(0);
triangle(x+31, y+48, x+34, y+42, x+37, y+48);
triangle(x+43, y+48, x+46, y+42, x+49, y+48);
//pumpkin mouth
triangle(x+33, y+51, x+36, y+54, x+39, y+51);
triangle(x+37.5, y+51, x+40.5, y+54, x+43.5, y+51);
triangle(x+42, y+51, x+45, y+54, x+48, y+51);



 
    /*
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
        }
      }
    }
    */
    ////////////
  }
}
