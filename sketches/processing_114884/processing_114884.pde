
float prevX;
float prevY;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  if (mousePressed == true)
  {
    drawBoxes();
  }
  else
  {
    drawWebs();
  }
}

void drawBoxes()
{
  fill(255, 50);
  stroke(0, 50);
  float d = dist(pmouseX, pmouseY, prevX, prevY);  
  float toX = pmouseX - prevX;
  float toY = pmouseY - prevY;
  PVector direction = new PVector(toX, toY);
  PVector horizon = new PVector(-1, 0);
  pushMatrix();
  translate(
    prevX + (direction.x * 0.5), 
    prevY + (direction.y * 0.5));
  rectMode(CENTER);
  rotate(PVector.angleBetween(horizon, direction));
  rect(0, 0, d, d);
  popMatrix();
  
  prevX = pmouseX;
  prevY = pmouseY;
}

void drawWebs()
{
  stroke(0, 15);
  line(pmouseX, pmouseY, mouseX, mouseY);
  for (int i = 0; i < 5; i++)
  {
    float d = dist(pmouseX, pmouseY, mouseX, mouseY);
    
    pushMatrix();
    translate(pmouseX, pmouseY);
    rotate(radians(i * 50));
    line(-d, -d, d, d);
    popMatrix();
  }
}


