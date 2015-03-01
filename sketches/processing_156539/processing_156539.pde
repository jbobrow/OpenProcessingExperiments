
void setup ()
{
  size (600, 200);
  smooth();
  background (#57385c);
}
 
void draw ()
{
  float rVal_01 = random (width);
  float rVal_02 = random (width);
  
  float x = rVal_01;
  
  float y = random (height);
  float s = random (10, 30);
   
  stroke(#57385c);
  strokeWeight (2);

   
  if (rVal_01 < rVal_02)
  {
    fill (#ffedbc);
    ellipse (x, y, s, s);
  }
  else
  {
    fill (#A75265);
    rect (x, y, s, s);
  }
}
