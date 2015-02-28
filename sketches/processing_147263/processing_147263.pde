
int Scene = 1;
float Location = 75;
float Growth = 0;
float Growth2 = 0;
int timer= 0;
float timer2=0;

public void setup() 
{
  size(500, 500);

  smooth();
}

void draw()
{
  background(0);
  if (Scene == 1)
  {
    rect(Location, 120, 50, 100);
    ellipse(Location+25, 100, 50, 50);
    if (Location < 400)
    {
      Location ++;
    }
    else
    {
      Location = 75;
      Scene ++;
    }
  }
  if (Scene == 2)
  {
    rect(Location, 120, 50+Growth, 100+Growth);
    ellipse(Location+25, 100, 50+Growth, 50+Growth);
    if (Location < 250)
    {
      Location ++;
    }
    if (Growth <200)
    {
      Growth ++;
    }
    else
    {
      Scene ++;
    }
  }
  if (Scene == 3)
  { 
    if (timer<1000)
    {
      fill(#ff69b4);
      rect(100, 200, 300, 175);
      fill(#68b3ff);
      rect(100, 100, 50, 100);
      fill(#ff0000);
      rect(225, 100, 50, 100);
      fill(#ffff00);
      rect(350, 100, 50, 100);
      fill(255, random(120, 165), 0);
      triangle(100, 100, 125, 50, 150, 100); 
      triangle(350, 100, 375, 50, 400, 100); 
      triangle(225, 100, 250, 50, 275, 100);
      timer++;
    }
    else
    {
      Scene = 4;
    }
  }
  if (Scene == 4)
  {
    fill(#ffffff);
    rect(250, 120, 250, 300);
    ellipse(275, 100, 250, 250);
    fill(#0000ff);
    ellipse(305, 100, 50+Growth2, 50+Growth2);
    ellipse(205, 100, 50+Growth2, 50+Growth2);
    if (Growth2<100)
    {
      Growth2 ++;
    }
    else
    {
      Scene++;
    }
  }
  if (Scene == 5)
  {
    if (timer2 <700)
    {
      fill(#ff69b4);
      rect(100, 200, 300, 175);
      fill(#68b3ff);
      rect(100, 100, 50, 100);
      fill(#ff0000);
      rect(225, 100, 50, 100);
      fill(#ffff00);
      rect(350, 100, 50, 100);
      fill(255, random(120, 165), 0);
      triangle(100, 100, 125, 50, 150, 100); 
      triangle(350, 100, 375, 50, 400, 100); 
      triangle(225, 100, 250, 50, 275, 100);
      fill(#000000);
      triangle(350, 250, 400, 225, 400, 300);
      triangle(350, 350, 400, 300, 400, 400);
      timer2++;
    }
    else
    {
      Scene = 6;
    }
  }
  if (Scene == 6)
  {
    fill(#ffffff);
    rect(250, 120, 250, 300);
    ellipse(275, 100, 250, 250);
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(305, 100, 100, 100);
    ellipse(205, 100, 100, 100);
  }
}



