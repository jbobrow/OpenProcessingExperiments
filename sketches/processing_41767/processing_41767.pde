
class Baby{
  int xPos;
  int yPos;
  int xnow;
  int ynow;
  int hNow;
  int wNow;
  float r;
  
Baby(int x, int y)
  {
    xPos=x;
    yPos=y;
    xnow=465;
    ynow=410;
    hNow=round(n.width*.5);
    wNow=round(n.height*.5);
    r=random(2*PI);

  }  
  
  boolean move(){
    if((xnow==xPos)&&(ynow==yPos)&& (hNow==n.height) && (wNow==n.width))
    return false;
    //so this means that we reached our destination.
    else
    {
      if (xnow>xPos) //if where we are right now, is greater than where we want to be
        xnow--;
      if (xnow<xPos)
        xnow++;
      if (ynow>yPos)
        ynow--;
      if (ynow<yPos)
        ynow++;
      if (hNow!=n.height)
       hNow++;
      if (wNow!=n.width)
       wNow++;

    return true;
    }
  }
  
  void drawMe(){
 pushMatrix();
 translate(xnow,ynow);
  rotate(r);
  image(n,0,0, wNow, hNow);
 popMatrix();
  }
  
}

