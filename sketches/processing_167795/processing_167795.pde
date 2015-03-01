
int x=0;
int y=300;
int c=#521E1E;
int a=#832424;
int l=#474E74;
int i=#FFFFFF;
int d=#E0FF00;
int o=#1B5F20;

void setup()
{
  background(l);
  size(650,650);
 
}
void draw()
{ 
   
   background(l);
   fill(c);
   c=c+a;
   ellipse(x-30,340,20,55);
   ellipse(x,340,20,55);
   ellipse(x-10,230,120,230);
   ellipse(x,90,70,70);
   fill(i);
   ellipse(x+8,75,10,10);
   fill(c);
   ellipse(x+13,75,05,05);
   fill(d);
   d=d+i;
   ellipse(x+40,90,30,10);
   ellipse(x+40,90,30,5);
   fill(c);
   ellipse(x-30,200,10,55);
ellipse(x-40,210,10,55);
ellipse(x-40,190,10,55);
ellipse(x-40,240,10,95);
ellipse(x-50,220,10,55);
ellipse(x-50,200,10,55);
ellipse(x-50,190,10,55);
ellipse(x-50,180,10,55);
ellipse(x-60,250,10,95);
ellipse(x-60,230,10,65);
ellipse(x-60,200,10,55);
ellipse(x-60,190,10,55);
ellipse(x-70,260,10,95);
ellipse(x-70,230,10,65);
ellipse(x-70,200,10,55);
ellipse(x-70,210,10,65);
ellipse(x-70,190,10,55);
ellipse(x-80,280,10,105);
ellipse(x-80,210,10,65);
ellipse(x-80,250,10,85);
ellipse(x-80,250,10,75);
ellipse(x-80,240,10,105);
ellipse(x-80,250,10,95);
ellipse(x-80,200,10,55);
   
   ellipse(x-100,300,20,200);
ellipse(x-100,300,8,195);

ellipse(x-90,290,10,105);
ellipse(x-90,290,10,185);
ellipse(x-90,250,10,95);
ellipse(x-90,210,10,55);
ellipse(x+60,270,15,195);
ellipse(x+60,250,10,95);
ellipse(x+60,200,10,55);
ellipse(x+60,210,10,55);
ellipse(x+60,190,10,55);
ellipse(x+60,180,10,55);
ellipse(x+50,240,10,95);
ellipse(x+50,220,10,55);
ellipse(x+70,200,10,55);
ellipse(x+70,190,10,55);
ellipse(x+70,250,10,95);
ellipse(x+50,200,10,55);
ellipse(x+50,190,10,55);
ellipse(x-30,120,15,65);
ellipse(x-30,120,10,35);
ellipse(x-30,130,10,35);
ellipse(x-20,120,10,35);
ellipse(x-20,130,10,35);
ellipse(x-10,130,10,35);

strokeWeight(2);
stroke(d);
line(x,360,x-10,365);
line(x,360,x,365);
line(x,360,x+10,365);

stroke(d);
line(x-30,360,x-40,365);
line(x-30,360,x-30,365);
line(x-30,360,x-20,365);

ellipse(x-20,410,60,100);

stroke(d);
fill(d);
ellipse(x+350,0,180,180);

stroke(o);
fill(o);
o=o+i;
ellipse(x-20,410,60,100);

ellipse(x-20,500,60,100);
ellipse(x-20,600,60,100);

ellipse(x+30,480,100,60);
ellipse(x+100,460,100,60);

ellipse(x-100,480,100,60);
ellipse(x-150,460,100,60);
x=x+10;
}

