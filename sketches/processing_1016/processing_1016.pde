
int start_size = 200;
int start_origin_x = 200;
int start_origin_y = 200;
int ellipse_count = 200;

void setup()
{
  size(800, 400, P3D);
  smooth();
  strokeWeight(1.5);
  noFill();
  ellipseMode(CENTER);
}

void draw()
{
  background(0);
  
  float rotation = mouseX * (0.0002);
  
  pushMatrix();
  translate(400, mouseY-200, -50);
  for(int instance = 1; instance <= 100; instance++)
  {
    rotateY(rotation);
    int adjusted_size = start_size - instance * 2;
    float stroke_color = instance * 2;
    stroke(255, stroke_color, 0, stroke_color);
    ellipse(start_origin_x, start_origin_y, adjusted_size, adjusted_size);  
  }
  
  popMatrix();
}


