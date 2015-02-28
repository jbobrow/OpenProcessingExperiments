
//Loops

size(600,600);
smooth();
noFill();

//background
float r = 100;
float g = 240;
float b = 31;
int k = 0;
while (k < 600)
{
  stroke(r,g,b);
  line (k,0,k,600);
  k = k+1;
  r = r + (166-100)/600.0;
  g = g + (31-240)/600.0;
  b = b + (240-31)/600.0;
}


//background2
float r2=146;
float g2=25;
float b2=247;
int o=50;
while (o<551)
{
  stroke(r2,g2,b2,150);
  line(o,50,o,550);
  o=o+1;
  r2= r2+(45-146)/450.;
  g2= g2+(234-25)/450.0;
  b2= b2+(68-247)/450.0;
}

//horizontal
stroke(15,187,247);
int x=85;
while(x<515)
{ellipse(300,300,x,200);
x=x+10;}

//vertical
stroke(239,247,15);
int y=75;
while(y<525)
{ellipse(300,300,200,y);
y=y+10;}

//middle
stroke(255);
int z=0;
while(z<200)
{
  ellipse(300,300,z,z);
  z=z+10;
}

//dots
stroke(255,255,255,25);
int q=0;
while(q<600)
{
  int s=0;
  while(s<600)
  {
    ellipse(s,q,100,100);
    s=s+10;
  }
  q=q+10;
}
