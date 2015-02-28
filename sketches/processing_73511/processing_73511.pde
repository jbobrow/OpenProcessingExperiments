
int x= 1;
float decimal=0.8;
void setup()
{
  size(300, 300, P3D);
  frameRate(20);
  background(0);
}
void draw()
{
  {
    fill(157,39,21);
    camera(200, 200, 300, 0, 0, 0, 0, 1, 0);
    translate(20, 60, 0);
    rotateY(0.3);
    rotateX(0.4+decimal);
    box(100);
    decimal= decimal +0.02;
    }
  {
    fill(25,147,41);
    camera(80,80,300,1,1,1,1,1,1);
    translate(80,120,0);
    rotateY(0.5);
    rotateX(0.6+decimal);
    sphere(50);
  }
   {
     
     
      camera(300,300,300,0,0,0,0,1,1);
      translate(0,-10,-100);
      rotateY(0.5);
      rotateX(0.6+decimal);
      sphere(50);
   }
   
}
