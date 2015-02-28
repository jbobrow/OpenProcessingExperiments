
int start_size = 200;
int start_origin_x = 200;
int start_origin_y = 200;
int ellipse_count = 200;

void setup()
{
  size(400, 400, P3D);
  smooth();
  strokeWeight(1);
  stroke(255, 255, 255, 150);
  noFill();
}

void draw()
{
  background(0);
  
  float rotation = mouseX * (0.00016);
  
  pushMatrix();
  translate(200, 200, -100);
  
  for(int instance = 1; instance <= 100; instance++)
  {
    rotateY(rotation);
    int adjusted_size = start_size - instance * 2;

    pushMatrix();
    for (int j = 1; j <= 100; j++)
    {
      rotateX(rotation);
      point(0, 200);
    }
    popMatrix();
    
  }
  
  popMatrix();
}


