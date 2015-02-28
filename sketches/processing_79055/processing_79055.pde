
import peasy.*;

PeasyCam cam;
Circle circle1, circle2;

float  Xu,Xv, x0u, x0v, sigmaX,A;
int x,y,z;
 int radius = 500;
  int nrOfCells = 12;
  float cellHeight = 120;
  float baseAngle =0;
  
 int  ucount;
 int  vcount;
 int  wcount;
  int resolution;
  ArrayList mypoints;
 ArrayList mysurface;
ArrayList mysolid;
   
//NURBS_surface surface;
//NURBS_solid solid;

float weight1, weight2, weight3, weight4;
float a1,a2,a3,b1,b2,b3;
int i = 0;

void setup()
{
 size(800,600,P3D); 
   cam = new PeasyCam(this, 800);
  cam.setMinimumDistance(300);
  cam.setMaximumDistance(900);

circle1 = new Circle(0,0,0,0,0,0,150);
float a = 2*PI/nrOfCells;
circle2 = new Circle(150*sin(a),150*cos(a),0,baseAngle,0,-a,cellHeight);
}


void draw()
{
circle2.rx = 10*sin((float)i/50)+radius;
float a = 2*PI/nrOfCells + 10*sin((float)i/100);
circle2.x = 150*sin(a);
circle2.y = 150*cos(a);
circle2.rz = -a;
   rotateX(1.2);
  rotateZ(0.5);
 background(0);
 directionalLight(128, 128, 128, 3, 1, -1);
 directionalLight(30, 30, 30, -3, -1, 1);
 ambientLight(128, 128, 128);
 //camera(-500, 600, 50, 150, 150, 200, 0, 0, -1);
// camera(zoom*sin((float)i/150),zoom*cos((float)i/150),300,0, 0, 50, 0, 0, -1);
i++;

displayAxis(100);
circle1.render();
circle2.render();


}
 
 
void displayAxis(int a)
{
  int w = a;
  //Axis system visualisation
//X is red
stroke(255,0,0);
line(0,0,0,w,0,0);
//Y is green
stroke(0,255,0);
line(0,0,0,0,w,0);
//Z is blue
stroke(0,0,255);
line(0,0,0,0,0,w);
}
 
 //draw the points
//stroke(0);
//   fill(255,255,0);
// rect(int(pt11.x)-3, int(pt11.y)-3, 6,6);
//  rect(int(pt12.x)-3, int(pt12.y)-3, 6,6);
//   rect(int(pt13.x)-3, int(pt13.y)-3, 6,6);
//    rect(int(pt14.x)-3, int(pt14.y)-3, 6,6);

/*void mousePressed()
{
  saveFrame(resolution+"res curved space.bmp");
}*/


