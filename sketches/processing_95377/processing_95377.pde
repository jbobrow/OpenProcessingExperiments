
import arb.soundcipher.*;
import arb.soundcipher.constonts.*;


int value=1;
int change=0;
float []noteArray=new float[4];
int r,g,b;
SCScore aNewScore=new SCScore();

void setup()
{
  size(400,400);
  frameRate(1);
}

void draw()
{
  change=value;
  for(int i=0;i<noteArray.length;i++)
  {
    noteArray[i]=random(127);
  }
  
  if(mouseX<width/2&&mouseY;<height/2)
  {
     value=1;
     float note=random(127);
     aNewScore.addNote(0,note,100,1);
  }
  
  else if(mouseX>=width/2&&mouseY;<height/2)
  
  {
    value=2;
    float note=random(127);
    aNewScore.addNote(2,note,80,0.25);
  }
  else if(mouseX<width/2&&mouseY;>=height/2)
  {
    
  value=3;
  float note=random(127);
  aNewScore.addNote(0,note,110,0.5);
  }
  else
  {
  value=4;
  float note=random(127);
  aNewScore.addNote(0,note,100,1);
  }
  if(value==1&&change;!=1)
{
  r=(int)random(255);
  g=(int)random(255);
  b=(int)random(255);
  fill(r,g,b);
  rect(0,0,width/2,height/2);
  aNewScore.play();
}
  
else if(value==2&&change;!=2)
{
   r=(int)random(255);
  g=(int)random(255);
  b=(int)random(255);
  fill(r,g,b);
  rect(width/2,0,width/2,height/2);
  aNewScore.play();
}
else if(value==3&&change;!=3)
{
  r=(int)random(255);
  g=(int)random(255);
  b=(int)random(255);
  fill(r,g,b);
  rect(0,height/2,width/2,height/2);
  aNewScore.play();
}
else
{
   r=(int)random(255);
  g=(int)random(255);
  b=(int)random(255);
  fill(r,g,b);
  rect(width/2,height/2,width/2,height/2);
  aNewScore.play();
}
  
  println("Change contains the previous number that value held:" + change);
  println("Value holds the current quandrant number:"+ value);

}
