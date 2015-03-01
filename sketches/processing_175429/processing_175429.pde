
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput input;
float a,a2;
*/
void setup()
{
   size(800,1000);
  background(22,77,222);
 /* minim= new Minim(this);
  input= minim.getLineIn(Minim.MONO,400);
  a2=0;*/
}
void draw()
{
  background(22,77,222);
 /* println(input.left.get(0));
  a=input.left.get(0)*100;
  if(abs(a)>a2)
  {a2=abs(a);}
  a2*=0.98;*/
  noStroke();
  fill(180,171,151);
  rect(0,450,800,400);
  stroke(0);
  strokeWeight(2);
  fill(75,196,59);
  ellipse(300,450,300,100);
  ellipse(380,250,150,400);
  ellipse(400,0,200,500);
  fill(0);
  triangle(180,420,180,480,80,480);
  
  //tree shadows
  noStroke();
  fill(0,80);
  ellipse(60,1000,300/*+(a2*.5)*/,90);
  ellipse(175,550,300/*+(a2*.5)*/,90);
  ellipse(515,680,300/*+(a2*.5)*/,90);
  ellipse(595,480,300/*+(a2*.5)*/,60);
  ellipse(665,570,300/*+(a2*.5)*/,90);
  //Tree Stems
  fill(100,69,39);
  rect(50,100,50/*+(a*0.5)*/,800);
  rect(150,50,50/*+(a*0.5)*/,500);
  rect(510,80,50/*+(a*0.5)*/,600);
  rect(580,80,50/*+(a*0.5)*/,400);
  rect(650,70,50/*+(a*0.5)*/,500);
  //Tree Leaves
  fill(74,126,70,230);
  ellipse(200,50,350/*+(a2*.5)*/,150/*+(a2*.5)*/);
  ellipse(50,50,200/*+(a2*.5)*/,100/*+(a2*.5)*/);
  ellipse(30,100,100/*+(a2*.5)*/,100/*+(a2*.5)*/);
  ellipse(150,100,300/*+(a2*.5)*/,200/*+(a2*.5)*/);
  ellipse(180,50,150/*+(a2*.5)*/,180/*+(a2*.5)*/);
  ellipse(50,150,250/*+(a2*.5)*/,150/*+(a2*.5)*/);
  ellipse(500,150,380/*+(a2*.5)*/,260/*+(a2*.5)*/);
  ellipse(550,100,220/*+(a2*.5)*/,190/*+(a2*.5)*/);
  ellipse(580,30,450/*+(a2*.5)*/,130/*+(a2*.5)*/);
  ellipse(570,80,220/*+(a2*.5)*/,110/*+(a2*.5)*/);
  ellipse(630,90,300/*+(a2*.5)*/,100/*+(a2*.5)*/);
  
  
  pushMatrix();
  translate(0,0/*+(0.75*a2)*/);
  fill(255,226,0);
  stroke(0);
  strokeWeight(5);
  rect(-50,600,1500,400);
  popMatrix();
 
  noStroke();
  fill(121,240,255,100);
  rect(300,450,200/*+(a*.5)*/,300/*+(a*1.5)*/,6);
  fill(121,240,255,150);
  arc(400,450,200/*+(a*.5)*/,50/*+(a*1.5)*/,0,PI);
  fill(0,80);
  ellipse(400,750,330/*+(a2*.5)*/,70/*+(a2*.5)*/);
  fill(255,80);
  ellipse(400,750,250,80);
  rect(275,380,250/*+(a*.5)*/,360/*+(a*.5)*/,6);
  rect(275,360,250/*+(a*.5)*/,428/*+(a*.5)*/,6);
  arc(400,360,250,140,0,PI);
 
}
