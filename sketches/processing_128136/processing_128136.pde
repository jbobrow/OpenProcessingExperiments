
float x,y;
float t=0;
float s=0;
float sx;
float sy;
PFont myfont;

void setup()
{
size(800, 200);
background(#DDEA89);
smooth();
noFill();
myfont = createFont("verdana", 14);
textFont(myfont);
}





  

void draw() 
{


//circle
  background(#E7F5AD);
  fill(50);
  text("Unit Circle (r = 1)",30,30);
  translate(100, 100);
  fill(#EEF7C8);
  strokeWeight(1);
  ellipse(0,0,120,120);
  
//sine wave
strokeWeight(1);
line(60,0,625,0);
fill(50);
text("x",635,0);
line(60,-80,60,80);
text("PI",140,15);
text("y",65, -80);
text("Sin at " + str(t), 100,93);
for (s=0; s<6*PI; s=s+0.01)
{
  sx=s*30+60;
  sy=60*sin(s);
  point(sx,-sy);
}
  
//point logic
  x=60*cos(2*PI-t);
  y=60*sin(2*PI-t);
  strokeWeight(6);
  point(x,y);
  strokeWeight(1);
  line(x,y,t*30+60,-(60*sin(t)));
  line(0,0,x,y);
  strokeWeight(6);
  point(t*30+60,-(60*sin(t)));
  text(" is " + str(-sin(2*PI-t)), 314,93);
  t=t+0.01;
  if (t >6*PI) t = 0;
}
