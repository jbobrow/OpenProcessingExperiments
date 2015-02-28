
//Homework 12
//Copyright Kristen McConnell, November 2011, Pittsburgh, PA 15232
 
int MAX = 50;
float [] dia = new float [MAX];
float [] x = new float [MAX];
float [] y = new float [MAX];
float [] z = new float [MAX];
float [] dx = new float [MAX];
float [] dy = new float [MAX];
float [] dz = new float [MAX];
float [] rotationY = new float [MAX];
float [] rotationDY = new float [MAX];
color [] col = new color [MAX];
 
void setup()
{
   size(400,400,P3D);
   sphereDetail(5);
   initializeArray(dia,width*.05,width*.1);
   initializeArray(x,.1,width-(height*.1));
   initializeArray(z,-width/2,width/2);
   initializeArray(y,.1,height-(height*.1));
   initializeArray(dx,1,3);
   initializeArray(dy,1,3);
   initializeArray(dz,1,3);
   initializeColorArray();
   initializeArray(rotationY,10,30);
   initializeArray(rotationDY,1,1.5);
}
 
void draw()
{
   background(255);
   moveFigure();
   drawFigure();
}
 
void initializeColorArray()
{
 for(int i = 0;i < col.length;i++ )
 {
   col[i] = color(0, random(255), random(255));
 }
}
 
void initializeArray(float[]array, float small, float large)
{
 for(int i = 0 ;i < array.length ;i++ )
 {
   array[i] = int(random(small, large));
 }
}
 
void moveFigure()
{
   for(int i = 0;i < MAX;i++ )
   {
     x[i] = x[i] + dx[i];
     y[i] = y[i] + dy[i];
     z[i] = z[i] + dz[i];
     rotationY[i] = rotationY[i] + rotationDY[i];

     if(rotationY[i] > 180 || rotationY[i] < 0)
     {
       rotationY[i] = 1;
     }
     if(x[i] >width-(dia[i]/2) || x[i] < (dia[i]/2))
     {
       dx[i] = -dx[i];
     }
     if(y[i] < (dia[i]/2) || y[i] > height-(dia[i]/2))
     {
       dy[i] = -dy[i];
     }
     if(z[i] <-width/2 || z[i] > width/2)
     {
       dz[i] = -dz[i];
     }
   }
}
 
void drawFigure()
{
   for(int i = 0;i < MAX;i++ )
   {

     fill(col[i]);
     pushMatrix();
       translate(x[i],y[i],z[i]);
       rotateY(rotationY[i]);
       box(dia[i],dia[i]/2,dia[i]/2);
     popMatrix();
     pushMatrix();
       translate(x[i]+(width*.05),y[i],z[i]);
       sphere(dia[i]/4);
     popMatrix();
     pushMatrix();
       translate(x[i]-(width*.05),y[i],z[i]);
       sphere(dia[i]/4);
     popMatrix();

   }
}

