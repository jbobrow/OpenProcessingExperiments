
import processing.opengl.*;

import gifAnimation.*;
GifMaker gifExport;

boolean started=false;


ArrayList cubeList=new ArrayList();

int counter1=0;
float counter=0;
int cubeSize=5;
int yDis=-30;
float counterDir=.00000015;
float counter2=0;
int frames=0;


void setup()
{
  size(1000,400,P3D);
  noStroke();
}


void draw()
{
  counter1++;
  lights();
  background(100,0,13);
  translate(width+150,height/2);
  scale(3);
  pointLight(51, 102, 126, 35, 40, 36);

  if(cubeList.size()<700)
  {
  yDis-=cubeSize;
  for(int x=-height/2+cubeSize*30;x<height/2-cubeSize*30;x+=cubeSize*2)
  cubeList.add(new Cubes(yDis,x,cubeSize));
  }
  for(int x=0;x<cubeList.size();x++)
  {
  rotateX(counter+=counterDir);
  ((Cubes)cubeList.get(x)).drawCube();
  }
  
  if(frameCount%12000==0)
  counterDir*=-1;
}


class Cubes
{
  int xDisplacement;
  int yDisplacement;
  int cubeSize;
  int rgb[]= {255,0,255};
  
  Cubes(int xDisplacement,int yDisplacement, int cubeSize)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.cubeSize=cubeSize;
  
  } 
  
  void drawCube()
  {
   pushMatrix();
   translate(xDisplacement,yDisplacement);
   fill(rgb[0],rgb[1],rgb[2]);
   box(cubeSize); 
   translate(0,cubeSize);
   fill(rgb[1],rgb[0],rgb[2]);
   box(cubeSize);
   popMatrix();
  }
}




