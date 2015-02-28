
jitterBug bug; //declare object

void setup()
    {
    size(480, 120);
    smooth();
    //create object and pass in parameters
    bug = new jitterBug(width/2, height/2, 20);
    }
   void draw()
   {
   bug.move();
   bug.display();
   }
class jitterBug 
{
    float x;
    float y;
    int diameter;
    float speed = 2.5;
    //constructor: assign the initial values to the fields when an object is created.
    jitterBug(float tempX, float tempY, int tempDiameter)
    {
    x=tempX;
    y=tempY;
    diameter = tempDiameter;
    }
    

void move() 
{
    x+=random(-speed, speed);
    y+=random(-speed, speed);
}

void display() 
{
ellipse (x,y,diameter, diameter);
}
}
