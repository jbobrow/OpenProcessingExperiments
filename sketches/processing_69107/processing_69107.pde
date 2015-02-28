
//Stephanie Wong Loops mods: 14-15
//url: http/www.STPrograms.webs.com
size (250,250);
background(0);
noFill();
stroke(255,0,0);
int x=1;
while(x<150)
{
  beginShape();
  curveVertex(1,1);
  curveVertex(1,1);
  curveVertex(80,x);
  curveVertex(130,1);
  curveVertex(200,x);
  curveVertex(250,1);
  curveVertex(250,1);
  endShape();
  x=x+3;
}
//yellow
stroke(251,217,13);
int z=100;
while(z<250)
{
  beginShape();
  curveVertex(1,1);
  curveVertex(1,1);
  curveVertex(80,z);
  curveVertex(130,1);
  curveVertex(200,z);
  curveVertex(250,1);
  curveVertex(250,1);
  endShape();
  z=z+3;
}
//Orange
stroke(252,133,13);
int y=20;
while(y<200)
{
  beginShape();
  curveVertex(1,1);
  curveVertex(1,1);
  curveVertex(80,y);
  curveVertex(130,1);
  curveVertex(200,y);
  curveVertex(250,1);
  curveVertex(250,1);
  endShape();
  y=y+4;
}

//Purple
stroke(149,30,247);
int c=1;
while(c<250)
{
  beginShape();
  curveVertex(1,c);
  curveVertex(1,c);
  curveVertex(80,250);
  curveVertex(130,c);
  curveVertex(200,250);
  curveVertex(250,c);
  curveVertex(250,c);
  endShape();
  c=c+3;
}
//Blue
stroke(0,0,255);
int b=1;
while(b<180)
{
  beginShape();
  curveVertex(1,b);
  curveVertex(1,b);
  curveVertex(80,250);
  curveVertex(130,b);
  curveVertex(200,250);
  curveVertex(250,b);
  curveVertex(250,b);
  endShape();
  b=b+5;
}
//Green
stroke(0,255,0);
int a=1;
while(a<100)
{
  beginShape();
  curveVertex(1,a);
  curveVertex(1,a);
  curveVertex(80,250);
  curveVertex(130,a);
  curveVertex(200,250);
  curveVertex(250,a);
  curveVertex(250,a);
  endShape();
  a=a+5;
}
