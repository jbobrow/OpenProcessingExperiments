
import processing.opengl.*;

final float MAX_HEIGHT = 200f;
final float MIN_HEIGHT = 30;
final float HEIGHT_RATIO = 1.3;

int MAP_SIZE = 128;
int DETAIL = 1;

float[] MAP;

float zoomFactor = .895;

float cameraX = -MAP_SIZE * 1.25;
float cameraY = MAX_HEIGHT * 2f;
float cameraZ = -MAP_SIZE * 1.25;

float lookatX = MAP_SIZE * 2;
float lookatY = MAX_HEIGHT * 2f;
float lookatZ =  MAP_SIZE * 2;

final color darkgreen = color(0,100,0);
final color lightgreen = color(43, 170, 41);
final color darkbrown = color(72, 59, 53);
final color snowwhite = color(205, 201, 201);
final color white = color(255, 255, 255);

final int MAX_GENS = 15;

void SetColor(float x, float y)
{
  color c;

  float h = map(Height(x, y) / HEIGHT_RATIO, MIN_HEIGHT, MAX_HEIGHT, 0, .8);
  h = map(h, 0, .7, 0, 1) - (noise(x*.002, y * .002, h)/5 - .1);

  if (h <=  .3)
  {
    c = lerpColor(darkgreen, lightgreen, smoothstep(h, 0, .3));
  }
  else if (h <= .5)
  {
    c = lerpColor(lightgreen, darkbrown, smoothstep(h, .3, .5));
  }
  else if (h <= .9)
  {
    c = lerpColor(darkbrown, snowwhite, smoothstep(h, .5, .9));
  }
  else
  {
    c = lerpColor(snowwhite, white, smoothstep(h, .9, 1));
  }
  fill(c);
}

float smoothstep(float x, float left, float right)
{
  float v = (x - left)/ (right - left);
  return smoothstep(v);
}

float smoothstep(float x)
{
  return x * x * (3 - 2 * x);
}



void UpdateCamera()
{
  float camZ = ((height/2.0) / tan(PI*60.0/360.0));

  perspective(50.0*zoomFactor, width/height, camZ/10.0, camZ*10.0);
  camera(cameraX, cameraY, cameraZ,  lookatX, lookatY, lookatZ,  0, -1, 0);
}

void GenerateMap(float x, float y)
{
  MAP = new float[MAP_SIZE * MAP_SIZE];

  for (int i = 0; i < MAP_SIZE; i++)
  {
    for (int j = 0; j < MAP_SIZE; j++)
    {
      float v = noise((i + x) * .008, (j + y) * .008);
      MAP[i + (j * MAP_SIZE)] = map(sq(v), 0, .8, MIN_HEIGHT, MAX_HEIGHT);
    }
  }
}

float Height(float X, float Y)
{
  int x = int(X) % MAP_SIZE;
  int y = int(Y) % MAP_SIZE;

  return MAP[x + (y * MAP_SIZE)] * HEIGHT_RATIO;
}

void RenderMap(float X0, float Y0)
{
  GenerateMap(X0, Y0);
  float x,y,z;
  noStroke();
  beginShape(QUADS);
  for (int i = 0; i < MAP_SIZE - DETAIL; i++)
  {
    for (int j = 0; j < MAP_SIZE - DETAIL; j++)
    {
      x = X0 + i;
      y = Height(i, j);
      z = Y0 + j;

      SetColor(i, j);

      vertex(x,y,z);

      x = X0 + i;
      y = Height(i, j + DETAIL);
      z = Y0 + j + DETAIL;

      SetColor(i, j + DETAIL);

      vertex(x,y,z);

      x = X0 + i + DETAIL;
      y = Height(i + DETAIL, j + DETAIL);
      z = Y0 + j + DETAIL;

      SetColor(i + DETAIL, j + DETAIL);

      vertex(x, y, z);

      x = X0 + i + DETAIL;
      y = Height(i + DETAIL, j);
      z = Y0 + j;

      SetColor(i + DETAIL, j);

      vertex(x, y, z);
    }
  }
  endShape();
}

void setup()
{
  size(900, 450, OPENGL);

noiseDetail(9, .45);

  background(0);
  smooth();

  UpdateCamera();
}



int currentGen = 0;
int currentGen_i = 0, currentGen_j = 0;

void draw()
{
  pointLight(255,255,255, MAP_SIZE/2, cameraY + 1500, MAP_SIZE/2);
  if (currentGen <= MAX_GENS)
  {
    pushMatrix();
    translate(-MAP_SIZE/2, 0, -MAP_SIZE/2);
    println(currentGen);
    RenderMap(currentGen_i * (MAP_SIZE - 1), currentGen_j * (MAP_SIZE - 1));
    if (++currentGen_j >= currentGen)
    {
      currentGen_i++;
      currentGen_j = 0;
    }
    if (currentGen_i >= currentGen)
    {
      currentGen_i = 0;
      currentGen++;
    }
    popMatrix();
  }
}


