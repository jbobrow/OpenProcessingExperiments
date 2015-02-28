


float z = 50.0;
float speedZ = 40.0;
float radiusZ = 15.0;
int directionZ =1;
float pct = 0.0;
float x = 50.0;
float y = 50.0;
float radius = 15.0;
float speedX = 11.0;
float speedY = 10.4;
int directionX = 17;
int directionY = -2; 


void setup()
{
  size(800, 800);
  smooth();
  noStroke();
//  distA = endA - beginA;
//  distB = endB - beginB;
  ellipseMode(RADIUS);
}

void draw()
{
  fill(0,5);
  rect(0,0, width, height);
  fill(random(255), random(0), random(255));
  ellipse(x,y,radius,radius);

  x+= speedX * directionX;
  if ((x>width-radius) || (x<radius))
  {
    directionX = -directionX;
  }
  y += speedY * directionY;
  if ((y > height - radius) || ( y<radius))
  {
    directionY = -directionY;
  }
    fill(255);
  ellipse(x,y, radius+5, radius+5);
 fill (0,12);
 rect(0,0, width, height);
 fill(255 );
 rect(125, z, radiusZ *2, radiusZ*2);
 rect(315, z, radiusZ *2, radiusZ*2);
 rect(505, z, radiusZ *2, radiusZ*2);
 rect(695, z, radiusZ *2, radiusZ*2);
// fill(240,random(255), 23);
// box(100, z, radiusZ);
 
 z += speedZ * directionZ;                                                                                                                                      
 if ((z> height-radiusZ) || (z< radiusZ))
 {
   directionZ = -directionZ;
 }}

  
  

