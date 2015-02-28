
void setup()
{ 
  size(500, 500);
  background(255, 255, 255);
  strokeWeight(3);
  int i=100, j=100;
  while (i<=300)
  {
    while (j<=300)
    {
      rect(i, j, 100, 100);
      j+=100;
    }
    i+=100; 
    j=100;
  }
}

void draw()
{
   int x=0, y=0, a=255, b=255;
   int j=mouseX, k=mouseY;
   if(mouseX>100 && mouseX<400 && mouseY>100 && mouseY<400 && j!=200 && j!=300 && k!=200 && k!=300) 
  {
  if(mousePressed)
   { if(mouseX<200 && mouseX>100) x=100;
     if(mouseX<300 && mouseX>200) x=200;
     if(mouseX<400 && mouseX>300) x=300;
     if(mouseY<200 && mouseY>100) y=100;
     if(mouseY<300 && mouseY>200) y=200;
     if(mouseY<400 && mouseY>300) y=300;
 
      if(mouseButton==LEFT) { a=255; b=0; }
      if(mouseButton==LEFT) { a=0; b=255; }
   
   
   {fill(a,b,0);
   ellipse(x+50,y+50,70,70);}
   }}
}


