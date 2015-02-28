
int NUM_ATOMS = 30;
int NUM_RADIOACTIVE = 10;
 
// creating an (empty) global array with a
// capacity of 10 elements of type Ball
//Thing[] things = new Thing[NUM_ATOMS];
Atom[] atoms = new Atom[NUM_ATOMS];
RadioActive[] raParticles = new RadioActive[NUM_RADIOACTIVE];
 
void setup() 
{
  size(500, 500); 
  smooth();
 
 
  for (int i = 0; i < NUM_ATOMS; i++) 
  {
    atoms[i] = new Atom(#FFFFFF, 10, 1);   // populating the array
 
    atoms[i].x = random(0, width);
    atoms[i].y = random(0, height);
    atoms[i].direction = random(0, 360);
  }
  
  for (int j = 0; j < NUM_RADIOACTIVE; j++) 
  {
    raParticles[j] = new RadioActive(#FF0000, 50, 3);   // populating the array
 
    raParticles[j].x = random(0, width);
    raParticles[j].y = random(0, height);
    raParticles[j].direction = random(0, 360);
  }
}
 
void draw() 
{ 
  //bg is not conceptually part of the class
  background( 0, 0, 0);
 
  //call the method update everytime I draw
  for (int i = 0; i < NUM_ATOMS; i++)
  {
    atoms[i].update();
  }
  
  for (int j = 0; j < NUM_RADIOACTIVE; j++)
  {
    raParticles[j].update();
  }
}
 
 
class Thing
{
  //parameters of my thing
  float myDiameter;
  float x;
  float y;
  color col;
  float speed;
  float direction = 0;
 
  //Constructor function - same name as the class
  Thing()
  {
  }
  
  /*Thing(color c)
  {
    col = c;
  }*/
 
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
    
    display();
    interact();

    //draw the thing 
    /*
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
    interact(); 
    */
 
    /*
    //example of interaction among things//
    //every object scans the other objects using the global array
    for (int i = 0; i < NUM_ATOMS; i++)
    {
      //temporary variable to store the other
      Thing other = things[i];
 
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (this != other)
      {
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<50)
        {
          //and do something
          stroke(255);
          direction = other.direction;
          line(x, y, other.x, other.y);
        }
      }
    }//end interaction loop */
  }//end update
  
  void display() {
    //TO BE OVERRIDDEN
  }//end draw
  
  void interact() {
    //TO BE OVERRIDDEN
  }//end interact
}//end class


class Atom extends Thing{
  
  Atom(color c, int d, float s)
  {
    col = c;
    myDiameter = d;
    speed = s;
  }
  
  void display()
  {
    fill(col, int(random(100,255)) );
    ellipse(x, y, myDiameter + int(random(0,30)), myDiameter + int(random(0,30)) );
    fill(col);
    noStroke();
    ellipse(x, y, myDiameter, myDiameter);
  }
  void interact() {
    for (int i = 0; i < NUM_ATOMS; i++)
    {
      //temporary variable to store the other
      Atom other = atoms[i];
 
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      if (this != other)
      {
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<50)
        {
          //and do something
          strokeWeight(5);
          stroke(col, int(random(0,100)));
          direction = other.direction;
          line(x, y, other.x, other.y);
          col = #FFBE6F;
        }
      }
    }
  }//end interact
}

class RadioActive extends Thing{
  
  RadioActive(color c, int d, float s)
  {
    col = c;
    myDiameter = d;
    speed = s;
  }
  
  void display(){
    fill(col, int(random(100,255)) );
    noStroke();
    triangle(x,y, x+ 20, y + 20, x+20, y-20);
  }
  
  void interact() {
    for (int i = 0; i < NUM_ATOMS; i++)
    {
      //temporary variable to store the other
      //RadioActive other = raParticles[i];
      Atom other = atoms[i];
 
      //it's not a good idea to make theinteract with itself
      //this points to the specific instance
      //if (this != other)
      //{
        //after I determine it's another thing I check the distance
        if (dist(x, y, other.x, other.y)<50)
        {
          //and do something
          strokeWeight(5);
          stroke(col, int(random(0,255)));
          //direction = other.direction;
          line(x, y, other.x, other.y);
          //other.direction = 10000 -other.direction;
          other.direction = other.direction  - 10000000;
          other.col = #FFFFFF;
        }
      //}
    }
  }//end interact
}
