
import processing.pdf.*;
float colorR = random(100, 255);
float colorG = random(70, 255);
float colorB = random(80, 255);

void setup()
{
  //use this function in combination with exit() below to produce a pdf file 
  //size(1024, 768, PDF, "wallpaper.pdf");
  size(1024, 768);
  smooth();
  background(colorR, colorG, colorB);
  rectMode(CENTER);
  for (int i = 0; i < 6; i++)
  {
    for (int j = 0; j < 6; j++)
    {
      fill(colorR, colorG, colorB);
      ellipse((width/12) + i*(width/6), (height/12) + j*(height/6), 100, 100);
    }
  }
}

void draw()
{
  float dr = random(-10, 10);
  float dg = random(-10, 10);
  float db = random(-10, 10);
  colorR = constrain(colorR + dr, 0, 255);
  colorG = constrain(colorG + dg, 0, 255);
  colorB = constrain(colorB + db, 0, 255);
  
  stroke(0);
  for (int i = 0; i < 6; i++)
  {
    for (int j = 0; j < 6; j++)
    {
      if (random(50) < 1)
      {
        fill(colorR + random(-30, 30), colorG + random(-30, 30), colorB + random(-30, 30));
        float n = random(2);
        ellipse((width/12) + i*(width/6), (height/12) + j*(height/6), n*50, n*50);
      }
    }
  }
  
  noStroke();
  fill(colorR, colorG, colorB, 2);
  rect(width/2, height/2, width + 5, height + 5);
 
  //exit();
}
