
PFont fuente;
String[] fontList =PFont.list();
char minu='a',mayu='A';
float distancia,a,b;
void setup()
{
  size(1200,200);
  frameRate(3);
  background(255,0,153);
  distancia=0;
  println(fontList);
  a=random(0,255);
  b=random(0,255);
}
 
void draw()
{

  fill(a);
  fuente= createFont("SansSerif.bold",40);
  textFont(fuente);
  text(minu,20+distancia,80);
  fill(b);
  fuente= createFont("Andalus",40);
  textFont(fuente);
  text(mayu,20+distancia,160);
  if(minu<'z')
  {  
    minu++;
    mayu++;
    distancia+=40;
  }
  else
  {  
    minu='a';
    mayu='A';
    distancia=0;
    a=random(0,255);
    b=random(0,255);
  }
}


