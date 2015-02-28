
PFont mayusculas,minusculas;
int i=65,j=97;
int x=0;
void setup()
{
 size(850,400); 
 mayusculas=loadFont("Arial-Black-48.vlw");
 minusculas=loadFont("Perpetua-BoldItalic-48.vlw");
 frameRate(10);
 smooth();
 background(215,125,26);
}

void draw()
{
  if(i>64&&i<91)
  {
    x=x+30;
    fill(0,x/2,0);
    textFont(mayusculas,32);
    text(char(i),10+x,100);
    fill(x/2,0,0);
    textFont(minusculas,40);
    text(char(j),10+x,300);
  }
  else if(i>130)
  {
    background(216,125,26);
    i=64;
    j=96;
    x=0;
  }
  i+=1;
  j+=1;
}

