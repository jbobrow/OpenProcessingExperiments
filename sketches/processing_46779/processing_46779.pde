
// Modifier angles
float anglex = 0.0;
float angley = 0.0;

// Number of iterations
int num = 10;

void setup()
{
  size(640, 480, P3D);
}

void draw()
{
  background(200);
  
  lights();
  camera(50, 50, 100, -50, -50, 0, 0.0, 0.0, -1.0);
  //action() :P
  
  // Axis arrows
  strokeWeight(1);
  stroke(255, 0, 0);
  line(0, 0, 0, 50, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 50, 0);
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 50);

  // Grid
  stroke(255, 100);
  noFill();
  for(int i = -5; i < 5; ++i)
    for(int j = -5; j < 5; ++j)
      rect(i * 10, j * 10, 10, 10);

  // Cubes
  strokeWeight(1);
  stroke(0);
  fill(255);

  // Map mouse X and Y to reasonable stretching values
  float xx = map(mouseX, 0, width, -width, width);
  float yy = map(mouseY, 0, height, -height, height);
  
  for(int i = 0; i < num; ++i)
  { 
    pushMatrix();
    for(int j = 0; j < num; ++j)
    {
      box(10);
      // Apply the first modifier
      translate(0, -(xx/10.0), 0);
      rotateX(anglex);
    }
    
    popMatrix();
    // Apply the second modifier
    translate((yy/10.0), 0, 0);
    rotateY(angley);
  }
}

void keyPressed() 
{
  if(key == 'q')
    anglex -= 0.01;
  else if(key == 'a')
    anglex += 0.01;
  else if(key == 'w')
    angley += 0.01;
  else if(key == 's')
    angley -= 0.01;
  else if(key == 'r')
  {
    anglex = angley = 0.0;
    num = 10;
  }
  else if(key == '+' || key == '=')
    ++num;
  else if(key == '-')
    num = constrain(--num, 1, 100);
}

