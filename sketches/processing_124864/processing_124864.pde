
//Copyright: Angela Kolosky, Carnegie Mellon University, Pittsburgh, PA
//Computing for the Arts with Processing

//HW9 Screen Saver

final int MAX = 10;

float [ ] x = new float [MAX];
float [ ] y = new float [MAX];
float [ ] z = new float [MAX];
float [ ] dx = new float [MAX];
float [ ] dy = new float [MAX];
float [ ] dz = new float [MAX];

void setup()
{
  size(700,700,P3D);

  initArrays (z,y,z,dx,dy,dz);
}

void draw()
{
  background(0);
  drawFigure();
  moveFigure();
}

void moveFigure()
{
 for (int i = 0; i < x.length; i++)
    {
      x[i]+=dx[i];
       if (x[i]>width || x[i]<0)
         {
           dx[i]=-dx[i];
         }
         
      y[i]+=dy[i];
       if (y[i]>height || y[i]<0)
         {
           dy[i]=-dy[i];
         } 
         
      z[i]+=dz[i];
       if (z[i]>-1000 || z[i]<300)
         {
           dz[i]=-dz[i];
         } 
    }
}

void drawFigure()
{
 for (int i = 0; i < x.length; i++)
    {
      pushMatrix();
      rotateX(radians(45));
      design(x[i],y[i],z[i]);
      popMatrix();
    }   
}

void design (float x,float y, float z)
{
 pushMatrix();
   stroke(3,255,202);
   noFill();
   translate(x,y,z);
   box(width*.1);
 popMatrix();
 pushMatrix();
   stroke(255,3,167);
   noFill();
   translate(x,y,z);
   box(width*.15);
 popMatrix();
 pushMatrix();
   stroke(90,255,3);
   noFill();
   translate(x,y,z);
   rotateZ(radians(45));
   box(width*.08);
 popMatrix();
}

void initArrays (float []x, float []y, float []z, float []dx, float []dy, float []dz)
{
  for (int i=0; i<x.length; i++)
  {
  x [i] = random(width);
  y [i]= random(height);
  z [i]= random(-1000);

  
  dx [i]= random(2,15);
  dy [i]= random(2,15);
  dz [i]= random(2,15);
  }
}


