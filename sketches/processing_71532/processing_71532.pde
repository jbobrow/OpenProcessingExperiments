
//ABECEDARIO CONTINUO
PFont letra1;
PFont letra2;
int t=0;
int i=65;
char pt;
char pt2;
int j=97;
void setup()
{
  size(800,400);
}
void draw()
{
  letra1=createFont("SansSerif.bold",30);
  textFont(letra1);
  if(i<91)
  {
    pt=char(i);
    text(pt,5+t,30);
    t=t+15;
    i++;
  }
  letra2=createFont("Calibri",18);
  textFont(letra2);
  if(j<122)
  {
    pt2=char(j);
    text(pt2,5+t,80);
    t=t+15;
    j++;
  }  
}

