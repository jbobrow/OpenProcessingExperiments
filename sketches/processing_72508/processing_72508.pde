
float x=0;
int b=0;
int b2=0;
float y1=0;
float y=0;
float d=255;
float k=random(10,15);
void setup()
{
  size(600,600);
background(0,0,0);
}
void draw()
{
  fill(0,0,0,100);
  rect(0,0,600,600);
  bodyHead();
  arms();
  face();
  block();
}
void keyPressed()
{
  if (key=='w')
  {
  x=x+random(-4,4);
  y1=y1+random(-4,4);
  y=y+k;
  d=d-k;   
if (d<0)
     {
     k=-10;
     }
     if(d>255)
     {
       k=15;
     }
}
}
void bodyHead()
{
  fill(y,0,d);
smooth();
noStroke();
rect(295+x,320+y1,12,105);
translate(295+x,421+y1);
rotate(PI/6);
rect(0,0,10,60);
rotate(-PI/6);
rotate(2*PI-PI/6);
rect(1,5,10,60);
rotate(-(2*PI-PI/6));
translate(-295-x,-421-y1);
ellipse(300+x,300+y1,50,50);
}

void arms()
{
rect(235+x,340+y1,60,10);
rect(307+x,340+y1,55,10);
}
void face()
{
stroke(0,0,0);
strokeWeight(5);
line(285+x,290+y1,290+x,295+y1);
line(290+x,290+y1,285+x,295+y1);
line(305+x,290+y1,310+x,295+y1);
line(310+x,290+y1,305+x,295+y1);
if((b>305+x)&&(b>295+x)&&(b2<305+y1)&&(b2>295+y1))
{
x=random(-100,100);
y1=random(-100,100);

}
}
void mouseDragged()
{
  if(mouseButton==LEFT)
  {
   
    b=mouseX;
    b2=mouseY;
  }
}
void block()
{
  translate(b,b2);
  rotate(PI/4);
  rect(0,0,10,100);
}
  

