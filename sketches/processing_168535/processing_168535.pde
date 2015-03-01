
import processing.opengl.*;
float rad = 200;
float cx, cy;
float x, y, z;
PVector lightpos, lightdif, s_normal, pos;
float offx, offy;
void setup()
{
  size(600,600);
  cx = width/2;
  cy = height/2;
  s_normal = new PVector(0, 0, 0);
  lightpos = new PVector(0, 0, 0);
  lightdif = new PVector(0, 0, 0);
  pos = new PVector(0, 0, 0);
  noSmooth();
 // hint(DISABLE_DEPTH_TEST);
}

void draw()
{
  background(0);
  lightpos.set(mouseX-cx, mouseY-cy, 400);
  pushMatrix();
  translate(cx, cy, 0);
  //rotateX(radians(mouseY*.4));
  //rotateY(radians(mouseX*.4));
  //noFill();
  //stroke(0);
  fill(0);
  ellipse(0, 0, rad*2+40, rad*2+40);
  noStroke();
  fill(100, 0, 0);




  for (float lat = -PI; lat < PI;lat+=radians(10))
  {
    for (float lon = -PI; lon< PI;lon+=radians(5))
    {
      x = sin(lat)*cos(lon)*rad;
      y = sin(lat)*sin(lon)*rad;
      z = cos(lat)*rad;
      point(x, y, z);
      pos.set(x, y, z);
      s_normal.set(x, y, z);

      s_normal.normalize();
      lightdif = PVector.sub(lightpos, pos);
      lightdif.normalize();
      float illum = s_normal.dot(lightdif);
      if (illum < 0)
        illum = 0;
      line(x, y, z, x+(s_normal.x*illum), y+(s_normal.y*illum), z+(s_normal.z*illum));
      pushMatrix();
      translate(x, y, z);
      fill(illum*255, 0, 0);
      ellipse(0, 0, illum*40, illum*40);
      popMatrix();
      // vertex(x,y,z);
    }
  }
  popMatrix();
}

