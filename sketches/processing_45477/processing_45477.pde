
class Car {
  color c;
  float xpos;
  float ypos;
  float zpos;
  float xspeed;
  
  Car(color tempC, float tempXpos, float tempYpos, 
                  float tempZpos, float tempXspeed) {
    c = tempC;
    xpos =tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display() {
    
    pushMatrix();
    translate(xpos, ypos, zpos);
    fill(c);
    box(20);
    popMatrix();
    stroke(255);
    line(xpos,ypos,zpos,width/2,height/2,-100);
    c=int(random(255));
  }
  void drive() {
    xpos = xpos + xspeed;
    if(xpos > width)
    {
      xpos = 0;
    }
  }
}

Car[] mycar = new Car[100];
color c;

void setup()
{
  size(600,600,P3D);
  for(int i = 0; i< mycar.length; i++)
  {
    mycar[i] = new Car(color(100+(i/2),0+(i/2),255-i),random(width),random(height),
               random(400),random(5)+5);
  }
  frameRate(60);
}

void draw()
{
  background(0);
  ambientLight(100,55,255);
  directionalLight(255,255,255,1,1,1);
  for(int i=0; i<mycar.length; i++)
  {
    float fov = PI/3.0;
    float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
    mycar[i].drive();
    mycar[i].display();
  }
}

