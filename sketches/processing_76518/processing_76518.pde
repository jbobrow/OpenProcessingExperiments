
jitterBug[] bugs = new jitterBug[55]; //declare object
float v = 0.0;
float n = noise(v) * 10.0;

void setup()
    {

    size(480, 480);
    smooth();
    noiseSeed(0);
    //create object and pass in parameters
for (int i =0;i<bugs.length;i++)
    {
     v = v + 0.1;
    float x = random(width);
    float y = random(height); //replacing the initial value declared in constructor
    float z = random(100);
     int r=i+2;
   
    bugs [i] = new jitterBug( x,y,r,z );
    }
    }
void draw()
{
  background(0);
  
    for (int i = 0;i<bugs.length; i++)
      {
       
         bugs[i].move();
         bugs[i].display();
      }
}
class jitterBug
{

    int diameter;
    //float speed = 2.5;
    //float angle = 0.0;
    float scalar = 150;
    float offset = width/2;
    float x;
    float y;
    float z;
    float v=0.0;
    //constructor: assign the initial values to the fields when an object is created.
    jitterBug (float tempX, float tempY, int tempDiameter,float nAngle)
    {
    this.x=tempX;
    this.y=tempY;
    diameter = tempDiameter;
    this.z = nAngle;
    }
     
 
void move()
{
      
      x=offset+n + cos (z)*scalar+n;
      y=offset+n*0.01 + sin (z)*scalar+n*0.01;

}
 
void display()
{
 noStroke();
fill(random(255),100,255,50);
//for (int i=0; i<width;i=i+4)
//{

   ellipse (x,y+n*5,diameter, diameter);
 
//}
//angle += speed;
}

}
