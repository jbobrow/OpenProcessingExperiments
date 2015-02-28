
float health = 100;
float MAX_HEALTH = 100;
float rectWidth = 200;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);

  // Change color
  if (health < 25)
  {
    fill(255, 0, 0);
  }  
  else if (health < 50)
  {
    fill(255, 200, 0);
  }
  else
  {
    fill(0, 255, 0);
  }
  
  // Draw bar
  noStroke();
  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth = (health / MAX_HEALTH) * rectWidth;
  rect(100, 100, drawWidth, 50);
  
  // Outline
  stroke(0);
  noFill();
  rect(100, 100, rectWidth, 50);
}

void mousePressed()
{
  if (health > 0 && mouseButton == LEFT)
  {
    health -= 10;
  }
  if (health < 100 && mouseButton == RIGHT)
  {
    health += 10;
  }
}


