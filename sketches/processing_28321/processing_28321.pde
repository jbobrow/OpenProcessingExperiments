
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioSample A;
AudioSample B;
AudioSample C;
AudioSample D;
AudioSample E;
AudioSample F;



//RED
int r1=50;
int r2=100;
int r3=150;
int r4=100;
int r5=250;
int r6=100;
int r7=350;
int r8=100;
int r9=450;
int r0=100;
//BLUE
int b1=50;
int b2=250;
int b3=150;
int b4=250;
int b5=250;
int b6=250;
int b7=350;
int b8=250;
int b9=450;
int b0=250;
//GREEN
int g1=50;
int g2=400;
int g3=150;
int g4=400;
int g5=250;
int g6=400;
int g7=350;
int g8=400;
int g9=450;
int g0=400;

void setup()
{
  size(500,500);
  smooth();
  
  m = new Minim(this);
  A = m.loadSample("1.mp3");
  B = m.loadSample("2.mp3");
  C = m.loadSample("3.mp3");
  D = m.loadSample("4.mp3");
  E = m.loadSample("5.mp3");
  F = m.loadSample("6.mp3");
  

}

void draw()
{
  background(0);

  //RED Circles:

  fill(255,0,0,130);
  noStroke();

  ellipse(r1,r2,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,r1,r2)<35))
  {
    r1=r1 + mouseX - pmouseX;
    r2=r2 + mouseY - pmouseY;
  }
  ellipse(r3,r4,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,r3,r4)<35))
  {
    r3=r3 + mouseX - pmouseX;
    r4=r4 + mouseY - pmouseY;
  }
  ellipse(r5,r6,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,r5,r6)<35))
  {
    r5=r5 + mouseX - pmouseX;
    r6=r6 + mouseY - pmouseY;
  }
  ellipse(r7,r8,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,r7,r8)<35))
  {
    r7=r7 + mouseX - pmouseX;
    r8=r8 + mouseY - pmouseY;
  }
   ellipse(r9,r0,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,r9,r0)<35))
  {
    r9=r9 + mouseX - pmouseX;
    r0=r0 + mouseY - pmouseY;
  }
  //BLUE Circles
  fill(0,0,225,130);
  ellipse(b1,b2,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,b1,b2)<35))
  {
    b1=b1 + mouseX - pmouseX;
    b2=b2 + mouseY - pmouseY;
  }
  ellipse(b3,b4,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,b3,b4)<35))
  {
    b3=b3 + mouseX - pmouseX;
    b4=b4 + mouseY - pmouseY;
  }
  ellipse(b5,b6,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,b5,b6)<35))
  {
    b5=b5 + mouseX - pmouseX;
    b6=b6 + mouseY - pmouseY;
  }
  ellipse(b7,b8,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,b7,b8)<35))
  {
    b7=b7 + mouseX - pmouseX;
    b8=b8 + mouseY - pmouseY;
  }
  ellipse(b9,b0,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,b9,b0)<35))
  {
    b9=b9 + mouseX - pmouseX;
    b0=b0 + mouseY - pmouseY;
  }
  //GREEN Circles

  fill(0,250,0,130);
  ellipse(g1,g2,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,g1,g2)<35))
  {
    g1=g1 + mouseX - pmouseX;
    g2=g2 + mouseY - pmouseY;
  }
  ellipse(g3,g4,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,g3,g4)<35))
  {
    g3=g3 + mouseX - pmouseX;
    g4=g4 + mouseY - pmouseY;
  }
  ellipse(g5,g6,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,g5,g6)<35))
  {
    g5=g5 + mouseX - pmouseX;
    g6=g6 + mouseY - pmouseY;
  }
  ellipse(g7,g8,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,g7,g8)<35))
  {
    g7=g7 + mouseX - pmouseX;
    g8=g8 + mouseY - pmouseY;
  }
  ellipse(g9,g0,70,70);
  if((mousePressed==true) && (dist(mouseX,mouseY,g9,g0)<35))
  {
    g9=g9 + mouseX - pmouseX;
    g0=g0 + mouseY - pmouseY;
  }
