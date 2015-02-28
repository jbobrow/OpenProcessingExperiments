
float bulletX = -20;
float bulletY = -20;
float bulletSpeed=0;

void setup()
{
  size(600, 400);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw() 
{
  bulletX = bulletX + bulletSpeed;

  fill(0, 0, 0);
  ellipse(bulletX, bulletY, 10, 10); 
  fill(255, 255, 255,50 );
  rect(0, 0, width, height);
  fill(100, 100, 100);
  rect(mouseX-5, mouseY-5, 75, 10);
  rect(mouseX-5, mouseY-5, 10, 45);
  noFill();
  strokeWeight(3);
  arc(mouseX+10, mouseY+10, 20, 20, 0, PI/2);

  if (bulletX > width)
  {
    bulletX = -20;
    bulletY = -20;
    bulletSpeed = 0;
  }
}

void keyPressed()
{
  bulletSpeed = 10;
}

void mouseMoved()
{
  bulletX = mouseX;
  bulletY = mouseY;
}
