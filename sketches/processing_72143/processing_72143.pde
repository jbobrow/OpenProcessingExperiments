
/* 
 Moves a rocket around a starry background 
 */

int numStars = 100;
float [] starX = new float[numStars];
float [] starY = new float[numStars];
int [] starBright = new int[numStars];

void setup()
{
  size(400, 400);
  for (int i = 0; i < numStars; i++)
  {
    starX[i] = random(width);
    starY[i] = random(height);
    starBright[i] =  (int) random(255);
  }
}
//---------------------------------------------
void draw()
{
  background(0);

  // Draw the stars  
  for (int i = 0; i < numStars; i++)
  {
    fill(starBright[i]);
    stroke(starBright[i]);
    ellipse(starX[i], starY[i], 3, 3);
  }

  drawRocket();
}
//-------------------------------------------
void keyPressed()
{
  switch (key)
  {
  case 'j': 
    moveRocket(-10, 0); 
    break;
  case 'k': 
    moveRocket(+10, 0); 
    break;
  case 'i': 
    moveRocket(0, -10); 
    break;
  case 'm': 
    moveRocket(0, +10); 
    break;
  }
}
//-------------------------------------------
// Rocket code    
//-------------------------------------------
float rocketX = 100;
float rocketY = 100;

void drawRocket()
{
  fill(100);
  stroke(100);
  rect(rocketX, rocketY, 20, 60);
  triangle(rocketX, rocketY, 
  rocketX+20, rocketY, 
  rocketX+10, rocketY-10);
  triangle(rocketX-10, rocketY+60, 
  rocketX+20+10, rocketY+60, 
  rocketX+10, rocketY+60-40);
}
//-------------------------------------------
void moveRocket(float dx, float dy)
{
  rocketX += dx;
  rocketY += dy;
}
//-------------------------------------------
//-------------------------------------------
