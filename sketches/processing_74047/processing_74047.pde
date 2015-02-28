
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
float m;
int inc1,inc2;



void setup()
{
  size(500,500);
  frameRate(10);
  minim= new Minim(this);
  in=minim.getLineIn(Minim.MONO,512);
  m=0;
  inc1=0;
  inc2=8;
}
void curvasBezier(float con, float cont)
{
  float soni, sonid;
  soni=con;
  sonid=cont;
  noFill();
  float cpx1,cx1,cy1, cx2,cy2,cpx2, cpy2,cpy1;
  float cpx3,cpy3,cx3,cy3, cx4,cy4,cpx4, cpy4;
  float thetha;
  thetha=PI/8;
  stroke(255,255,255);
 // bezier(100*cos(thetha*inc1),100*sin(thetha*inc2),125*cos(thetha*inc1),125*sin(thetha*inc2),175*cos(thetha*inc1),175*sin(thetha*inc2),200*cos(thetha*inc1),200*sin(thetha*inc2));
 // bezier(150,250,200,250,300,250,350,250);
  //bezier(250,150,250,200,250,300,250,350);
  
  cx1=100*cos(thetha*inc1);  //1° punto
  cy1=100*sin(thetha*inc1);
  cpx1=50*cos(thetha*inc1);
  cpy1=50*sin(thetha*inc1);
  
  cx2=100*cos(thetha*inc2);  //2° punto
  cy2=100*sin(thetha*inc2);
  cpx2=50*cos(thetha*inc2);
  cpy2=50*sin(thetha*inc2);
  
  cx3=100*cos(thetha*(inc1+4));  //3° punto
  cy3=100*sin(thetha*(inc1+4));
  cpx3=50*cos(thetha*(inc1+4));
  cpy3=50*sin(thetha*(inc1+4));
  
  cx4=100*cos(thetha*(inc2+12));  //4°punto
  cy4=100*sin(thetha*(inc2+12));
  cpx4=50*cos(thetha*(inc2+12));
  cpy4=50*sin(thetha*(inc2+12));
 
  //println(100*sin(thetha*2));
  
  bezier(250+cx1,250+cy1,250+sonid,250+soni,250+soni,250+sonid,250+cx2,250+cy2);
  bezier(250+cx3,250+cy3,250+soni,250+sonid,250-sonid,250-soni,250-cx4,250-cy4);
  
}
void draw()
{
  float soni, sonid;
  background(0);
  smooth();
  stroke(122,2,198);
  fill(122,2,198);
  ellipse(250,250,200,200);
  noFill();
  strokeWeight(3);
  stroke(255,255,255);
  for(int i=0;i<in.bufferSize()-1;i++)
  {
    if(abs(in.mix.get(i))>0)
    {
      m=abs(in.mix.get(i));
    }
    else 
    {
      m=0;
    } 
  }
  m=m*100;
  if(m>0.5&&m<7)
  {
  sonid=m*random(0,10);
  soni=m*random(0,10);
  }
  else if(m>=7)
  {
    sonid=7*random(0,10);
    soni=7*random(0,10);
  }
  else
  {
    sonid=0;
    soni=0;
  }
 
 
 
  
  println(m+", "+ soni+", "+sonid); 
  curvasBezier(soni, sonid);
  inc1+=1;
  inc2+=1;
  
  
}
