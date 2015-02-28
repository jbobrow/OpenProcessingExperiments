
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
import processing.opengl.*;

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without my permission
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 
 Based on:
 http://alexjosephdiamond.tumblr.com/post/35885404062
 
 -----------------------------------*/


ArrayList <PVector> dots;
ArrayList <DianaTriangle> tt;
ArrayList <PVector> ids;
int W, H, DEPTH = 200, NOISEDEPTH = 120, displayMode = 3, RES = 40;

boolean drawBase = true, drawOrigins = true, drawTriangle = true;
PImage bg;

PeasyCam cam;


void setup ()
{
  size (600, 600, P3D);

  //strokeJoin (ROUND);
  bg = loadImage ("bg.jpg");
  W=H= height;
  initSetup (RES);


  cam = new PeasyCam (this, W/2, H/2, DEPTH/2, 850);
  cam.setRotations(radians (-45), radians (38), radians (-32));

  hint(DISABLE_DEPTH_TEST);
}

void draw ()
{
  background (bg);
  lights();
  // drawQUADS();
  if (drawBase) drawBase(RES);
  if (drawOrigins) drawOrigins();
  if (drawTriangle) drawTriangles();

  //drawDots();
}

void initSetup (int res)
{
  W=H= height;
  RES = res;
  dots = createDots (RES, W, H);

  //println (RES);

  int noiseNum = (int) random (10000);
  float noiseScale = random (1, 100);
  int octaves = (int)random (1, 20);
  float falloff = random (0.1, 0.9);

  createTriangles(noiseNum, noiseScale, octaves, falloff);

  // println (W + ", " + H);
}

void drawDots ()
{
  stroke (1);
  for (int i = 0; i < dots.size(); i++)
  {
    point (dots.get(i).x, dots.get(i).y);
  }
}

void drawOrigins ()
{
  strokeWeight (0.5);

  for (int i = 0; i < tt.size(); i++)
  {
    tt.get (i).drawOrigin();
  }
}


void drawBase (int padd)
{
  strokeWeight (0.5);
  stroke (0, 80);

  for (int i = 0; i <= H; i+=padd)
  {
    for (int j = 0; j <= W; j+=padd)
    {
      if (i != W) line (i, j, 0, i+padd, j, 0);
      if (j != H) line (i, j, 0, i, j+padd, 0);
    }
  }
}


void drawTriangles ()
{
  strokeWeight (1.0);
  // beginShape(TRIANGLES);
  for (int i = 0; i < tt.size(); i++)
  {
    tt.get (i).drawVertex(displayMode);
  }

  //endShape();
}


void drawQUADS ()
{
  strokeWeight (1);
  // beginShape(TRIANGLES);
  beginShape(QUAD_STRIP);
  for (int i = 0; i < tt.size(); i++)
  {
    tt.get (i).drawBASE();
  }

  endShape();
}


