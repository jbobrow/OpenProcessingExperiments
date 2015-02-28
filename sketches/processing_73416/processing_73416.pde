
char nombre[]={'E','U','F','E','M','I','O'};
PFont tipo;
int x=0,posx=0,posy=0;
 
void setup()
{
  size(950,300);
  tipo=loadFont("Graphis-48.vlw");
  frameRate(15); 
}
 
void draw()
{
  textFont(tipo,100);
  background(255);
  posx=(int)random(0,1000);
  posy=(int)random(0,300);
  if(x==0)
  {
    fill(random(50,255),255,0);
    text(nombre[x],posx,posy);
    if(posx==50||posy==200)
    {
      x=1;
    }
  }
  else if(x==1)
  {
    fill(random(50,255),255,0);
    text(nombre[0],20,200);
    text(nombre[x],posx,posy);
    if(posx==115||posy==200)
    {
      x=2;
    }
  }
  else if(x==2)
  {
    fill(random(50,255),255,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[x],posx,posy);
    if(posx==180||posy==200)
    {
      x=3;
    }
  }
  else if(x==3)
  {
    fill(random(50,255),255,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[x],posx,posy);
    if(posx==245||posy==200)
    {
      x=4;
    }
  }
  else if(x==4)
  {
    fill(random(50,255),255,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],215,200);
    text(nombre[x],posx,posy);
    if(posx==310||posy==200)
    {
      x=5;
    }
  }
  else if(x==5)
  {
    fill(random(50,255),255,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],215,200);
    text(nombre[4],280,200);
    text(nombre[x],posx,posy);
    if(posx==385||posy==200)
    {
      x=6;
    }
  }
  else if(x==6)
  {
    fill(random(50,255),255,0);
    text(nombre[0],20,200);
    text(nombre[1],85,200);
    text(nombre[2],150,200);
    text(nombre[3],220,200);
    text(nombre[4],280,200);
    text(nombre[5],360,200);
    text(nombre[x],posx,posy);     
    if(posx==440||posy==200)
    {
      x=7;
    }
  }
}