//RED TOUCHES//
  if(dist(r1,r2,r3,r4)<75)
  {  A.trigger();}
  if(dist(r1,r2,r5,r6)<70)
  {  A.trigger();}
  if(dist(r1,r2,r7,r8)<70)
  {  A.trigger();}
  if(dist(r1,r2,r9,r0)<70)
 {  A.trigger();}
  if(dist(r1,r2,b1,b2)<70)
  {  D.trigger();}
  if(dist(r1,r2,b3,b4)<70)
  {  D.trigger();}
  if(dist(r1,r2,b5,b6)<70)
  {  D.trigger();}
  if(dist(r1,r2,b7,b8)<70)
  {  D.trigger();}
  if(dist(r1,r2,b9,b0)<70)
  {  D.trigger();}
  if(dist(r1,r2,g1,g2)<70)
  {  F.trigger();}
  if(dist(r1,r2,g3,g4)<70)
  {  F.trigger();}
  if(dist(r1,r2,g5,g6)<70)
  {  F.trigger();}
  if(dist(r1,r2,g7,g8)<70)
  {  F.trigger();}
  if(dist(r1,r2,g9,g0)<70)
  {  F.trigger();}
 
if(dist(r3,r4,r5,r6)<65)
{  A.trigger();}
if(dist(r3,r4,r7,r8)<65)
{  A.trigger();}
if(dist(r3,r4,r9,r0)<65)
{  A.trigger();}
if(dist(r3,r4,b1,b2)<65)
{  D.trigger();}
if(dist(r3,r4,b3,b4)<70)
{  D.trigger();}
if(dist(r3,r4,b5,b6)<70)
{  D.trigger();}
if(dist(r3,r4,b7,b8)<70)
{  D.trigger();}
if(dist(r3,r4,b9,b0)<70)
{  D.trigger();}
if(dist(r3,r4,g1,g2)<70)
{  F.trigger();}
if(dist(r3,r4,g3,g4)<70)
{  F.trigger();}
if(dist(r3,r4,g5,g6)<70)
{  F.trigger();}
if(dist(r3,r4,g7,g8)<70)
{  F.trigger();}
if(dist(r3,r4,g9,g0)<70)
{  F.trigger();}

