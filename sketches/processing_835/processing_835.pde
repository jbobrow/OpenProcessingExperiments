
int cubesPerSide = 20;
int numCubes = cubesPerSide*cubesPerSide;
cubegrid cubeGrid = new cubegrid();


void setup()
{
  size(500,500,P3D);
}

void draw()
{
  background(0,0,0);
  cubeGrid.render();
}

void mouseMoved()
{
  cubeGrid.attractCubes((float)mouseX,(float)mouseY);
}

