
float randomValue = random (180);

void setup ()
{
  size (600, 200);
  smooth();
  
  frameRate (30);
}
 
 
void draw ()
{
  fill (#57385c, 80);
  noStroke();
  rect (0, 0, width, height);
   
  float newRandomValue = random (180);
  randomValue = newRandomValue*0.02 + randomValue*0.98;
  
  noStroke();
  fill (#ffedbc);
  ellipse (width/2, height/2, randomValue, randomValue);
}
 
 

