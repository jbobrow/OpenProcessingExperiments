
//import processing.opengl.*;

final static int X = 0, Y = 1, Z = 2, SIZE = 3, REDNESS = 4, BRIGHTNESS = 5;

final static int LEN = 800;
final static int NUM = 50000;
final static int RAD = 1000;

float[][] stars;

void setup()
{
  size(LEN, LEN, P3D);//OPENGL);
  noStroke();
  frameRate(30);
  sphereDetail(5);
  stars = new float[NUM][5];
  for(int i = 0; i < stars.length; i++)
  {
    float p = random(-PI, PI);
    float t = asin(random(-1, 1));
    stars[i] = new float[] {
      RAD * cos(t) * cos(p), // X
      RAD * cos(t) * sin(p), // Y
      RAD * sin(t),          // Z
      random(2),             // SIZE
      random(100),           // REDNESS
      random(255)            // BRIGHTNESS
    };
  }
  perspective(TWO_PI / 4.0, 1.0, 1, RAD * 1.1);
}

void draw()
{
  background(0);
  camera(0, 0, 0, 1, 0, 0, 0, 1, 0);
  switch(frameCount)
  {
    case 1: case 2: case 3: case 4: rotateY(frameCount * HALF_PI); break;
    case 5: rotateX(+HALF_PI); break;
    case 6: rotateX(-HALF_PI); break;
    case 7: println("Done."); exit(); return;
  }
  println("Rendering frame " + frameCount + "...");
  for(int i = 0; i < stars.length; i++)
  {
    pushMatrix();
    float[] p = stars[i];
    translate(p[X], p[Y], p[Z]);
    fill(155 + p[REDNESS], 200, 255 - p[REDNESS], p[BRIGHTNESS]);
    sphere(p[SIZE]);
    popMatrix();
  }
//  save("sky-" + frameCount + ".png");
}