if(dist(r5,r6,r7,r8)<65)
{  A.trigger();}
if(dist(r5,r6,r9,r0)<65)
{  A.trigger();}
if(dist(r5,r6,b1,b2)<70)
{  D.trigger();}
if(dist(r5,r6,b3,b4)<70)
{  D.trigger();}
if(dist(r5,r6,b5,b6)<70)
{  D.trigger();}
if(dist(r5,r6,b7,b8)<70)
{  D.trigger();}
if(dist(r5,r6,b9,b0)<70)
{  D.trigger();}
if(dist(r5,r6,g1,g2)<70)
{  F.trigger();}
if(dist(r5,r6,g3,g4)<70)
{  F.trigger();}
if(dist(r5,r6,g5,g6)<70)
{  F.trigger();}
if(dist(r5,r6,g7,g8)<70)
{  F.trigger();}
if(dist(r5,r6,g9,g0)<70)
{  F.trigger();}
 
 if(dist(r7,r8,r9,r0)<65)
 {  A.trigger();}
 if(dist(r7,r8,b1,b2)<70)
 {  D.trigger();}
 if(dist(r7,r8,b3,b4)<70)
 {  D.trigger();}
 if(dist(r7,r8,b5,b6)<70)
 {  D.trigger();}
 if(dist(r7,r8,b7,b8)<70)
 {  D.trigger();}
 if(dist(r7,r8,b9,b0)<70)
 {  D.trigger();}
 if(dist(r7,r8,g1,g2)<70)
 {  F.trigger();}
 if(dist(r7,r8,g3,g4)<70)
 {  F.trigger();}
 if(dist(r7,r8,g5,g6)<70)
 {  F.trigger();}
 if(dist(r7,r8,g7,g8)<70)
 {  F.trigger();}
 if(dist(r7,r8,g9,g0)<70)
 {  F.trigger();}
 
 if(dist(r9,r0,b1,b2)<70)
 {  D.trigger();}
 if(dist(r9,r0,b3,b4)<70)
 {  D.trigger();}
 if(dist(r9,r0,b5,b6)<70)
 {  D.trigger();}
 if(dist(r9,r0,b7,b8)<70)
 {  D.trigger();}
 if(dist(r9,r0,b9,b0)<70)
 {  D.trigger();}
 if(dist(r9,r0,g1,g2)<70)
 {  F.trigger();}
 if(dist(r9,r0,g3,g4)<70)
 {  F.trigger();}
 if(dist(r9,r0,g5,g6)<70)
 {  F.trigger();}
 if(dist(r9,r0,g7,g8)<70)
 {  F.trigger();}
 if(dist(r9,r0,g9,g0)<70)
 {  F.trigger();}
 
 //BLUE TOUCHES//
 if(dist(b1,b2,b3,b4)<65)
 {  B.trigger();}
 if(dist(b1,b2,b5,b6)<65)
 {  B.trigger();}
 if(dist(b1,b2,b7,b8)<65)
{  B.trigger();}
 if(dist(b1,b2,b9,b0)<65)
 {  B.trigger();}
 if(dist(b1,b2,g1,g2)<65)
 {  E.trigger();}
 if(dist(b1,b2,g3,g4)<65)
 {  E.trigger();}
 if(dist(b1,b2,g5,g6)<65)
 {  E.trigger();}
 if(dist(b1,b2,g7,g8)<65)
 {  E.trigger();}
 if(dist(b1,b2,g9,g0)<65)
 {  E.trigger();}
 
 if(dist(b3,b4,b5,b6)<65)
 {  B.trigger();}
 if(dist(b3,b4,b7,b8)<65)
 {  B.trigger();}
 if(dist(b3,b4,b9,b0)<65)
 {  B.trigger();}
 if(dist(b3,b4,g1,g2)<70)
 {  E.trigger();}
 if(dist(b3,b4,g3,g4)<65)
 {  E.trigger();}
 if(dist(b3,b4,g5,g6)<70)
 {  E.trigger();}
 if(dist(b3,b4,g7,g8)<70)
 {  E.trigger();}
 if(dist(b3,b4,g9,g0)<70)
 {  E.trigger();}
 if(dist(b5,b6,b7,b8)<70)
 {  B.trigger();}
 if(dist(b5,b6,b9,b0)<65)
 {  B.trigger();}
 if(dist(b5,b6,g1,g2)<70)
 {  E.trigger();}
 if(dist(b5,b6,g3,g4)<70)
 {  E.trigger();}
 if(dist(b5,b6,g5,g6)<70)
 {  E.trigger();}
 if(dist(b5,b6,g7,g8)<70)
 {  E.trigger();}
 if(dist(b5,b6,g9,g0)<70)
 {  E.trigger();}
 
 if(dist(b7,b8,b9,b0)<65)
 {  B.trigger();}
 if(dist(b7,b8,g1,g2)<70)
 {  E.trigger();}
 if(dist(b7,b8,g3,g4)<70)
 {  E.trigger();}
 if(dist(b7,b8,g5,g6)<70)
 {  E.trigger();}
 if(dist(b7,b8,g7,g8)<70)
 {  E.trigger();}
 if(dist(b7,b8,g9,g0)<70)
 {  E.trigger();}
 
 if(dist(b9,b0,g1,g2)<70)
 {  E.trigger();}
 if(dist(b9,b0,g3,g4)<70)
 {  E.trigger();}
 if(dist(b9,b0,g5,g6)<70)
 {  E.trigger();}
 if(dist(b9,b0,g7,g8)<70)
 {  E.trigger();}
 if(dist(b9,b0,g9,g0)<70)
 {  E.trigger();}
 
 //GREEN TOUCHES//
 if(dist(g1,g2,g3,g4)<65)
 {  C.trigger();}
 if(dist(g1,g2,g5,g6)<70)
 {  C.trigger();}
 if(dist(g1,g2,g7,g8)<70)
 {  C.trigger();}
 if(dist(g1,g2,g9,g0)<70)
 {  C.trigger();}
 if(dist(g3,g4,g5,g6)<70)
 {  C.trigger();}
 if(dist(g3,g4,g7,g8)<70)
 {  C.trigger();}
 if(dist(g3,g4,g9,g0)<70)
 {  C.trigger();}
 if(dist(g5,g6,g7,g8)<70)
 {  C.trigger();}
 if(dist(g5,g6,g9,g0)<70)
 {  C.trigger();}
 if(dist(g7,g8,g9,g0)<70)
{  C.trigger();}
}

void keyPressed() {
  if ((key == 'r') || (key == 'R'))
{
  //RED
 r1=50;
 r2=100;
 r3=150;
 r4=100;
 r5=250;
 r6=100;
 r7=350;
 r8=100;
 r9=450;
 r0=100;
//BLUE
 b1=50;
 b2=250;
 b3=150;
 b4=250;
 b5=250;
 b6=250;
 b7=350;
 b8=250;
 b9=450;
 b0=250;
//GREEN
 g1=50;
 g2=400;
 g3=150;
 g4=400;
 g5=250;
 g6=400; 
 g7=350;
 g8=400;
 g9=450;
g0=400;

}
}
void stop()
{
   A.close();
   B.close();
   C.close();
   D.close();
   E.close();
   F.close();
   
 m.stop();
 super.stop();
}




