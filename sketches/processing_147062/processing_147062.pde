
// Shape from shading
//global variables
int q=0;
int k=0;
int d=1;
float factor=1.0;
PImage img;
float[][] modGradZ;
float[][] Zeta;
float[][] errexy;
PrintWriter output;
void setup() {
  fill(255);
  noStroke();
  frameRate(2);
  // the shading picture has width==height,and the maximus bright in the center
  img = loadImage("sphere.bmp");
  // size(img.width, img.height);
  size(600,600,P3D);
  int cols = img.width;
  int rows = img.height;
  modGradZ = new float[cols][rows];
  Zeta = new float[cols][rows];
  errexy = new float[cols][rows];
  lights();
}

void draw() {
  background(0,0,192);
  fill(255);
  directionalLight(255, 255, 255,0,0, 1);
  // Displays the image at its actual size at point (0,0)
  float f;
  color c;
  float ni,nj,nk,delta;
  int p=img.width*(img.height-4);
  int cols = img.width;
  int rows = img.height;
 camera(200-mouseX,-2*mouseY,-200.0, // eyeX, eyeY, eyeZ
        0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0,0.0); // upX, upY, upZ
  
  //image(img, 0, 0);
  // Two nested loops allow us to visit every spot in a 2D array.   
  // For every column I, visit every row J.
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      c=img.pixels[j*rows+i];
      f=brightness(c);
      errexy[j][i]=f;
      modGradZ[j][i] = sqrt(-1.0+(255.01*255.01)/(f*f));
      Zeta[j][i] = 10000;
    }
  }
  Zeta[img.width/2][img.height/2] = 100;
  for(int m=0;m<2;m++)
  {
    p=metodoDiestro(m);
    p=metodoZurdo(m);
  }
  for(int i=1;i<img.width;i++)
  {
    for(int  j=1;j<img.height;j++)
    {
       
      if(Zeta[i][j]>200) Zeta[i][j]=200;
    }
  }
  
  for(int i=1;i<img.width-d-1;i=i+d)
  {
    for(int  j=1;j<img.height-d-1;j=j+d)
    {
      beginShape(TRIANGLES);
        vertex(i+d, j+d,Zeta[i+d][j+d]);
        vertex(i+d, j,Zeta[i+d][j]);
        vertex(i, j,Zeta[i][j]);
      endShape();
      beginShape(TRIANGLES);
        vertex(i, j+d,Zeta[i][j+d]);
        vertex(i+d, j+d,Zeta[i+d][j+d]);
        vertex(i, j,Zeta[i][j]);
      endShape();
    }
  }
}
int metodoDiestro(int p)
{
  int x=img.width/2;
  int y=img.height/2;
  int w,r;
  w=x;
  p=2*w;
  for(int q=1;q<2*p;q++)
  {
    r=q;
    if(q%2==1)
    {
      for(int i=1;i<=r;i++)
      {
        x=x+1;
        marching(x,y,255);
      }
      
      for(int i=1;i<=r;i++)
      {
        y=y+1;
        marching(x,y,64);
      }
    }
    else
    {
      for(int i=1;i<=r;i++)
      {
        x=x-1;
       marching(x,y,128);
      }
      for(int i=1;i<=r;i++)
      {
        y=y-1;
        marching(x,y,255);
      }
    }
  }
  return p;
}
int metodoZurdo(int p)
{
  int x=img.width/2;
  int y=img.height/2;
  int w,r;
  w=x;
  p=2*w;
  for(int q=1;q<2*p;q++)
  {
    r=q;
    if(q%2==1)
    {
      for(int i=1;i<=r;i++)
      {
        y=y-1;
        marching(x,y,255);
      }
      
      for(int i=1;i<=r;i++)
      {
        x=x-1;
       marching(x,y,64);
      }
    }
    else
    {
      for(int i=1;i<=r;i++)
      {
        y=y+1;
       marching(x,y,128);
      }
      for(int i=1;i<=r;i++)
      {
        x=x+1;
        marching(x,y,255);
      }
    }
  }
  return p;
}
int marching(int i,int j,int g)
{
    float z1,z2,MODz1_z2;
    if((i>1)&&(i<img.width-2)&&(j>1)&&(j<img.height-2))
    {
      //z1=minimo(zx_1y,zxM1y);
      z1=min(Zeta[i-1][j],Zeta[i+1][j]);
      //z2=minimo(zxy_1,zxyM1);
      z2=min(Zeta[i][j-1],Zeta[i][j+1]);
     
      MODz1_z2=abs((z1-z2)); // height difference between neighbors
      // segun z(p(x,y),q(x,y)) ,, 
      if((MODz1_z2)<(modGradZ[i][j])) // if we can reach it,we adjust it to match
      {
        // zeta equals  0.5*(z1+z2) plus a distance
        // equals norma of this vector   (  raiz(2) * tangente(theta) , (z1-z2)  )
        Zeta[i][j]=0.5*((z1+z2)+factor*sqrt(2*modGradZ[i][j]*modGradZ[i][j]-(z1-z2)*(z1-z2)));
      }
      else // if we can't reach it, then it get up the maximus permited (tan(theta))
      {
        Zeta[i][j]=min(z1,z2)+modGradZ[i][j];
      }
    }
    return(0); 
}
