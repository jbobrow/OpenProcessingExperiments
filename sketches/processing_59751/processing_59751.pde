
ADProgress progress1, progress2;
float i=0;
float step=.8;
float dir=1;

boolean back=true;

void setup()
{
  size(300,200);
  smooth();
  
  progress1 = new ADProgress(50,30,200,40,"progress 1");
  progress1.setLabelSize(14);
  progress2 = new ADProgress(50,80,200,80,"progress 2");
  progress2.setLabelSize(24);
  progress2.setColorForeground(#043903,#19B418);
  
}


void draw()
{
  background(255);
  
  progress1.update(i);
  progress2.update(100-i);
  
  i=i+(step*dir);
  
  if (i<20) step=.5;
  if (i>90) step=40/i/(i-89);
  if (i>=20 && i<=80) step=1;
  
  
  if (i>100) dir=-1;
  if (i<0) dir=1;
  
}



