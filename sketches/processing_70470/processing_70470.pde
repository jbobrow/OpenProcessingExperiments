
// Armando Rocha 

PFont tipo_letra;
int Ax,Ay,rx,ry,mx,my,ax,ay,nx,ny,dx,dy,ox,oy;
char[] nombre={'A','r','m','a','n','d','o'};
void setup()
{
size(800,450);
smooth();
}
void draw()
{
  background(0);
tipo_letra=loadFont("Serif.bolditalic-48.vlw");
textFont(tipo_letra,70);
fill(100,150,255);
if(Ax != 230 && Ay != 250)
{
  Ax=int(random(0,700));
  Ay=int(random(0,450));
  text(nombre[0],Ax,Ay);  
}
else
{
  Ax=230; Ay=250;
  text(nombre[0],Ax,Ay);
}
if(rx != 290 && ry != 250)
{
  rx=int(random(0,700));
  ry=int(random(0,450));
  text(nombre[1],rx,ry);  
}
else
{
  rx=290; ry=250;
  text(nombre[1],rx,ry);
}
if(mx != 330 && my != 250)
{
  mx=int(random(0,700));
  my=int(random(0,450));
  text(nombre[2],mx,my);  
}
else
{
  mx=330; my=250;
  text(nombre[2],mx,my);
}
if(ax != 395 && ay != 250)
{
  ax=int(random(0,700));
  ay=int(random(0,450));
  text(nombre[3],ax,ay);  
}
else
{
  ax=395; ay=250;
  text(nombre[3],ax,ay);
}
if(nx != 440 && ny != 250)
{
  nx=int(random(0,700));
  ny=int(random(0,450));
  text(nombre[4],nx,ny);  
}
else
{
  nx=440; ny=250;
  text(nombre[4],nx,ny);
}
if(dx != 490 && dy != 250)
{
  dx=int(random(0,750));
  dy=int(random(0,450));
  text(nombre[5],dx,dy);  
}
else
{
  dx=490; dy=250;
  text(nombre[5],dx,dy);
}

if(ox != 535 && oy != 250)
{
  ox=int(random(0,800));
  oy=int(random(0,450));
  text(nombre[6],ox,oy);  
}
else
{
  ox=535; oy=250;
  text(nombre[6],ox,oy);
}
}
