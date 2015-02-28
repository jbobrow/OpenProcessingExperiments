
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

int value=1;
int change=0;
int r,g,b;
int []noteArray=new int[4];
SCScore aNewScore=new SCScore();
void setup()
{
  size(400,400);
  frameRate(1);
  aNewScore.tempo(60);
}
void draw()
{
  change=value;
  if(mouseX<width/2&&mouseY;<height/2)
  value=1;
  else if(mouseX>=width/2&&mouseY;<height/2)
  value=2;
  else if(mouseX<width/2&&mouseY;>=height/2)
  value=3;
  else
  value=4;
  if(value==1&&change;!=1)
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
    fill(r,g,b);
    int note=(int)random(127);
    aNewScore.addNote(0,note,100,1);
    noteArray[0]=note;
  }
  if(value==2&&change;!=2)
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
    fill(r,g,b);
    int note=(int)random(127);
    aNewScore.addNote(1,note,80,0.25);
    noteArray[1]=note;
  }
   if(value==3&&change;!=3)
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
    fill(r,g,b);
    int note=(int)random(127);
    aNewScore.addNote(2,note,110,0.5);
     noteArray[2]=note;
  }
    if(value==3&&change;!=3)
  {
    r=(int)random(255);
    g=(int)random(255);
    b=(int)random(255);
    fill(r,g,b);
    int note=(int)random(127);
    aNewScore.addNote(0,note,100,1);
     noteArray[3]=note;
  }
  rect(0,0,width/2,width/2);
  aNewScore.play();
  println("change contains the previous number that value held "+change);
  println("value holds the current quandrant number:"+value);
}
