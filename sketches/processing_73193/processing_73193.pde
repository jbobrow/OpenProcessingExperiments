
//Victoria Hu, In The Cube, CP1 mods 16/17

float x = 0;
int Y = 0;
int Z = 0;
int Zchange = 1;
int Ychange = 1;
void setup()
{
  size(600,500,P3D);
  frameRate(15);
}
void draw()
{
  background(5);
  camera(mouseX-100,mouseY-200,2*mouseX-300,0,0,0,0,1,0);
  translate(50,50,0);
  rotateX(x);
  if(x>=0)
    {
      x = x + .1;
    } 
  rotateY(x);
  ball();
  cube();
}
void cube()
{ 
  fill(255,255,255,100);
  lights();
  pointLight(255,0,255,-235,-240,275);
  pointLight(250,250,250,300,300,-300);
  box(100);
}
void ball()
{
  Y = Y + Ychange;
  if(Y>=20)
   {
    Ychange = -1;
   }
  if(Y<=-20)
   {
    Ychange = 1;
   }
  Z = Z + Zchange;
  if(Z>=25)
   {
    Zchange = -1;
   }
  if(Z<=-25)
   {
    Zchange = 1;
   }
  translate(Y,Y,Z);
  lights();
  lightSpecular(0);
  fill(244,2,2,150);
  noStroke();
  sphere(30);
  translate(-Y,-Y,-Y);
  noLights();
}

  
