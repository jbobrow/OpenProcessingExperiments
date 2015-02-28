
int numNodesPerAxis = 90;
int numNodes = numNodesPerAxis*numNodesPerAxis;

system nodeSystem;

void setup()
{
  size(700,700);
  nodeSystem = new system(width, height);
}

void draw()
{
  background(0,0,0);
  nodeSystem.update();
  nodeSystem.render();
}

void mouseMoved()
{
  if(mouseButton == LEFT)
  {
    PVector mouseLocation = new PVector(mouseX, mouseY);
    nodeSystem.addForce(mouseLocation); 
  }
}



