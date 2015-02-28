
PFont tipo_letra;
int nx0,nx1,nx2,nx3,nx4,nx5,nx6,nx7,nx8;
int  ny0,ny1,ny2,ny3,ny4,ny5,ny6,ny7,ny8,i;
char[] nom={'F','r','a','n','c','i','s','c','o'};

void setup()
{
  size(700,400);
  frameRate(100);
  tipo_letra=loadFont("SansSerif.italic-48.vlw");
}

void draw()
{
  background(28,72,147);
  textFont(tipo_letra,86);
  /*text(nom[0],10,200);
  text(nom[1],60,200);
  text(nom[2],100,200);
  text(nom[3],150,200);
  text(nom[4],200,200);
  text(nom[5],250,200);
  text(nom[6],270,200);
  text(nom[7],315,200);
  text(nom[8],360,200);
  */
  if(nx0!=1)
  {
    nx0=int(random(70));
    if(ny0!=20)
    {
      ny0=int(random(40));
    }
  }
  else ny0=20;
  if(nx1!=6)
  {
    nx1=int(random(70));
    if(ny1!=20)
    {
      ny1=int(random(40));
    }
  }
   else ny1=20;
  if(nx2!=10)
  {
    nx2=int(random(70));
    if(ny2!=20)
    {
      ny2=int(random(40));
    }
  }
   else ny2=20;
  if(nx3!=15)
  {
    nx3=int(random(70));
    if(ny3!=20)
    {
      ny3=int(random(40));
    }
  }
   else ny3=20;
  if(nx4!=20)
  {
    nx4=int(random(70));
    if(ny4!=20)
    {
      ny4=int(random(40));
    }
  }
   else ny4=20;
  if(nx5!=25)
  {
    nx5=int(random(70));
    if(ny5!=20)
    {
      ny5=int(random(40));
    }
  }
   else ny5=20;
  if(nx6!=27)
  {
    nx6=int(random(70));
    if(ny6!=20)
    {
      ny6=int(random(40));
    }
  }
   else ny6=20;
  if(nx7!=32)
  {
    nx7=int(random(70));
    if(ny7!=20)
    {
      ny7=int(random(40));
    }
  }
   else ny7=20;
  if(nx8!=36)
  {
    nx8=int(random(70));
    if(ny8!=20)
    {
      ny8=int(random(40));
    }
  }
   else ny8=20;
  text(nom[0],nx0*10,ny0*10);
  text(nom[1],nx1*10,ny1*10);
  text(nom[2],nx2*10,ny2*10);
  text(nom[3],nx3*10,ny3*10);
  text(nom[4],nx4*10,ny4*10);
  text(nom[5],nx5*10,ny5*10);
  text(nom[6],nx6*10,ny6*10);
  text(nom[7],nx7*10,ny7*10);
  text(nom[8],nx8*10,ny8*10);

}
