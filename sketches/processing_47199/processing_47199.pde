
class Car {
  color c;
  float xpos;
  float ypos;
  float zpos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, float tempZpos, float tempXspeed) {
    c = tempC;
    xpos =tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display() {
    pushMatrix();
    translate(xpos, ypos, zpos);
    fill(c);
    box(50);
    popMatrix();
  }
  void drive() {
    xpos = xpos + xspeed;
    if(xpos > width)
    {
      xspeed = xspeed * -1;
    }
    else if(xpos < 0)
    {
      xspeed = xspeed * -1;
    }
  }
}

Car[] mycar = new Car[200];

void setup()
{
  size(500,500,P3D);
  for(int i = 0; i< mycar.length; i++)
  {
    mycar[i] = new Car(color(100+(i/2),0+(i/2),255-i),random(width),random(height),random(100),random(5)+2);
  }
  frameRate(100);
}

void draw()
{
  background(0);
  ambientLight(102,55,102);
  directionalLight(0,0,0,1,1,-1);
  for(int i=0; i<mycar.length; i++)
  {
    float fov = PI/3.0;
    float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
    mycar[i].drive();
    mycar[i].display();
    strokeWeight(1);
  }
}

