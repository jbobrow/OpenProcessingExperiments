
ArrayList cubeList=new ArrayList();

void setup() 
{ 
    size(450, 450, P3D);
    shapeMode(CENTER); 
    noStroke();
    createCubes();
} 

void createCubes()
{
 for(int x=-80;x<80;x+=10)
 for(int z=-80;z<80;z+=10)
 {
   Cubes temp = new Cubes(x,0,z,10);    
   cubeList.add(temp);  
 }
    
    
    
}

void draw() 
{
 translateRotateBackgroundLights();   
 drawCubes();
 
}

void drawCubes()
{
    
  for(int x=0;x<cubeList.size();x++)
  {
  ((Cubes)cubeList.get(x)).drawCube();
  }
}

void translateRotateBackgroundLights()
{
    background(100,100,200);
    translate(width/2,height/2);
    rotateY(frameCount/100.1);
    rotateX(PI);
  //  directionalLight(51, 102, 126, 1, -1, 0);

}

class Cubes
{
  int xDisplacement;
  int yDisplacement;
  int zDisplacement;
  float height;
  int cubeSize;
  int rgb[]= {255,0,255};
   
  Cubes(int xDisp,int yDisp,int zDisp,int cubeSize)
  {
   this.xDisplacement=xDisp;
   this.yDisplacement=yDisp;
   this.zDisplacement=zDisp;
   this.cubeSize=cubeSize;   
   height= int(random(-170,170));
  }
   
  void drawCube()
  {
   
   pushMatrix();
   translate(xDisplacement,yDisplacement,zDisplacement);
   fill(255,xDisplacement*2,zDisplacement*2);
   box(cubeSize);
   heightOfBox();
  
   popMatrix();
  }
  
  void heightOfBox()
  {
    
   if(height>0)
   {
     
   float tempH=height*sin(frameCount/100.0 +zDisplacement+xDisplacement);
   while(tempH>0)
   {
   if(tempH<cubeSize)
   {
   translate(0,tempH%cubeSize,0);
   box(cubeSize);
   break; 
   }
   translate(0,cubeSize,0);
   box(cubeSize);  
   tempH-=cubeSize;  
   }
   
   }
   else
   {
   
   float tempH=height*abs(sin(frameCount/100.0+xDisplacement));
   while(abs(tempH)>0)
   {
   if(abs(tempH)<cubeSize)
   {
   translate(0,-abs(tempH)%cubeSize,0);
   box(cubeSize);
   break; 
   }
   translate(0,-cubeSize,0);
   box(cubeSize);  
   tempH+=cubeSize;  
   }
     
     
   }
  }
  
}