class NURBS_solid
{
   float px,py,pz, tx,ty,tz;
   float sigmaX;
   int ucount;
   int vcount;
   int wcount;
   int resolution=10;//default

   
  NURBS_solid(int u, int v, int w, int res)
  {
   ucount = u;
   vcount = v;
   wcount = w;
   resolution = res;

   sigmaX = resolution/2;
   create();
  }

void create()
{
 for(int k=0; k<(wcount-1)*resolution; k++)// in the (w) direction with resolution
  {
      for(int m=0; m<(vcount-1)*resolution; m++)// in the (v) direction with resolution
      {
    
          for(int n=0;n<(ucount-1)*resolution; n++)//in world y direction, same as (u) direction for now
          {
           float weight;
           float totalweight=0;
           tx=0;//for every row for now
           ty = 0;
           tz = 0;
           //loop through the coordinates in (w)
           for(int w = 0; w < wcount; w++)
           {
             //loop through the coordinates in (v)
             for(int v = 0; v < vcount; v++)
              {
             //loop through the coordinates in (u)
                  for(int u = 0; u < ucount ;u++)
                  {
                    int x0u = u * resolution; 
                    int x0v = v * resolution; 
                    int x0w = w * resolution;
                    
                    Pt b = (Pt)mypoints.get(u+(ucount*v)+((ucount*vcount)*w));
                    px = b.loc.x;
                    py = b.loc.y;
                    pz = b.loc.z;
                    weight =  gauss(n,m,k,x0u,x0v,x0w,sigmaX);
                     
                    //adding this point to the total interpolated point, according to it's weight
                    tx = tx + px * weight;
                    ty = ty + py * weight;
                    tz = tz + pz * weight;
                    totalweight = totalweight + weight;
                     
                    //visualisation outside the shape
                   // x = n;
                   // y=(int)-weight+3*height/4;  
                   // z=v*100;
                   // stroke(255,255,0);
                   // point(x,y,z);
                  }
              }
           }
        //after having looped through all the points at our 
        //current u position we can place a point in the global coordinate system
           tx = tx / totalweight;//totalWeight
           ty = ty / totalweight;
           tz = tz / totalweight;
          
          mysolid.add(new Pt(new PVector(tx,ty,tz), color(200,255)));
          println("added");
         }
      }
  }
}
float gauss(float x1, float x2, float x3, float b1, float b2, float b3, float sx)
{
  float A = 50; //arbitrary
  float X = x1;
  float Y = x2;
  float Z = x3;
  float x0 = (float)b1;
  float y0 = (float)b2;
  float z0 = (float)b3;  
  float sigmaX = sx;
  float sigmaY = sx;
  float sigmaZ = sx;
  float z =A *exp(-1* (((X-x0)*(X-x0)) / (2*(sigmaX*sigmaX)) + ((Y-y0)*(Y-y0)) / (2*(sigmaY*sigmaY)) + ((Z-z0)*(Z-z0)) / (2*(sigmaZ*sigmaZ))) );    
  return z;
}
}

class NURBS_surface
{
   float px,py,pz, tx,ty,tz;
   float sigmaX;
   int ucount;
   int vcount;
   int resolution=10;//default

   
  NURBS_surface(int u, int v, int res)
  {
   ucount = u;
   vcount = v;
   resolution = res;

   sigmaX = resolution/2;
   create();
  }

void create()
{

  for(int m=0; m<(ucount-1)*resolution; m++)// in the (v) direction with resolution
  {

      for(int n=0;n<(ucount-1)*resolution; n++)//in world y direction, same as (u) direction for now
      {
       float weight;
       float totalweight=0;
       tx=0;//for every row for now
       ty = 0;
       tz = 0;
       
       //loop through the coordinates in (v)
       for(int v = 0; v < vcount ;v++)
        {
       //loop through the coordinates in (u)
            for(int u = 0; u < ucount ;u++)
            {
              int x0u = u * resolution; 
              int x0v = v * resolution; 
              Pt b = (Pt)mypoints.get(u+(ucount*v));
              px = b.loc.x;
              py = b.loc.y;
              pz = b.loc.z;
              weight =  gauss(n,m,x0u,x0v,sigmaX);
               
              //adding this point to the total interpolated point, according to it's weight
              tx = tx + px * weight;
              ty = ty + py * weight;
              tz = tz + pz * weight;
              totalweight = totalweight + weight;
               
              //visualisation outside the shape
             // x = n;
             // y=(int)-weight+3*height/4;  
             // z=v*100;
             // stroke(255,255,0);
             // point(x,y,z);
            }
        }
    //after having looped through all the points at our 
    //current u position we can place a point in the global coordinate system
       tx = tx / totalweight;//totalWeight
       ty = ty / totalweight;
       tz = tz / totalweight;
      
      mysurface.add(new Pt(new PVector(tx,ty,tz), color(255,255,0,50)));
      println("ädded");
     }
  }
}
float gauss(float x1, float x2, float b1, float b2, float sx)
{
  float A = 50; //arbitrary
  float X = x1;
  float Y = x2;
  float x0 = (float)b1;
  float y0 = (float)b2;  
  float sigmaX = sx;
  float sigmaY = sx;
  float z =A *exp(-1* (((X-x0)*(X-x0)) / (2*(sigmaX*sigmaX)) + ((Y-y0)*(Y-y0)) / (2*(sigmaY*sigmaY))));    
  return z;
}
}
class Circle
{
    float x;   //position
    float y; 
    float z; 
    float rx;  //orientation
    float ry; 
    float rz; 
    float r;   //radius


