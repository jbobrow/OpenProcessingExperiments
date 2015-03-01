
float x1= random (800);
float y1= random (600);
float x2= random (800);
float y2= random (600);
float x3= random (800);
float y3= random (600);
float x4= random (800);
float y4= random (600);

void setup () {
  size (800, 600);
  noCursor();
  noStroke();
}
void draw () 
{
  background ((abs(x1-y4)+200), (abs(x2-y3)+200), abs(x3-y2)+200);
  fill ((abs(x4-y1)), (abs(x3-y2)), abs(x2-y3));
  quad(x1, y1, x2, y2, x3, y3, x4, y4);



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
}



