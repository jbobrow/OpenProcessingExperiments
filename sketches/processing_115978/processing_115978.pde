
boolean norm=true, wierd=false, cool=false;
float r=250, g=250, b=250, countRed=11, countGreen=7, countBlue=9, t=0;

void setup()
{
  size(800, 800);
  pmouseX=0;
  pmouseY=0;
  mouseX=0;
  mouseY=0;
  background(255);
}

void draw()
{
  stroke(r, g, b);
        r+=countRed;
        g+=countGreen;
        b+=countBlue;
        if (r>=255)
        {
          countRed*=-1;
        }
        if (r<=0)
        {
          countRed*=-1;
        }
        if (g>=255)
        {
          countGreen*=-1;
        }
        if (g<=0)
        {
          countGreen*=-1;
        }
        if (b>=255)
        {
          countBlue*=-1;
        }
        if (b<=0)
        {
          countBlue*=-1;
        }
  if (norm)
  {
    if (mousePressed)
    {
      if (mouseButton==LEFT)
      {
        
        strokeWeight(dist(pmouseX, pmouseY, mouseX, mouseY));
        line(pmouseX, pmouseY, mouseX, mouseY);
      }
    }
  }
  if(cool)
  {
    strokeWeight(10);
    if (mousePressed)
    {
      pushMatrix();
      translate(mouseX,mouseY);
      scale(-.1);
      for(int i=0;i<100;i++)
      {
      rotate(t);
      line(pmouseX*.3,pmouseY/.2,mouseX*.2,mouseY/.2);
      line(pmouseX/1.3,pmouseY/3,mouseX/3,mouseY/1.2);
      line(pmouseX*1.2,pmouseY*1.1,mouseX*1.2,mouseY*1.3);
      line(pmouseX/.3,pmouseY/2,mouseX/2,mouseY/2);
      line(pmouseX/.2,pmouseY/.4,mouseX/.1,mouseY/.3);
      t++;
      }
      popMatrix();
      if (mouseButton==LEFT)
      {
        //line(
      }
      t=0;
    }
  }
  if (wierd)
  {
    if (mousePressed)
    {
      if (mouseButton==LEFT)
      {
        
        strokeWeight(t);
        triangle(pmouseX, pmouseY, mouseX, mouseY,pmouseX,mouseY);
        t=random(1,20);
      }
    }
  }
  if(keyPressed&&keyCode==RIGHT)
  {
    wierd=true;
    norm=false;
    cool=false;
  }
  if(keyPressed&&keyCode==LEFT)
  {
    wierd=false;
    norm=true;
    cool=false;
  }if(keyPressed&&keyCode==DOWN)
  {
    wierd=false;
    norm=false;
    cool=true;
  }
  if(mouseButton==RIGHT)
  {
    background(255);
  }
}



