
float a=0.0;
float b=0.0;
float c=0.0;
 
void setup()
{
size(550,550);
background(0,0,0);
smooth();
frameRate(5);
}
 
void draw()
{
fill(255,0,0);
arc (200,200,150,150,0+a,PI/4+a);
a+=0.05;
 
fill(0,255,0);
arc (350,209,90,90,0+c,PI/4+c);
b+=0.05; 
  
fill(0,0,255);
arc (460,205,50,50,0+b,PI/4+b);
c+=0.05;
}
