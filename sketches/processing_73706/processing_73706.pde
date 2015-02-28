
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int coor[] = new int[8];
int col[] = new int[21];
float sig[] = new float[8];
Minim miaudio;
AudioPlayer miReproductor;

void ini()
{
  int i=0;
  for(i=0;i<20;i++)
    col[i] = (int)random(1,255);
  sig[0] = 1;
  sig[1] = -1;
  sig[2] = 1;  
  sig[3] = -1;
  sig[4] = -1;
  sig[5] = -1;
  sig[6] = 1;
  sig[7] = 1;
  
  for(i=0;i<4;i++)
  {
    coor[i] = (int)random(0,150);
    coor[i+4] = (int)sqrt((150*150)-(coor[i]*coor[i]));
    coor[i] = coor[i]*(int)sig[i];
    coor[i] = coor[i] + 200;
    coor[i+4] = coor[i+4]*(int)sig[i+4];
    coor[i+4] = coor[i+4]+200;
  }
}
void setup()
{
  miaudio= new Minim(this);
  miReproductor=miaudio.loadFile("test.mp3");
  miReproductor.play();
  miaudio.stop();
  noFill();
  size(400,400);
  frameRate(2);
  strokeWeight(3);
  smooth(); 
}
void draw()
{
  int i;
  background(0);
  stroke(col[18],col[19],col[20]);
  ellipse(width/2,height/2,300,300); 
  ini();
  for(i=0;i<4;i++)
  {
    fill(255);
    stroke(col[i],col[i+1],col[i+2]);
    ellipse(coor[i],coor[i+4],10,10);
    noFill();
  }
  for(i=0;i<2;i++)
  {
    stroke(col[i+12],col[i+13],col[i+14]);
    bezier(coor[i],coor[i+4],width/2,height/2,width/2,height/2,coor[i+2],coor[i+6]);
  }
}


