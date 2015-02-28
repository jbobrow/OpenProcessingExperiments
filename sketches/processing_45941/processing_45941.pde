
//HW 12 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 11/14/2011 - CMU

final int COUNT = 20;
float boundZ = -500;
float [] x, y, z, w, deltaX, deltaY, deltaZ;
color [] col;

void setup()
{
  size(800, 600, P3D);
  x = new float[COUNT];
  y = new float[COUNT];
  z = new float[COUNT];
  w = new float[COUNT];
  deltaX = new float[COUNT];
  deltaY = new float[COUNT];
  deltaZ = new float[COUNT];
  col = new color[COUNT];
  
  initArray(x, 50, width - 50);
  initArray(y, 50, height - 50);
  initArray(z, 0, boundZ - 50);
  initArray(w, 30, 100);
  initArray(deltaX, 1, 5);
  initArray(deltaY, 1, 5);
  initArray(deltaZ, 1, 5);
  initColorArray();
  
  translate(width/2, height/2, 0); 
}

void draw()
{
  background(255);
  pushMatrix();
  fill(255,0);
  translate(width/2,height/2, 0); 
  box(width,height,boundZ);
  popMatrix();
  for(int i = 0; i < COUNT; i++)
  {
    spike(x[i],y[i],z[i],w[i],col[i]);   
  }
  moveSpike();
  checkPosSpike();
}

void initArray(float[] arr, float low, float high)
{
  for(int i = 0; i < arr.length; i++)
  {
    arr[i] = random(low, high);
  }
}

void initColorArray()
{
  for(int i = 0; i < COUNT; i++)
  {
    col[i] = color(random(255), random(255), random(255));
  }
}

void spike(float x, float y, float z, float w, color col)
{
  pushMatrix();
  translate(x,y,z);
  rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  rotateZ(radians(frameCount));
  
  fill(col,120);
  box(w,w/4,w/4);
  box(w/4,w,w/4);
  box(w/4,w/4,w);
  box(w/2,w/2,w/2);
  popMatrix();
  
}

void moveSpike()
{
 for(int i = 0; i < COUNT; i++)
  {
    x[i] = x[i] + deltaX[i];
    y[i] = y[i] + deltaY[i];
    z[i] = z[i] + deltaZ[i];
  }
}

void checkPosSpike()
{
  for(int i = 0; i < COUNT; i++)
  {
    if(x[i] < 0 || x[i] > width)
    {
      deltaX[i] = -deltaX[i];
    }
    else if(y[i] < 0 || y[i]> height)
    {
      deltaY[i] = -deltaY[i];
    }
    else if(z[i] > 0 || z[i] < boundZ)
    {
      deltaZ[i] = -deltaZ[i];
    }
  }
}


