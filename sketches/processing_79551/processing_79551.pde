

void circleCreation()
{

  for (int q = 0; q <number; q++)
  {
    println(mouseDistance);
    if (mouseDistance > 360)
    {
      mouseDistance = 0;
    }
    //    println(h[q]);

    a[q] = constrain(a[q], minAlpha, 255);
    h[q] = constrain(h[q], 0, 360);

    fcount = q;
    if (!mousePressed)
    {
      if (dist(xArray[q], yArray[q], mouseX, mouseY) < 100/2)
      {
        a[q] = a[q]-50;

      }
    }
    flashlight();
    if (mousePressed)
    {
      if (dist(mouseX, mouseY, pmouseX, pmouseY) > 7)
      {
        mouseDistance= mouseDistance+.004;
      }

      if (dist(xArray[q], yArray[q], mouseX, mouseY) < 150/2)
      {
        a[q] = a[q] + 100;
        h[q] = mouseDistance;
        s[q] = 255;
      }
    }


    a[q]=a[q]-2;
    if (a[q] < 5)
    {
      s[q]= 0;
    }


    colorMode(HSB);
    //println(h[q]);
    stroke(h[q], 200, 255, a[q]/2);
    strokeWeight(a[q]/60);
    fill(h[q], s[q], 255, a[q]);
    ellipse(xArray[q], yArray[q], r[q], r[q]);
    colorMode(RGB);
  }

  noStroke();
  for (int i = 0; i < 20; i++)
  {
    fill(255, 20-i*2);
    ellipse(mouseX, mouseY, i*10, i*10);
  }
}


