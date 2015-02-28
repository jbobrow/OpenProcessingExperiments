
char[] nombre={'F','e','r','n','a','n','d','o'};
int a=1,b=1,c=1,d=1,e=1,f=1,g=1,h=1,i=1,j=1,k=1,l=1,m=1,n=1,o=1,p=1;
PFont tipo_letra;
void setup(){
size(300,400);
tipo_letra=loadFont("SansSerif.bolditalic-48.vlw");
}
void draw(){
background(0);
textFont(tipo_letra, 40);
if((a!=10)&&(b!=200))
{
  a=int(random(400));
  b=int(random(400));
  text(nombre[0],a,b);  
}
else
{
  text(nombre[0],10,200);
}
if((c!=40)&&(d!=200))
{
  c=int(random(400));
  d=int(random(400));
  text(nombre[1],c,d);  
}
else
{
  text(nombre[1],40,200);
}
if((e!=70)&&(f!=200))
{
  e=int(random(400));
  f=int(random(400));
  text(nombre[2],e,f);  
}
else
{
  text(nombre[2],70,200);
}
if((g!=90)&&(h!=200))
{
  g=int(random(400));
  h=int(random(400));
  text(nombre[3],g,h);  
}
else
{
  text(nombre[3],90,200);
}
if((i!=120)&&(j!=200))
{
  i=int(random(400));
  j=int(random(400));
  text(nombre[4],i,j);  
}
else
{
  text(nombre[4],120,200);
}
if((k!=150)&&(l!=200))
{
  k=int(random(400));
  l=int(random(400));
  text(nombre[5],k,l);  
}
else
{
  text(nombre[5],150,200);
}
if((m!=180)&&(n!=200))
{
  m=int(random(400));
  n=int(random(400));
  text(nombre[6],m,n);  
}
else
{
  text(nombre[6],180,200);
}
if((o!=210)&&(p!=200))
{
  o=int(random(400));
  p=int(random(400));
  text(nombre[7],o,p);  
}
else
{
  text(nombre[7],210,200);
}



  
}

