
//homework 5
//Copyright Kinnari Thakker August 2011, Pittsburgh 15224

int i,j;
void setup()
{
size( 800, 800);
smooth();

}

void draw()
{
i=10;
  while(i <= height) // Background Texture
  {
  stroke(200);
  line( 0, i, width, i);
  line( 0, i, i, 0);
  line( 0, i+ height, i+ width, 0);
  i = i + 5;
  }


strokeWeight(1);
int colorR=0;
int colorG=0;
int colorB=0;
int inc=5;
j=0;
while(j <= width)
{

  if (colorR <= 255 & colorG == 0 ) // here begins my failed attempt at making a color wheel
  { 
  stroke(colorR,colorG,colorB);
  colorR=colorR+inc;
  //colorG=0;
  //colorB=0;
  }

  else if (colorG <= 255 & colorB == 0) 
  {
  stroke(colorR,colorG,colorB);
  colorG=colorG+inc;
  colorR=colorR-inc;
  }

  else if (colorB <= 255 & colorB>=0) 
  {
  stroke(colorR,colorG,colorB);
  colorB=colorB+inc;
  colorG=colorG-inc;
  }


line(width/2,height/2,j,0) ;
line(width/2,height/2,0,j);
line(width/2,height/2,width,j);
line(width/2,height/2,j,height);
j=j+5;


}
//saveFrame("hw5.jpg");
}

