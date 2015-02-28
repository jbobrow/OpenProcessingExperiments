
class bus{
  float x;
  float y;
  color c;
  int i=10;
  int j=30;
  int a=255;
  int b=255;
  int d=0;
  boolean seggo=true;
  boolean grant;
  boolean g=false;
bus(float curx,float cury, color curc)
{
x=curx;
y=cury;
c=curc;
if(curx<0)
{
grant=true;
}
else{
grant=false;
}

}
void display()
{
  

fill(c);
float w=350;
float h=200;
 float corner = w/10.0;
  float midDisp = w/20.0;
  
 beginShape();  
  
  curveVertex(x+corner,y);
    curveVertex(x+w-corner,y);
    curveVertex(x+w+midDisp,y+h/2.0);
    curveVertex(x+w-corner,y+h);
  curveVertex(x+corner,y+h);
    curveVertex(x-midDisp,y+h/2.0);
   curveVertex(x+corner,y);
  curveVertex(x+w-corner,y);
  curveVertex(x+w+midDisp,y+h/2.0);
  
 endShape();
 
  if(g==true){
a++;
b++;
d--;
if(d==0)
{g=false;}}
else if(g==false)
{
d++;
b--;
a--;
if(d==255)
{
g=true;
}
}
fill(a,b,d);
ellipseMode(RADIUS);
ellipse(x+60,y+210,i,j);
ellipse(x+260,y+210,i,j);
if(i==10)
{seggo=true;}
else if(j==10)
{seggo=false;}
if(seggo==true){i++;
j--;}
else{
j++;
i--;
}
if(grant==true)
{
x=x+2;
}
else{
x=x-2;
}
}
}

