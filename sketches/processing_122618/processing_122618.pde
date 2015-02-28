
void setup()
{
  size(500, 500);
}

void draw()
{
  if (hour()<6)
  {
    background (0);
  }
  else
  { background(88, 219, 250); }
   
   
  if (hour()>=17)
  {
    background (0);
  }
  else
  { background(88, 219, 250); }
   


  translate(width/2, height/2);


  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float std = map(hour(), 0, 12, 0, 360/2);


  pushMatrix();
  rotate(radians(std));
  translate(0, 0);
  noStroke();
  fill(240, 249, 252);
  ellipse(0, 0, std, std);
  popMatrix();

  if (hour()<6)
  {
    fill (255, 212, 54);
  }
  else
  {
    fill (180);
  }


  if (hour()>18)
  {
    fill (255, 212, 54);
  }
  else
  {
    fill(180);
  }
  
  pushMatrix();
  rotate(radians(sec)); //Um i rotieren
  translate(0, -210);
  ellipse(0, 0, 20, 20);
  popMatrix();

  pushMatrix();
  rotate(radians(min));
  translate(0, -210);
  ellipse(0, 0, 10, 10);
  popMatrix();
}

