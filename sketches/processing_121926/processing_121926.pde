
float x, y;
float x_V, y_V;
float gravity;
float radius;
void setup() 
{
  size(800, 600, P3D);
  x = 80;
  y = 80;
  x_V = 100;
  y_V = 0;
  radius = 10;
}

void draw()
{
  background(0);
  noStroke();
  directionalLight(45, 94, 30, 0, 0, -1);
  lightSpecular(154, 154, 154);
  directionalLight(45, 94, 30, 0, 0, -1);
  lightSpecular(60, 60, 60);
  translate(x, y);
  specular(1, 1, 1);
  sphere(30);
  if (mousePressed) {
    gravity = .2;
  } 
  else {
    gravity = .002;
  }
  y_V += gravity;
  x += x_V;
  y += y_V;

  if (y>(height-radius))
  {
    y = height-radius;
    y_V *= -0.7;
  }
  if (y<radius) {
    y = radius;
    y_V /= -0.7;
  }
  if (x<radius)
  {
    x = radius;
    x_V *= -0.5;
  }
  if (x>(width-radius))
  {
    x = width-radius;
    x_V *= -0.5;
  }
  ball(x, y);
}

void ball(float x, float y)
{
  pushMatrix();
  translate(x, y);
  fill(255, 255, 255);
  ellipseMode(RADIUS);
  ellipse(0, 0, 40, 40);
  popMatrix();
}







