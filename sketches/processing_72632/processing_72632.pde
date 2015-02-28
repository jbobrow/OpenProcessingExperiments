
float h;
boolean backDark = true;
boolean walk = true;

void setup()
{
  size (900, 900);
  colorMode(HSB);
  background (0);
  strokeWeight (2);
  smooth ();

  h = int(random(100));

  noFill();
  strokeWeight(2);
}

void draw()
{
  //Update the Hue
  h = (h + 1) % 255;
  stroke(h, 255, 255, 20);

  float ry = height/2;
  float rx = width/2;

  beginShape();

  //Drunk Walk Done Behind Tiles
  if (walk)
  {
    for (int i=0; i < 500; i++)
    {
      vertex(rx, ry);

      ry += random(-30, 30);
      rx += random(-30, 30);
    }
  }
  
  //Making Tiling
  for (int x=1; x<44; x=x+1)
  {
    for (int y=1; y<44; y=y+1)
    {  
      noFill();
      rect(x*20, y*20, 20, 20);
    }
  }

  endShape();
}

//Switch Background Color from White to Black or Vice Versa
void mousePressed()
{
  if (backDark)
  {
     background (255); 
     backDark = false;
  }
  else
  {
     background (0);
     backDark = true;
  } 
}

//Pause Drunk Walk
void keyPressed()
{ 
  if (walk)
  {
    walk = false;
  }
  else
  {
    walk = true;
  }
}
