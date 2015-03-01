
float r = 200;

void setup()
{
  size(600, 600, P3D);
  frameRate(90);
}

float dotProduct(float x1, float y1, float z1, float x2, float y2, float z2)
{
  return x1*x2 + y1*y2 + z1*z2;
}

void draw()
{
  background(#5CB5FC);
  int gridX=50;
  int gridY=50;
  float nX=0, nY=0, nZ=1;

  for (int y=0; y<height; y+=gridY) {
    for (int x=0; x<width; x+=gridX) {

      float lx = mouseX - x;
      float ly = mouseY - y;
      float lz = 100;

      float lmag=sqrt(lx*lx + ly*ly + lz*lz);
      lx/=lmag;
      ly/=lmag;
      lz/=lmag;

      float cosine = dotProduct(nX, nY, nZ, lx, ly, lz);

      fill(0, 0, cosine*255);
      rect(x, y, gridX, gridY);
    }
  }


      int dev; 
      dev=mouseY/3;
      //

      translate(width/2, height/2, 0);
      rotateX(radians(-120));
      rotateY(radians(0));
      rotateZ(mouseX/8);

      for (float deg1 = 0; deg1 < 360; deg1=deg1+15)
      {
        for (float deg2 =0; deg2 <dev; deg2=deg2+1)
        {
          float phi = radians(deg2);
          float theta = radians(deg1);
          float x = r * sin(phi) * cos(theta);
          float y = r * sin(phi) * sin(theta);
          float z = r * cos(phi);
          strokeWeight(random(5, 100));
          point(x, y, z);
          stroke(#FFF80D);
          point(x/3, y/3, z/3);
          stroke(255);
          point(x/1.5, y/1.5, z/1.5);
          stroke(#FAD472);
        }
      }
}
