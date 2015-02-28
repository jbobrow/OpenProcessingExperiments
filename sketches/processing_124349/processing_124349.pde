
//Annie Ranttila
//Assignment 9
//Carnegie Mellon University, Fall 2013
//star shape adapted for 3D from "http://processing.org/tutorials/pshape/"

float [] arrayX = new float [40];
float [] arrayY = new float [40];
float [] arrayZ = new float [40];
float [] deltaY = new float [40];
float[] ry = new float [40];
float[] deltary = new float [40];
color [] col1 = new color[40];

void setup()
{
size (800, 600, P3D);
background(255,178,178);
initArrays (arrayX, arrayY, arrayZ, col1, deltaY, deltary, ry);

}

void draw ()
{
  frameRate(10);
  background(255,178,178);
  lights();
  directionalLight(255, 255, 255, 0, height, 0);
  directionalLight(30, 30, 30, width, 0, 1);
  directionalLight(50, 50, 50, 0, -height, 0);
  drawFigs(arrayX, arrayY, arrayZ, ry);
  rotStar();
  moveFigs();
}

void drawFigs(float [] arrayz, float [] arrayx, float [] arrayy, float []rotZ)
{

 background(255,178,178);
  
  for( int i = 0; i < arrayY.length; i++)
  {
   fill(col1[i]); 
   stroke (col1[i]);
   strokeWeight(3);
   pushMatrix();
   translate(arrayX[i], arrayY[i], arrayZ[i]);
    rotateY(radians(rotZ[i]));
   drawStar();
      if(arrayY[i]>height+100)
        arrayY[i]= 0   ;
      else
      rotateY(radians(5));
    arrayY[i]+=random(1,3);
    popMatrix();

  }
}


void moveFigs ()
{ 
   for( int i = 0; i < arrayY.length; i++)
   {

     arrayY[i] += deltaY[i];
     
      if (arrayY[i] >= height || arrayY[i] <= 0 )
      {
        deltaY[i] = - deltaY[i];
      }
   }}

void initArrays (float [] arrayx, float [] arrayy, float [] arrayz, color [] col, float [] deltaY, float [] deltary, float [] ry)
{
  for (int i=0; i<arrayy.length; i++)
  {
  arrayx [i] = random (width);
  arrayy [i] = 0;
  arrayz [i] = random (-300,400);
  }
  for (int i=0; i<col.length; i++)
  {
    col [i] = color(random(255), random(255), random(255));
  }
  for (int i=0; i<deltaY.length; i++)
  {
    deltaY [i] = random (10,40);
  }
    for (int i=0; i<deltary.length; i++)
  {
    deltary [i] = random (1,3);
    ry [i] = random (1,3);
  }
}


void mouseClicked ()
{ 
   for( int i = 0; i < arrayY.length; i++)
   {
     arrayY[i] += deltaY[i];
        deltaY[i] = - deltaY[i];
      }
  }
  
  void drawStar()
  {
  beginShape();
  vertex(0, -50, 0);
  vertex(14, -20, 0);
  vertex(47, -15, 0);
  vertex(23, 7, 0);
  vertex(29, 40, 0);
  vertex(0, 25, 0);
  vertex(-29, 40, 0);
  vertex(-23, 7, 0);
  vertex(-47, -15, 0);
  vertex(-14, -20 ,0);

  vertex(0, -50, 0);
  vertex(0, 0, -15);
  vertex(14, -20, 0);
  vertex(0, 0, -15);
  vertex(47, -15, 0);
  vertex(0, 0, -15);
  vertex(23, 7, 0);
  vertex(0, 0, -15);
  vertex(29, 40, 0);
  vertex(0, 0, -15);
  vertex(0, 25, 0);
  vertex(0, 0, -15);
  vertex(-29, 40, 0);
  vertex(0, 0, -15);
  vertex(-23, 7, 0);
  vertex(0, 0, -15);
  vertex(-47, -15, 0);
  vertex(0, 0, -15);
  vertex(-14, -20, 0);
  vertex(0, 0, -15);
   
vertex(0, -50, 0);
 vertex(0, 0, 15);
 vertex(14, -20, 0);
  vertex(0, 0, 15);
 vertex(47, -15, 0);
 vertex(0, 0, 15);
   vertex(23, 7, 0);
 vertex(0, 0, 15);
 vertex(29, 40, 0);
 vertex(0, 0, 15);
 vertex(0, 25, 0);
 vertex(0, 0, 15);
 vertex(-29, 40, 0);
 vertex(0, 0, 15);
   vertex(-23, 7, 0);
 vertex(0, 0, 15);
  vertex(0, 0, 15);
 vertex(-14, -20, 0);
 vertex(0, 0, 15);
  
  endShape(CLOSE);
  }

void rotStar() 
{
for( int i = 0; i < arrayY.length; i++)
{
  ry[i] += deltary[i];
}
}



