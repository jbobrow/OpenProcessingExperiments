
void drawGradient(int gradientPosition, int alphaMaxAddition, int colorR, int colorG, int colorB)
{
  colorMode(RGB,255,255,255,255+alphaMaxAddition);
  
  for(int CountY = 0; CountY < 400; CountY++)
  {
    for(int CountX = 0; CountX < 400; CountX++)
    {
      int alpha = 0;
      
      if(gradientPosition == 1)
      {
        alpha = CountY + CountX;
      }
      else if(gradientPosition == 2)
      {
        alpha = CountY - CountX;
      }
      else //gradientPosition == 3
      {
        alpha = CountX - CountY;
      }
      
      stroke(colorR, colorG, colorB ,alpha);
      point(CountX,CountY);
    }
  }
}

void setup()
{
  size(400, 400);
  smooth();

  //Background
  colorMode(RGB, 255, 255, 255, 255);
  background(220, 255, 185);  
  
  drawGradient(1, 600, 255, 170, 0);
  drawGradient(2, 150, 30, 190, 255);
  drawGradient(3, 500, 255, 100, 200);
  drawGradient(1, 1500, 255, 255, 255);


  //Glow   
  colorMode(RGB, 255, 255, 255, 255);

  int nGy = int(random(2, 4));

  for (int iGy = 0; iGy < nGy; iGy++)
  {
    int xGy = int(random(100, 299));
    int yGy = int(random(100, 299));

    int sGy = int(random(50, 80));
    int sGyS = sGy;

    noStroke();

    while (sGy > 0)
    {
      int aGy = int( ( 255 - (sGy*255)/sGyS ) * 0.1 );
      aGy = aGy - int(random(0, 16));
      //println(sGy,sGyS,aGy);

      fill(255, 255, 255, aGy);
      ellipse(xGy, yGy, sGy, sGy);

      sGy--;
    }
  }

  int nGp = int(random(2, 5));

  for (int iGp = 0; iGp < nGp; iGp++)
  {
    int xGp = int(random(10, 199));
    int yGp = int(random(10, 199));

    int sGp = int(random(30, 60));
    int sGpS = sGp;

    noStroke();

    while (sGp > 0)
    {
      int aGp = int( ( 255 - (sGp*255)/sGpS ) * 0.1 );
      aGp = aGp - int(random(0, 16));
      //println(sGp,sGpS,aGp);

      fill(255, 255, 255, aGp);
      ellipse(xGp, yGp, sGp, sGp);

      sGp--;
    }
  }

  int nGb = int(random(3, 5));

  for (int iGb = 0; iGb < nGb; iGb++)
  {
    int xGb = int(random(200, 389));
    int yGb = int(random(200, 389));

    int sGb = int(random(20, 60));
    int sGbS = sGb;

    noStroke();

    while (sGb > 0)
    {
      int aGb = int( ( 255 - (sGb*255)/sGbS ) * 0.1 );
      aGb = aGb - int(random(0, 16));
      //println(sGb,sGbS,aGb);

      fill(255, 255, 255, aGb);
      ellipse(xGb, yGb, sGb, sGb);

      sGb--;
    }
  }


  //Bokeh
  colorMode(HSB, 100, 100, 100, 255);
  int nE = int(random(12, 17));

  for (int iE = 0; iE <= nE; iE ++)
  {
    int sE = int(random(25, 150));
    int aE = int(random(25, 205));
    int xE = int(random(10, 389));
    int yE = int(random(10, 389));

    color cE = get(xE, yE);
    int cHueE = int(hue(cE));
    int cSatE = int(saturation(cE));
    int cBriE = int(brightness(cE));
    //println(cHueE,cSatE,cBriE);

    if (cSatE > 50)
    {
      cSatE = int(random(15, 25));
    }

    if (cBriE > 65)
    {
      cBriE = int(random(50, 65));
    }

    int cSatE2 = int(cSatE * 1.7);

    fill(cHueE, cSatE2, cBriE*1.5, aE);
    stroke(cHueE, cSatE2*0.95, cBriE*1.65, aE+10);

    strokeWeight(sE/40);
    ellipse(xE, yE, sE, sE);
  }
  //println(nE,nGy,nGp,nGb);
}
