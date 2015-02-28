
//Carina Schweitzer 2010

size (400,500);
smooth();
fill(0);
background (255);

float v = 0;
for ( int i=0; i < width ; i++)
{
  if (i <= 12)
  {
    v += i*2.38;
    pushMatrix(); // Hälfte von rechts
    translate(v, 0);
    triangle (-i, height, 1.5, 0, i+1, height);
    popMatrix();
    
    pushMatrix(); // Hälfte von links
    translate(width-v, 0);
    triangle (-i, height, 1.5, 0, i+1, height);
    popMatrix();
  }

}



