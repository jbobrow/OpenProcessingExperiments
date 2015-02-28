
import arb.soundcipher.*;
import arb.soundcipher.constants.*;
SoundCipher mysample = new SoundCipher(this);

int x=20,y=20, 
speedX=1, speedY=1, 
q=175, a=0, 
c=x, d=y;

boolean pause = false;

int value=1, change=1;

boolean q1=false, q2=false, q3=false, q4=false, 
q5=false, q6=false, q7=false, q8=false, 
q9=false,q10=false,q11=false, q12=false,
q13=false, q14=false, q15=false, q16=false;

void setup()
{
  size(600, 450);
  background(2, 3, 41);
}
void draw()
{
background(2, 3, 41);
for(int j = 0; j<height/10; j=j+2)
{
stroke(255);
line(width/2, j*10, width/2, (j*10)+10);
}

gridDivision();
stroke(0);
paddles();
ball();
pause();
noiseMaker();
}
void ball()
{
  fill(255, 255, 0);
  ellipse(x, y, 18, 18);
  x=x+speedX;
  y=y+speedY;
  if(y==height-9 || y==9)
  speedY=speedY*-1;
  if(x<19)
  {
   speedX=speedX*-1;
 }

   if(x>581)
  {
   speedX=speedX*-1;
 }
   
}
void paddles()
{
  if(y<426)
  q=y-25;
  fill(252, 84, 5);
  rect(0, q, 10, 50);
  rect(590, q, 10, 50);
if (q>399)
q=400;
if(q<1)
q=0;
}
void keyPressed()
{
  if (key=='s')
    a=a+1;
}
void pause()
{
  if (speedX!=0)
  {c=speedX; d=speedY;}
  if(a%2==1)
  pause=true;
  if(a%2==0)
  pause=false;
  if (pause==true)
  {speedX=0; speedY=0;}
  if (pause==false)
  {
    speedX=c;
    speedY=d;
  }

}
  void gridDivision()
  {   
   change = value;
      for(int i=1; i<4; i++)
  {
    stroke(43, 151, 203);
    line((width/4)*i, 0, (width/4)*i, height);
    line(0, (height/4)*i, width, (height/4)*i);
  }
  if(x<width/4 && y<width/4)
  value=1;
  if(value==1 && change!=1)
  q1=true;
  if(value==1 && change==1)
  q1=false;
  if(x>width/4 && y<width/4)
  value=2;
  if(value==2 && change!=2)
  q2=true;
  if(value==2 && change==2)
  q2=false;
  if(x<width/4 && y>width/4)
  value=3;
  if(value==3 && change!=3)
  q3=true;
  if(value==3 && change==3)
  q3=false;
  if(x>width/4 && y>width/4)
  value=4;
  if(value==4 && change!=4)
  q4=true;
  if(value==4 && change==4)
  q4=false;
  }
  void noiseMaker()
  {
    int randNote = (int)random(127);
    if (q1=true)
    mysample.playNote(randNote, 80, .25);
    if (q2=true)
    mysample.playNote(randNote, 80, .25);
    if (q3=true)
    mysample.playNote(randNote, 80, .25);
    if (q4=true)
    mysample.playNote(randNote, 80, .25);
  }
