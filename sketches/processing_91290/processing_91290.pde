
/* 
declare asteroids array

setup
initialize asteroids array
loop: construct each new asteroid

asteroids:
ID tag
x position
y posiition
x speed
y speed
rotation speed
rotation amount
color

*/

Asteroid[] myAsteroid;
//myAsteroids is the particular instance of the class
//outlinePoint[] myOutlinePoint;

void setup()
{
  size(800,600);
  myAsteroid=new Asteroid[40];
    for (int i=0;i<myAsteroid.length;i++)
  {
   myAsteroid[i]=new Asteroid(i); //the asteroid gets assigned a number in the array
  }  
}

void draw()
{
  background(0);
  //start-starfield
  pushMatrix();
  translate(40,60);
  fill(255);
    ellipse(30,30,random(0,5),random(0,5));
    ellipse(350,150,random(0,3),random(0,3));
    ellipse(300,300,random(2,5), random(2,5));
    ellipse(100,100,random(2,5),random(2,5));
    ellipse(150,200,random(0,3),random(0,3));
    ellipse(400,40,random(0,3),random(0,3));
    ellipse(330,320,random(0,3),random(0,3));
    ellipse(405,35,random(1,4),random(1,4));
    ellipse(500,270,random(0,3),random(0,3));
    ellipse(610,250,random(0,3),random(0,3));
    ellipse(45,270,random(3,6),random(3,6));
  frameRate(30);
  popMatrix();

  //end-starfield

  for (int i=0;i<myAsteroid.length;i++)
  {
   myAsteroid[i].show();
   myAsteroid[i].wraparound();
   myAsteroid[i].move(); 
   //myOutlinePoint
  }
  
}
class Asteroid
{
  int ID; 
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float rotationSpeed;
  float rotationAmount; //radians (always radians)
  float radius;
  float[]outlinePoint;
  color Color;
  
  Asteroid(int ID_) //object constructor not filling it this time
    //not doing Asteroid (float xPosition_, float yPosition_) we are not giving any arguments at the moment and we are building everything in the constructor by itself
    //exception is ID number
    //object setup
  {
    ID=ID_;
    xPos=random(0, width);
    yPos=random(0, height);
    xSpeed=random(-0.5, 0.5);
    ySpeed=random(-0.5, 0.5);
    rotationSpeed=radians(random(-1.5, 1.5));
    rotationAmount=0; //it starts at zero
    radius=random(5, 45);
    Color = color(int(random(200)),int(random(200)),int(random(200))); 

    //each asteroid is an array of random points away from the center
    outlinePoint= new float[8];
    for (int i=0;i<outlinePoint.length;i++)
    {
      outlinePoint[i]=random(.5, .99)*radius; //so that the points are within the raidus of the asteroid itself
    }
  }

  void show()
  {
    float degAround=360/outlinePoint.length; //space points 360/number of points away from each other
    pushMatrix();
    translate(xPos, yPos);
    rotate(rotationAmount);
    smooth();
    stroke(32);
    strokeWeight(1);
    //fill(random(0,150), random(0,150), random(0,150));
    fill(Color);
    beginShape();
    for (int i=0;i<outlinePoint.length;i++)
    {
      float x=sin(radians(degAround*i))*outlinePoint[i];
      float y=cos(radians(degAround*i))*outlinePoint[i];
      vertex(x, y); //these are the verteces
    }
    endShape(CLOSE);
    popMatrix();
  }

  void move()
  {
    xPos=xPos+xSpeed;
    yPos=yPos+ySpeed;
  }

  void wraparound() //keeps the asteroids within our stage
  {
    if (xPos>width) xPos=0;
    if (xPos<0) xPos=width;
    if (yPos>height) yPos=0;
    if (yPos<0) yPos=height;
  }
}



