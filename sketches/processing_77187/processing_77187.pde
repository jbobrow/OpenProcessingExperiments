
float theta;
PFont e;

void setup ()
{
  size (800, 600);
  e = createFont ("Verdana Bold", 16, true);
}

void draw ()
{
  background (75);
  fill (128);
  textFont (e, 32);
  textAlign (RIGHT);
  text ("Kenny Rose Design", 790, 590);
  fill (128);
  textFont (e, 16);
  textAlign (LEFT);
  text ("created with Processing and Processing.js", 20, 20);
  fill (128, 255, 128);
  textFont (e, 42);
  textAlign (RIGHT);
  text ("THINK GREEN", width/2, 100);
  fill (255, 75, 75);
  textFont (e, 42);
  textAlign (LEFT);
  text ("NOT MEAN", width/2, 500);
  smooth();

  stroke (200, 200, 100);
  strokeWeight (3);
  float a = (mouseX / (float) width) * 180f;
  theta = radians (a);
  translate (width/2, height);
  line (0, 0, 0, -180);
  translate (0, -180);
  branch (180);
}

void branch (float h)
{
   h *= 0.66;

  if (h > 2)
  {
    pushMatrix();
    rotate (theta);
    line (0, 0, 0, -h);
    translate (0, -h);
    branch (h);
    popMatrix ();
    
    pushMatrix ();
    rotate (-theta);
    line (0, 0, 0, -h);
    translate (0, -h);
    branch (h);
    popMatrix ();
  }
}



