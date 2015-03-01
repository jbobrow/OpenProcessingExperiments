

float noiseScale = 80.0;

float rot = 0;
float zoom = 400;

void setup() {
  size(600, 200, P3D);
  smooth();

  rot = 150;

  frameRate (30);
  
  hint (DISABLE_DEPTH_TEST);
}


void draw()
{
  background(#57385c);



  if (mousePressed && mouseButton == LEFT)
  {
    rot = mouseX;
    zoom = map (mouseY, 0, height, 1, 1200);
  }
  else if (mousePressed && mouseButton == RIGHT)
  {
    noiseScale = map (mouseX, 0, width, 1, 300);
  }

  stroke (255, 120);
  strokeWeight (1);
  noFill();
  camera (0, rot, zoom, 0, 0, 0, 1, 0, 0);
  box (300);

  stroke (#ffedbc, 80);

  int x = 0;
  while (x < 300)
  {
    int y = 0;
    while (y < 300)
    {
      int z = 0;
      while (z < 300)
      {
        float d = noise (x / noiseScale, y / noiseScale, z / noiseScale) * 6;

        strokeWeight (d);
        if (d > 4) point (x-150, y-150, z-150);
        z = z + 6;
      }
      y = y + 6;
    }
    x = x + 6;
  }
}


