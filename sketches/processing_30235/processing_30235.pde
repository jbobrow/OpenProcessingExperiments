
import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
Grid grid;
MusicListener music;


boolean autoRotate = false;
PVector rot = new PVector (-5, -20, 0);


void setup ()
{
  size (720, 576, P3D);

  frameRate (30);
  colorMode (HSB, 360, 100, 100);

  // Camera --------------------------------------------------------------------
  cam = new PeasyCam(this, 0, 0, 0, 800);
  cam.setMinimumDistance(16);
  cam.setMaximumDistance(10000);
  cam.setRotations(radians (-70), radians (0), radians (0));

  int buffer = 128;
  music = new MusicListener (buffer);
  grid = new Grid (buffer, buffer, 3.0, 3.0);

  frameCount = 0;
}


void draw()
{
  background (0, 0, 90);
  cam.beginHUD();
  lights();
  directionalLight(0, 0, 19, 0, 1, 0);
  lightSpecular(0, 0, 73);
  emissive (0, 0, 19);
  specular (12.0);
  cam.endHUD();

  if (autoRotate)
  {
    cam.setRotations(radians (rot.x), radians (rot.y), radians (rot.z));
    beat ();
  }

  grid.setFrameCounter(frameCount);
  grid.beat();
  grid.display();

   if (frameCount >= music.getMusicLength()) frameCount = 0;
}

void beat ()
{

  // m = music.spektrumAverage (frameCount);
  float m = music.getBeat (frameCount)*2/3 + music.getFFTAverage (frameCount, 0.0, 1.0) * 1/3;

  rot.x += m;
  rot.y += music.getBeat(frameCount);
  rot.z += music.getFFTAverage (frameCount, 0.0, 1.0);
}



