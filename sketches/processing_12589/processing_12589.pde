
void setup()
{
  size(800,500);
  background(0);
  noStroke();
  smooth();
  frameRate(24);
}

float RR=90;
float xx=0,yy=420;
int r,g,b;

float x1,y1,rad1;
int deg=0;
int r0,g0,b0;
float R=50;

float x3=100,y3;
float R3=30;
int r1,g1,b1;

float x4=20,y4;

float x5=60,y5;

float x6=800,y6=0;



void draw()
{
  background(0);
  
  //horizontal
  xx=xx+5;
  if (xx>850){xx=0;}
  fill(r,g,b);
  rect(xx,yy,RR/1.25,RR/10);
  rect(xx,yy,-RR/1.25,RR/10);
  rect(xx-RR/5,yy,RR/10,RR/1.5);
  rect(xx+RR/5,yy,-RR/10,RR/1.5);
  
  fill(g,b,r);  
  triangle(xx-.6*RR,yy-.6*RR,xx-.6*RR,yy+.6*RR,xx,yy);
  triangle(xx+.6*RR,yy-.6*RR,xx+.6*RR,yy+.6*RR,xx,yy);
 
  fill(r,g,b);
  ellipse(xx,yy,RR,RR);
  
  fill(256-r,256-g,256-b);
  rect(xx-RR/2,yy-RR/2.13,RR,RR/6);
  rect(xx-RR/4,yy-RR/2.3,RR/2.1,-RR/1.8);
  
  fill(255);
  ellipse(xx-.2*RR,yy,RR/5,RR/6);
  ellipse(xx+.2*RR,yy,RR/5,RR/6);
 
  fill(0);
  ellipse(xx-.2*RR,yy,RR/10,RR/8);
  ellipse(xx+.2*RR,yy,RR/10,RR/8);
  if(deg>=360)
  {
  r=int(random(255)); 
  g=int(random(255));
  b=int(random(255));
  deg=0;
}
  else if(deg==180 || deg==90 || deg==270)
  {
  r=int(random(255)); 
  g=int(random(255));
  b=int(random(255)); 
}

//circular
  deg=deg+5;
  rad1=radians(deg);
  x1=sin(rad1)*100+(width/2);
  y1=cos(rad1)*100+(height/2);
  fill(r,g,b);
  rect(x1,y1,R/1.25,R/10);
  rect(x1,y1,-R/1.25,R/10);
  rect(x1-10,y1,R/10,R/1.5);
  rect(x1+10,y1,-R/10,R/1.5);
  
  fill(g0,b0,r0);
  triangle(x1-30,y1-30,x1-30,y1+30,x1,y1);
  triangle(x1+30,y1-30,x1+30,y1+30,x1,y1);
   
  fill(r0,g0,b0);
  ellipse(x1,y1,R,R);
  
  fill(256-r0,256-g0,256-b0);
  rect(x1-R/2,y1-R/2.13,R,R/6);
  rect(x1-R/4,y1-R/2.3,R/2.1,-R/1.8);
  
  fill(255);
  ellipse(x1-10,y1,R/5,R/6);
  ellipse(x1+10,y1,R/5,R/6);
 
  fill(0);
  ellipse(x1-10,y1,R/10,R/8);
  ellipse(x1+10,y1,R/10,R/8);
   
  fill(255);
  ellipse(x1,y1+13,R/3,R/8);
  
  if(deg>=360)
  {
  r0=int(random(255)); 
  g0=int(random(255));
  b0=int(random(255));
  deg=0;
}
  else if(deg==180 || deg==90 || deg==270) 
  {
  r0=int(random(255)); 
  g0=int(random(255));
  b0=int(random(255)); 
}

//small racer 1
y3=y3+10;
  if (y3>550){y3=0;}
  fill(r1,g1,b1);
  rect(x3,y3,R3/1.25,R3/10);
  rect(x3,y3,-R3/1.25,R3/10);
  rect(x3-R3/5,y3,R3/10,R3/1.5);
  rect(x3+R3/5,y3,-R3/10,R3/1.5);
  
  fill(g1,b1,r1);  
  triangle(x3-.6*R3,y3-.6*R3,x3-.6*R3,y3+.6*R3,x3,y3);
  triangle(x3+.6*R3,y3-.6*R3,x3+.6*R3,y3+.6*R3,x3,y3);
 
  fill(r1,g1,b1);
  ellipse(x3,y3,R3,R3);
  
  fill(256-r1,256-g1,256-b1);
  rect(x3-R3/2,y3-R3/2.13,R3,R3/6);
  rect(x3-R3/4,y3-R3/2.3,R3/2.1,-R3/1.8);
  
  fill(255);
  ellipse(x3-10,y3,R3/5,R3/6);
  ellipse(x3+10,y3,R3/5,R3/6);
 
  fill(0);
  ellipse(x3-10,y3,R3/10,R3/8);
  ellipse(x3+10,y3,R3/10,R3/8);
  fill(255);
  ellipse(x3,y3+6,R3/3,R3/8);
   if(deg>=360)
  {
  r1=int(random(255)); 
  g1=int(random(255));
  b1=int(random(255));
  
}
  else if(deg==180 || deg==90 || deg==270)
  {
  r1=int(random(255)); 
  g1=int(random(255));
  b1=int(random(255)); 
}
//small racer 3
y5=y5+10;
  if (y5>550){y5=0;}
  fill(r0,g0,b0);
  rect(x5,y5,R3/1.25,R3/10);
  rect(x5,y5,-R3/1.25,R3/10);
  rect(x5-R3/5,y5,R3/10,R3/1.5);
  rect(x5+R3/5,y5,-R3/10,R3/1.5);
  
  fill(g0,b0,r0);  
  triangle(x5-.6*R3,y5-.6*R3,x5-.6*R3,y5+.6*R3,x5,y5);
  triangle(x5+.6*R3,y5-.6*R3,x5+.6*R3,y5+.6*R3,x5,y5);
 
  fill(r0,g0,b0);
  ellipse(x5,y5,R3,R3);
  
  fill(256-r0,256-g0,256-b0);
  rect(x5-R3/2,y5-R3/2.13,R3,R3/6);
  rect(x5-R3/4,y5-R3/2.3,R3/2.1,-R3/1.8);
  
  fill(255);
  ellipse(x5-10,y5,R3/5,R3/6);
  ellipse(x5+10,y5,R3/5,R3/6);
 
  fill(0);
  ellipse(x5-10,y5,R3/10,R3/8);
  ellipse(x5+10,y5,R3/10,R3/8);
  fill(255);
  ellipse(x5,y5+6,R3/3,R3/8);
   if(deg>=360)
  {
  r0=int(random(255)); 
  g0=int(random(255));
  b0=int(random(255));
  
}
  else if(deg==180 || deg==90 || deg==270) 
  {
  r0=int(random(255)); 
  g0=int(random(255));
  b0=int(random(255)); 
  }
  //small racer 2
y4=y4+10;
  if (y4>550){y4=0;}
  fill(r,g,b);
  rect(x4,y4,R3/1.25,R3/10);
  rect(x4,y4,-R3/1.25,R3/10);
  rect(x4-R3/5,y3,R3/10,R3/1.5);
  rect(x4+R3/5,y3,-R3/10,R3/1.5);
  
  fill(g,b,r);  
  triangle(x4-.6*R3,y4-.6*R3,x4-.6*R3,y4+.6*R3,x4,y4);
  triangle(x4+.6*R3,y4-.6*R3,x4+.6*R3,y4+.6*R3,x4,y4);
 
  fill(r,g,b);
  ellipse(x4,y4,R3,R3);
  
  fill(256-r,256-g,256-b);
  rect(x4-R3/2,y4-R3/2.13,R3,R3/6);
  rect(x4-R3/4,y4-R3/2.3,R3/2.1,-R3/1.8);
  
  fill(255);
  ellipse(x4-10,y4,R3/5,R3/6);
  ellipse(x4+10,y4,R3/5,R3/6);
 
  fill(0);
  ellipse(x4-10,y4,R3/10,R3/8);
  ellipse(x4+10,y4,R3/10,R3/8);
  fill(255);
  ellipse(x4,y4+6,R3/3,R3/8);
   if(deg>=360)
  {
  r=int(random(255)); 
  g=int(random(255));
  b=int(random(255));
  
}
  else if(deg==180 || deg==90 || deg==270) 
  {
  r=int(random(255)); 
  g=int(random(255));
  b=int(random(255)); 
  }
//corner racer, 6
x6=x6-.8;
y6=y6+.5;
  if (x6<400){x6=400;}
  if (y6>250){y6=250;}
  fill(r1,g1,b1);
  rect(x6,y6,R3/1.25,R3/10);
  rect(x6,y6,-R3/1.25,R3/10);
  rect(x6-R3/5,y6,R3/10,R3/1.5);
  rect(x6+R3/5,y6,-R3/10,R3/1.5);
  
  fill(g1,b1,r1);  
  triangle(x6-.6*R3,y6-.6*R3,x6-.6*R3,y6+.6*R3,x6,y6);
  triangle(x6+.6*R3,y6-.6*R3,x6+.6*R3,y6+.6*R3,x6,y6);
 
  fill(r1,g1,b1);
  ellipse(x6,y6,R3,R3);
  
  fill(256-r1,256-g1,256-b1);
  rect(x6-R3/2,y3-R3/2.13,R3,R3/6);
  rect(x6-R3/4,y3-R3/2.3,R3/2.1,-R3/1.8);
  
  fill(255);
  ellipse(x6-10,y6,R3/5,R3/6);
  ellipse(x6+10,y6,R3/5,R3/6);
 
  fill(0);
  ellipse(x6-10,y6,R3/10,R3/8);
  ellipse(x6+10,y6,R3/10,R3/8);
  fill(255);
  ellipse(x6,y6+6,R3/3,R3/8);
   if(deg>=360)
  {
  r1=int(random(255)); 
  g1=int(random(255));
  b1=int(random(255));
  
}
  else if(deg==180 || deg==90 || deg==270) 
  {
  r1=int(random(255)); 
  g1=int(random(255));
  b1=int(random(255)); 
}

}
  




