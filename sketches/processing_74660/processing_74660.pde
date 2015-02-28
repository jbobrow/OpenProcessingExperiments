
//ROWAN CASSIUS, CP1, B7
int ranX = 10;
int ranY = 10;
int ranZ = 10;
int sph = 10; 
int num = 1;
void setup()
{
  //background(0);
  size(600,600,P3D);
  //frameRate(.1);
}
void draw()
{  
  
  lights();
  
  while(num<=100)
  {

  noStroke();
  ranX = int(random(10,591));
  ranY = int(random(10,591));
  //ranZ = int(random(10,-500));
  translate(ranX,ranY,ranZ);
  fill(int(random(0,226)),int(random(0,226)),int(random(0,226)),100);
  sph = int(random(7,int(random(20,90))));
  sphere(sph);
  translate(-ranX,-ranY,-ranZ);
  num++;
  }
}
void mouseClicked()
{
 
    num = 1;
    background(int(random(0,226)),int(random(0,226)),int(random(0,226)));

}