  Circle(float a,float b, float c,float d, float e, float f, float g)
  {
    x = a;  //position
    y = b;
    z = c;
    rx = d; //orientation
    ry = e;
    rz = f;
    r = g;  //radius
  }
  
 void render()
 {
   

        
    //display
    float a=2*PI;
    for( float n = 0; n < a; n += 0.1)
      {
        pushMatrix();
        noStroke();
        fill(255);
        //circle(n,0,0,0,200);
        //Start in global origen, no X Y Z position filled in yet
        PVector p = new PVector(r*sin(n),r*cos(n),0.0);
            
        //rotate around z-axis
        float theta = 0;
        float rotX = p.x * cos(theta) + p.y * -sin(theta);
        float rotY = p.x * sin(theta) + p.y * cos(theta);
        float rotZ = p.z;
        p = new PVector(rotX, rotY, rotZ);
        
        //rotate around y-axis
        theta = ry;
        rotX = p.x * cos(theta) + p.z * sin(theta);
        rotY = p.y;
        rotZ = p.x * -sin(theta) + p.z * cos(theta);
        p = new PVector(rotX, rotY, rotZ);
 
        //rotate around x-axis
        theta = rx;
        rotX = p.x;
        rotY = p.y * cos(theta) + p.z * -sin(theta);
        rotZ = p.y * sin(theta) + p.z * cos(theta);
        p = new PVector(rotX, rotY, rotZ);
 
 //rotate again around z-axis
        theta = rz;
        rotX = p.x * cos(theta) + p.y * -sin(theta);
        rotY = p.x * sin(theta) + p.y * cos(theta);
        rotZ = p.z;
        p = new PVector(rotX, rotY, rotZ);
        
        //move back to own centerpoint
        float movX = p.x + x;
        float movY = p.y + y;
        float movZ = p.z + z;
        p = new PVector(movX,movY,movZ);
        
        
        translate(p.x,p.y,p.z);
        
        if(p.x< 0) 
        {
          fill(255,0,0);
        } else
       { 
         fill(255);
       }
        
        box((int)5+n*2);
        popMatrix();
      }
 }
}
  


class Grid
{

    
    Grid(int n, int m)
    {
      mypoints = new ArrayList();
      
      for(int i=0; i<n; i++)
      {
        for(int j=0; i<m; i++)
        {
        //  mypoints.add(new Pt(new PVector(0,0,0)));
        }
      }
    }

}
class Pt
{
 PVector loc;
 int voxelsize = 20;

 color c1;
 Pt(PVector location, color c)
 {
  loc = location; 
   c1 = c;
  //controlling the print resolution by rounding at a certain voxel size
  loc.x = round(loc.x/voxelsize)*voxelsize;
  loc.y = round(loc.y/voxelsize)*voxelsize;
  loc.z = round(loc.z/voxelsize)*voxelsize;
 }
  void render()
  {
    stroke(255);
   fill(c1);
   pushMatrix();
   float xrad = (loc.x/(radius+loc.z));
   int x = int( sin(xrad)*(loc.z +radius ));
   int z = int( cos(xrad)*(loc.z + radius))-radius;
   translate(x,loc.y,z);
  //translate(loc.x, loc.y, loc.z);
  rotate(xrad,0.0,1.0,0.0);
   box(voxelsize,voxelsize,voxelsize);
   popMatrix();
  }
   void changeLoc(PVector location)
  {
    loc = location;
    loc.x = round(loc.x/voxelsize)*voxelsize;
    loc.y = round(loc.y/voxelsize)*voxelsize;
    loc.z = round(loc.z/voxelsize)*voxelsize;
  }
  void changeColor(color c)
  {
    c1 = c;
  }
}


