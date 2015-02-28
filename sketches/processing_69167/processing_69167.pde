
int tam=1;
char[] nombre={'O','M','A','R'};
void setup()
{
size(400,400);

}
void draw()
{  
background(0);
PFont tipo_letra;
tipo_letra=loadFont("SansSerif.bolditalic-48.vlw");
textFont(tipo_letra,35);
fill(0,0,255);
int a=int(random(0,400));
int b=int(random(0,400));
int a1=int(random(0,400));
int b1=int(random(0,400));
int a2=int(random(0,400));
int b2=int(random(0,400));
int a3=int(random(0,400));
int b3=int(random(0,400));
text(nombre[0],a,b);
text(nombre[1],a1,b1);
text(nombre[2],a2,b2);
text(nombre[3],a3,b3);
tam++;
if(a!=160 && b!=200 && a1!=210 && b1!=200 && a2!=260 && b2!=200 && a3!=310 && b3!=200)
{
  
  background(0);
  text(nombre[0],a,b);
  text(nombre[1],a1,b1);
  text(nombre[2],a2,b2);
  text(nombre[3],a3,b3);
}
else
{
  parar0();
 }

}//fin del void draw
void parar0()
  {
  background(0);  
  text(nombre[0],160,200);
  text(nombre[1],210,200);
  text(nombre[2],260,200);
  text(nombre[3],310,200);
  noLoop();
  }

