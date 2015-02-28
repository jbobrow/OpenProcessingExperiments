
float i = 0.0;

void setup()
{
  size (500, 500);
  background(255);
  //colorMode(HSB, 360, 100, 100);
}

void draw()

{
  float h = map(sin(i), -1, 1, 150, 50);
  float g = map(sin(i), 1, 1, 100, 100);

  // background(h, mouseX, mouseY/2);

  //colorMode(HSB, 360, 100,100);
  fill(HSB, 0, 89, 30);
  triangle (0,0,mouseX,mouseY, h, h);

  fill(142, 42, 42, 20);
  noStroke();
  //rectMode(CENTER);
  //ellipse (250, 250, g, g);
  triangle (100,100,h,h, mouseX, mouseY);

  

  if (mousePressed == true)

  {
    
      fill(205, 23, 23, 20);
    triangle (mouseX, mouseY,100,100, g, g);
  }

    i += 0.05;
  }

