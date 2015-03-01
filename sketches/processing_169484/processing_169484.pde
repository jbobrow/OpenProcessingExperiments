
boolean boton = false;
int q=#BF1313;
int r=#ED3907;
int s=#6DC14C;
int t=#6075D8;
float i;
float j;
float k;
float l;
float a;
float b;
float c;
float d;

void setup(){
size(500,500);
background(#68F5AF);
}

void draw()
{
  if (boton ==true)
{
stroke(#36B405);
fill(s);
s=s+t;
i=random(0,500);
j=random(0,500);
k=random(1,40);
l=random(1,40);
ellipse(i,j,k,l);
}
else
{
stroke(#FF6767); 
fill(q);
q=q+r;
a=random(1,500);
b=random(1,500);
c=random(1,40);
d=random(1,40);
rect(a,b,c,d);
}
fill(#080505);
stroke(#080505);
rect(200,200,100,100);
}
void mousePressed()
{
if (mouseX > 200 && mouseX < 300 && mouseY > 200 &&
mouseY < 300) 
{
boton = !boton;
fill(#68F5AF);
rect(0,0,500,500);
}
}
