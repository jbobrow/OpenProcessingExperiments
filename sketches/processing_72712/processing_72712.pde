
boolean walk = true;

float h;
boolean backDark = true;
int back = 255;

void setup()
{
  size (900, 900);
  colorMode(HSB);
  fill(back);
  noStroke();
  rect(0, 0, width, height);
  smooth ();
  strokeWeight (3);

  h = 155;

  noFill();

  walk = true;
  backDark = false;
}

void draw()
{
  if (walk)
  {
    fill(back);
    rect(0, 0, width, height);
    strokeWeight (3);

    //Update the Hue
    h = (h + 1) % 255;
    //stroke(h, 100);
    stroke(h, 255, 255, 100);
    fill(h, 255, 255, 20);

    float ry = 0;
    float rx = 0;

    beginShape();

    //Semi-Random Tiling of Squares, Circles & Triangles
    for (int k=0; k < 100; k++)
    {
      for (int i=0; i < 151; i++)
      {
        //noFill();
        rect(rx, ry, 10, 10);
        ellipse(rx, ry, 10, 10);
        triangle(rx, ry, rx + 10, ry, rx + 5, ry - 10);

        ry = 9 * k + random(-30, 30);
        rx = 6 * i + random(-40, 40);
      }

      //Update the Hue
      h = (h + .3) % 255;
      stroke(h, 255, 255, 100);
      fill(h, 255, 255, 20);
      //stroke(h, 100);
    }

    endShape();

    //----------------------------------------------------
    //----------------------------------------------------

    walk = false;
  }
}

// Use a keypress so thousands of files aren't created
void mousePressed() 
{
  if (!walk)
  {
    walk = true;
  }
}

//Switch Background Color from White to Black or Vice Versa 
void keyPressed()
{ 
  if (backDark)
  {
    back = 255;
    backDark = false;
  }
  else
  {
    back = 0;
    backDark = true;
  }
}
