
import saito.objloader.*;

OBJModel pot;

Tpot[] bob;
float rotX = 0;
float rotY = 0;

void setup()
{
  size(600, 400, P3D);
  pot = new OBJModel(this, "teapot.obj", "absolute",QUADS);
  pot.enableDebug();
  //head = new OBJModel(this, "MyHead.obj", "relative", QUADS);
  bob = new Tpot[10];
  for (int i = 0; i < bob.length; i++)
    bob[i] = new Tpot();
  noStroke();
}
void draw()
{
  background(0);
  pointLight(255, 255, 255, -100, -100, 400);  
  //camera(-100,y,z,0, 0, 0, 0, 1, 0);
  translate(width/2, height/2, 0);
  rotateX(rotY);
  rotateY(rotX);
  for (int i = 0; i < bob.length; i++)
  {
    bob[i].show();
    bob[i].move();
  }
}
void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}

class Tpot
{
  float rotY, rotZ, changeZ, changeY; 
  int orbitRadius, c;
  Tpot()
  {
    rotZ = random(PI/3);
    rotY = random(2*PI);
    changeZ = random(.005, .025);
    changeY = random(-.02, .02);
    orbitRadius = int(random(50, 300));
    c = color(random(256), random(256), random(256));
  }
  void move()
  {
    rotY+=changeY;
    rotZ +=changeZ;
    if (rotZ > PI/3 || rotZ < 0)
      changeZ = -changeZ;
  }
  void show()
  {
    fill(c);
    rotateY(rotY);
    translate(0, 0, orbitRadius);
    rotateZ(rotZ);
    pot.draw();
    rotate(-rotZ);
    translate(0, 0, -orbitRadius);
    rotateY(-rotY);
  }
}


