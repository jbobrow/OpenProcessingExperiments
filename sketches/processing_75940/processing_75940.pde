
PFont mayusculas,minusculas;
int i=65,j=97;
int x=0;
void setup()
{
 size(1000,200); 
 mayusculas=loadFont("CooperBlack-68.vlw");
 minusculas=loadFont("CooperBlack-68.vlw");
 frameRate(30);
 smooth();
 background(#9B1313);
}

void draw()
{
  if(i>64&&i<91)
  {
    x=x+35;
    fill(#FFF52C);
    textFont(mayusculas,34);
    text(char(i),10+x,50);
    fill(#7AFCA2);
    textFont(minusculas,43);
    text(char(j),10+x,150);
  }
  else if(i>130)
  {
    background(#9B1313);
    i=64;
    j=96;
    x=0;
  }
  i+=1;
  j+=1;
}

