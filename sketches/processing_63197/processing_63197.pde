
import processing.opengl.*;



ArrayList cubeList=new ArrayList();

int counter1=0;
float counter=0;
int cubeSize=15;
int yDis=-30;
float counterDir=.0000001;

void setup()
{
  size(300,600,P3D);
  //smooth();
  noStroke();
    
}


void draw()
{
  counter1++;
  lights();
  background(100,100,150);
  translate(width/2,height);
  
  if(cubeList.size()<590)
  {
  yDis-=cubeSize;
  for(int x=-width/2+cubeSize*2;x<width/2;x+=cubeSize)
  cubeList.add(new Cubes(x,yDis,cubeSize));
  }
  for(int x=0;x<cubeList.size();x++)
  {
  rotateY(counter+=counterDir);
  ((Cubes)cubeList.get(x)).drawCube();
  }
  
 // box(cubeSize);
 

 

  
}


class Cubes
{
  int xDisplacement;
  int yDisplacement;
  int cubeSize;
  int rgb[]= {100,255,50};
  int rgbDir[]= {1,1,1};

  Cubes(int xDisplacement,int yDisplacement, int cubeSize)
  {
   this.xDisplacement=xDisplacement;
   this.yDisplacement=yDisplacement;
   this.cubeSize=cubeSize;
   rgb[1]=xDisplacement%255;
   rgb[2]=xDisplacement%255;
   
  } 
  
  void drawCube()
  {
   changeColors();
   pushMatrix();
   translate(xDisplacement,yDisplacement);
   fill(rgb[0],rgb[1],rgb[2]);
   box(cubeSize); 
   popMatrix();
  }
  
  void changeColors()
  {
   for(int x=0;x<3;x++)
   if(rgb[x]>=255||rgb[x]<=40)
   rgbDir[x]*=-1;
   
  // for(int x=0;x<3;x++)
  // rgb[x]+=rgbDir[x];
   
  
    
  }
  
}



