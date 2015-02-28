
//Ara Lee
//aral
//copyright Ara Lee, September 2013, Pittsburgh, PA
//hw3
//257

float x,y,wd,ht,i,a;

void setup()
{
  size(400,400);
  background(255);
  
  //x=width*.34;
  //y=height*.52;
  //wd=width*.21;
  //ht=height*.44;
  
  i=0;  //ellipse loop var
  a=0;  //rect loop var
}

void draw()
{
  if (mousePressed)
  {
    i=i+1;
    if (i<350) //draw with ellipses
    {
      ellipse(mouseX,mouseY,2*(30+pmouseX-mouseX+.3*mouseY),2*(30+pmouseY-mouseY+.3*mouseX));
      fill(random(255),random(255),random(255),10);
    }
    else
    {
      if (a<30) //spazzing rect
      {
        fill(random(255),random(255),random(255));
        rect(0,0,400,400);
        a=a+1;
      }
      else
      {
        a=0;
        i=0;
      }
    }
//    i=i+1;
//    if (i>100)
//    {
//      for (int a=0; a<2000; a=a+1)  //spazzing rect
//      {
//        frameRate(10);
//        fill(random(255),random(255),random(255));
//        rect(0,0,400,400);
//      }
//      frameRate(60);
//      i=0;
//    }
  }
  else
  {
    fill(255,255,255,10);
    rect(0,0,400,400);
  }
}


