
float x1= random (800);
float y1= random (600);
float x2= random (800);
float y2= random (600);
float x3= random (800);
float y3= random (600);
float x4= random (800);
float y4= random (600);
float x5= random (800);
float y5= random (600);
float x6= random (800);
float y6= random (600);
float x7= random (800);
float y7= random (600);
float x8= random (800);
float y8= random (600);

void setup () {
  size (800, 600);
  noCursor();
  noStroke();
}
void draw () 
{
  background (#444444);
  fill ((abs(x4-y1)), (abs(x3-y2)), abs(x2-y3));
  quad(x1, y1, x2, y2, x3, y3, x4, y4);
  fill ((abs(x8-y5)), (abs(x7-y6)), abs(x6-y7));
  quad(x5, y5, x6, y6, x7, y7, x8, y8);


  if (x1<=800&&x1>=0) 
  { 
    if (random(10)>=5) 
    {
      x1++;
    } else 
    {
      x1--;
    }
  } else 
  {
    if (x1<=800) 
    {
      x1++;
    } else { 
      if (x1>=0) 
      {
        x1--;
      }
    }
  }
  if (y1<=600&&y1>=0) 
  { 
    if (random(10)>=5) 
    {
      y1++;
    } else 
    {
      y1--;
    }
  } else 
  {
    if (y1<=600) 
    {
      y1++;
    } else { 
      if (y1>=0) 
      {
        y1--;
      }
    }
  }
  if (x2<=800&&x2>=0) 
  { 
    if (random(10)>=5) 
    {
      x2++;
    } else 
    {
      x2--;
    }
  } else 
  {
    if (x2<=800) 
    {
      x2++;
    } else { 
      if (x2>=0) 
      {
        x2--;
      }
    }
  }
  if (y2<=600&&y2>=0) 
  { 
    if (random(10)>=5) 
    {
      y2++;
    } else 
    {
      y2--;
    }
  } else 
  {
    if (y2<=600) 
    {
      y2++;
    } else { 
      if (y2>=0) 
      {
        y2--;
      }
    }
  }
  if (x3<=800&&x3>=0) 
  { 
    if (random(10)>=5) 
    {
      x3++;
    } else 
    {
      x3--;
    }
  } else 
  {
    if (x3<=800) 
    {
      x3++;
    } else { 
      if (x3>=0) 
      {
        x3--;
      }
    }
  }
  if (y3<=600&&y3>=0) 
  { 
    if (random(10)>=5) 
    {
      y3++;
    } else 
    {
      y3--;
    }
  } else 
  {
    if (y3<=600) 
    {
      y3++;
    } else { 
      if (y3>=0) 
      {
        y3--;
      }
    }
  }
  if (x4<=800&&x4>=0) 
  { 
    if (random(10)>=5) 
    {
      x4++;
    } else 
    {
      x4--;
    }
  } else 
  {
    if (x4<=800) 
    {
      x4++;
    } else { 
      if (x4>=0) 
      {
        x4--;
      }
    }
  }
  if (y4<=600&&y4>=0) 
  { 
    if (random(10)>=5) 
    {
      y4++;
    } else 
    {
      y4--;
    }
  } else 
  {
    if (y4<=600) 
    {
      y4++;
    } else { 
      if (y4>=0) 
      {
        y4--;
      }
    }
  }
  if (x5<=800&&x5>=0) 
  { 
    if (random(10)>=5) 
    {
      x5++;
    } else 
    {
      x5--;
    }
  } else 
  {
    if (x5<=800) 
    {
      x5++;
    } else { 
      if (x5>=0) 
      {
        x5--;
      }
    }
  }
  if (y5<=600&&y5>=0) 
  { 
    if (random(10)>=5) 
    {
      y5++;
    } else 
    {
      y5--;
    }
  } else 
  {
    if (y5<=600) 
    {
      y5++;
    } else { 
      if (y5>=0) 
      {
        y5--;
      }
    }
  }
  if (x6<=800&&x6>=0) 
  { 
    if (random(10)>=5) 
    {
      x6++;
    } else 
    {
      x6--;
    }
  } else 
  {
    if (x6<=800) 
    {
      x6++;
    } else { 
      if (x6>=0) 
      {
        x6--;
      }
    }
  }
  if (y6<=600&&y6>=0) 
  { 
    if (random(10)>=5) 
    {
      y6++;
    } else 
    {
      y6--;
    }
  } else 
  {
    if (y6<=600) 
    {
      y6++;
    } else { 
      if (y6>=0) 
      {
        y6--;
      }
    }
  }
  if (x7<=800&&x7>=0) 
  { 
    if (random(10)>=5) 
    {
      x7++;
    } else 
    {
      x7--;
    }
  } else 
  {
    if (x7<=800) 
    {
      x7++;
    } else { 
      if (x7>=0) 
      {
        x7--;
      }
    }
  }
  if (y7<=600&&y7>=0) 
  { 
    if (random(10)>=5) 
    {
      y7++;
    } else 
    {
      y7--;
    }
  } else 
  {
    if (y7<=600) 
    {
      y7++;
    } else { 
      if (y7>=0) 
      {
        y7--;
      }
    }
  }
  if (x8<=800&&x8>=0) 
  { 
    if (random(10)>=5) 
    {
      x8++;
    } else 
    {
      x8--;
    }
  } else 
  {
    if (x8<=800) 
    {
      x8++;
    } else { 
      if (84>=0) 
      {
        x8--;
      }
    }
  }
  if (y8<=600&&y8>=0) 
  { 
    if (random(10)>=5) 
    {
      y8++;
    } else 
    {
      y8--;
    }
  } else 
  {
    if (y8<=600) 
    {
      y8++;
    } else { 
      if (y8>=0) 
      {
        y8--;
      }
    }
  }
}



