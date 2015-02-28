
//hw12 CMU 48-757 copywrite Zack Jacobson-Weaver 2011
//pseudo 3D screen saver will blow your mind. i recommend
//projecting this in a dark room while listening to 
//"Shine On You Crazy Diamond" by Pink Floyd

float x,y,z,deltaX,deltaY,deltaZ,volume;

color col;

Figure [] figures = new Figure[int (random(0,100))];

void setup()
{
  size (400,400,P3D);
  col= color(random( 256),random( 256),random( 256));
  x = 0;
  y = 0;
  z = 0;
  volume = random(20,200);
  deltaX = 0;
  deltaY = 0;
  deltaY = 0;
  
  for(int i = 0; i < figures.length; i++)
{
  figures[i] = new Figure(x,y,z,volume,deltaX,deltaY,deltaZ);
}
}

void draw()
{
  lights();
  background(0,0,0,10);
  
   for (int i = 0; i < figures.length; i ++)
  {
  figures[i].display();
  figures[i].moveFig();
  }
 
}

class Figure
{
  float x;
  float y;
  float z;
  float volume;
  float deltaX;
  float deltaY;
  float deltaZ;
 
   Figure(float x_, float y_, float z_, float volume_,
   float deltaX_, float deltaY_, float deltaZ_)
  {
    x = x_;
    y = y_;
    volume = volume_;
    deltaX = deltaX_;
    deltaY = deltaY_;
    deltaZ = deltaZ_;
  } 

void display()
{
  strokeWeight(5);
  stroke(random(256),col,col);
  fill(col);
  translate(x,y,z);
  box(volume); 
}

void moveFig()
{
  
deltaX = random(-5,2);
deltaY = random(-5,2);
deltaZ = random(10);

y = y + deltaY;
x = x + deltaX;  
z = z + deltaZ;

if(z > 400)
{
  z = random (-1000);
  volume = volume + random(1,25);
  x =  random(-20,width + 20);
  y =  random(-20,height + 20);
  col = color (255,random(256), col*7, 90);
}

}

}




