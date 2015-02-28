
void setup ()
{size (1700,1700);
background (255);
}
void draw ()
{ strokeWeight(1);
  stroke(0);
  line(0, random(height), width, random(height));
  line(random(width), 0, random(width), height);
  }
  


