
import peasy.*;

color[] pieces = new color[30];
color[] solved = new color[30];

PeasyCam peasy;

int moveCounter=0;

int R=0,T=1,L=2,B=3,r=4,t=5,l=6,b=7,M=8,E=9,C=10,CC=11;

boolean solving=false;

int start;
float solve=0;

void setup()
{
  for(int i=0;i<30;i++)
  {
    float opacity = 255;
    if (i<=8)pieces[i]=color(255,opacity);
    if (i>=9&&i<=11)pieces[i]=color(0,0,255,opacity);
    if (i>=12&&i<=14)pieces[i]=color(255,255,0,opacity);
    if (i>=15&&i<=17)pieces[i]=color(0,255,0,opacity);
    if (i>=18&&i<=20)pieces[i]=color(255,0,0,opacity);
    if (i>=21)pieces[i]=color(255,140,0,opacity);
    solved[i] = pieces[i];
  }
  size(500,500,P3D);
  //size(screen.width,screen.height,P3D);
  int distance = 65;
  peasy = new PeasyCam(this,distance);
  peasy.setMinimumDistance(distance);
  peasy.setMaximumDistance(distance);
  stroke(215);
  strokeWeight(8);
  textFont(createFont("Batang",10));
  textAlign(CENTER);
}

void draw()
{
  background(0);
  peasy.lookAt(0,0,0);
  /*fill(255);
  //if (solving)
    //text((frameCount-start)/frameRate,-(width/12)+10,(height/12)-5,0);
  //else
  if (!solving)
  {
    if (solve!=0) 
    {
      peasy.reset(0);
      text(solve,-17,0,-20);
    }
  }
  if (solving)*/
    show();
}


void show()
{
  //width of each square = 10;
  //front
  fill(pieces[0]); quad(-15, -15, 5, -5, -15, 5, -5, -5, 5, -15, -5, 5);
  fill(pieces[1]); quad(-5, -15, 5, 5, -15, 5, 5, -5, 5, -5, -5, 5);
  fill(pieces[2]); quad(5, -15, 5, 15, -15, 5, 15, -5, 5, 5, -5, 5);
  fill(pieces[3]); quad(-15, -5, 5, -5, -5, 5, -5, 5, 5, -15, 5, 5);
  fill(pieces[4]); quad(-5, -5, 5, 5, -5, 5, 5, 5, 5, -5, 5, 5);
  fill(pieces[5]); quad(5, -5, 5, 15, -5, 5, 15, 5, 5, 5, 5, 5);
  fill(pieces[6]); quad(-15, 5, 5, -5, 5, 5, -5, 15, 5, -15, 15, 5);
  fill(pieces[7]); quad(-5, 5, 5, 5, 5, 5, 5, 15, 5, -5, 15, 5);
  fill(pieces[8]); quad(5, 5, 5, 15, 5, 5, 15, 15, 5, 5, 15, 5);
  //top
  fill(pieces[9]); quad(-15,-15,5,-5,-15,5,-5,-15,-5,-15,-15,-5);
  fill(pieces[10]); quad(-5,-15,5,5,-15,5,5,-15,-5,-5,-15,-5);
  fill(pieces[11]); quad(5,-15,5,15,-15,5,15,-15,-5,5,-15,-5);
  //right
  fill(pieces[12]); quad(15,-15,5,15,-15,-5,15,-5,-5,15,-5,5);
  fill(pieces[13]); quad(15,-5,5,15,-5,-5,15,5,-5,15,5,5);
  fill(pieces[14]); quad(15,5,5,15,5,-5,15,15,-5,15,15,5);
  //bottom
  fill(pieces[15]); quad(5,15,5,15,15,5,15,15,-5,5,15,-5);
  fill(pieces[16]); quad(-5,15,5,5,15,5,5,15,-5,-5,15,-5);
  fill(pieces[17]); quad(-15,15,5,-5,15,5,-5,15,-5,-15,15,-5);
  //left
  fill(pieces[18]); quad(-15,5,5,-15,5,-5,-15,15,-5,-15,15,5);
  fill(pieces[19]); quad(-15,-5,5,-15,-5,-5,-15,5,-5,-15,5,5);
  fill(pieces[20]); quad(-15,-15,5,-15,-15,-5,-15,-5,-5,-15,-5,5);
  //back
  fill(pieces[21]); quad(-15, -15, -5, -5, -15, -5, -5, -5, -5, -15, -5, -5);
  fill(pieces[22]); quad(-5, -15, -5, 5, -15, -5, 5, -5, -5, -5, -5, -5);
  fill(pieces[23]); quad(5, -15, -5, 15, -15, -5, 15, -5, -5, 5, -5, -5);
  fill(pieces[24]); quad(-15, -5, -5, -5, -5, -5, -5, 5, -5, -15, 5, -5);
  fill(pieces[25]); quad(-5, -5, -5, 5, -5, -5, 5, 5, -5, -5, 5, -5);
  fill(pieces[26]); quad(5, -5, -5, 15, -5, -5, 15, 5, -5, 5, 5, -5);
  fill(pieces[27]); quad(-15, 5, -5, -5, 5, -5, -5, 15, -5, -15, 15, -5);
  fill(pieces[28]); quad(-5, 5, -5, 5, 5, -5, 5, 15, -5, -5, 15, -5);
  fill(pieces[29]); quad(5, 5, -5, 15, 5, -5, 15, 15, -5, 5, 15, -5);
}

void scramble(int length)
{
  for (int i=0;i<length;i++)
  {
    turn(int(random(0,9)),true);
  }
  moveCounter=0;
  start=frameCount;
  solving=true;
}

void turn(int move, boolean scrambling)
{
  color[] temp = new color[30];
  for (int i=0;i<30;i++)
  {
    temp[i] = pieces[i];
  }
  if (move==R)
  {
    pieces[2]=temp[29];
    pieces[5]=temp[26];
    pieces[8]=temp[23];
    pieces[29]=temp[2];
    pieces[26]=temp[5];
    pieces[23]=temp[8];
    pieces[11]=temp[15];
    pieces[15]=temp[11];
    pieces[12]=temp[14];
    pieces[14]=temp[12];
  }
  else if (move==T)
  {
    pieces[0]=temp[23];
    pieces[1]=temp[22];
    pieces[2]=temp[21];
    pieces[23]=temp[0];
    pieces[22]=temp[1];
    pieces[21]=temp[2];
    pieces[12]=temp[20];
    pieces[20]=temp[12];
    pieces[9]=temp[11];
    pieces[11]=temp[9];
  }
  else if (move==L)
  {
    pieces[0]=temp[27];
    pieces[3]=temp[24];
    pieces[6]=temp[21];
    pieces[27]=temp[0];
    pieces[24]=temp[3];
    pieces[21]=temp[6];
    pieces[9]=temp[17];
    pieces[17]=temp[9];
    pieces[18]=temp[20];
    pieces[20]=temp[18];
  }
  else if (move==B)
  {
    pieces[6]=temp[29];
    pieces[7]=temp[28];
    pieces[8]=temp[27];
    pieces[29]=temp[6];
    pieces[28]=temp[7];
    pieces[27]=temp[8];
    pieces[14]=temp[18];
    pieces[18]=temp[14];
    pieces[15]=temp[17];
    pieces[17]=temp[15];
  }
  else if (move==r)
  {
    turn(R,false);
    turn(M,false);
  }
  else if (move==t)
  {
    turn(T,false);
    turn(E,false);
  }
  else if (move==l)
  {
    turn(L,false);
    turn(M,false);
  }
  else if (move==b)
  {
    turn(B,false);
    turn(E,false);
  }
  else if (move==M)
  {
    pieces[1]=temp[28];
    pieces[4]=temp[25];
    pieces[7]=temp[22];
    pieces[28]=temp[1];
    pieces[25]=temp[4];
    pieces[22]=temp[7];
    pieces[10]=temp[16];
    pieces[16]=temp[10];
  }
  else if (move==E)
  {
    turn(C,false);
    turn(M,false);
    turn(CC,false);
  }
  else if (move==C)
  {
    pieces[0]=temp[6];
    pieces[1]=temp[3];
    pieces[2]=temp[0];
    pieces[3]=temp[7];
    pieces[5]=temp[1];
    pieces[6]=temp[8];
    pieces[7]=temp[5];
    pieces[8]=temp[2];
    pieces[9]=temp[18];
    pieces[10]=temp[19];
    pieces[11]=temp[20];
    pieces[12]=temp[9];
    pieces[13]=temp[10];
    pieces[14]=temp[11];
    pieces[15]=temp[12];
    pieces[16]=temp[13];
    pieces[17]=temp[14];
    pieces[18]=temp[15];
    pieces[19]=temp[16];
    pieces[20]=temp[17];
    pieces[21]=temp[27];
    pieces[22]=temp[24];
    pieces[23]=temp[21];
    pieces[24]=temp[28];
    pieces[26]=temp[22];
    pieces[27]=temp[29];
    pieces[28]=temp[26];
    pieces[29]=temp[23];
  }
  else if (move==CC)
  {
    turn(C,false);
    turn(C,false);
    turn(C,false);
  }
  temp = null;
  if (!scrambling)
  {
    moveCounter++;
    boolean won=true;
    for (int i=0;i<30;i++)
    {
      if (pieces[i]!=solved[i])
        won=false;
    }
    if (won)
    {
      solving=false;
      solve=(frameCount-start)/frameRate;
    }
  }
}
void keyPressed()
{
  if (keyCode==UP)
    turn(T,false);
  else if (keyCode==RIGHT)
    turn(R,false);
  else if (keyCode==DOWN)
    turn(B,false);
  else if (keyCode==LEFT)
    turn(L,false);
  else if (key==' ')
    scramble(500);
  else if (keyCode==CONTROL)
    turn(M,false);
  else if (keyCode==SHIFT)
    turn(E,false);
  else if (key=='w')
    turn(t,false);
  else if (key=='d')
    turn(r,false);
  else if (key=='s')
    turn(b,false);
  else if (key=='a')
    turn(l,false);
  else if (key=='z')
    turn(CC,false);
  else if (key=='c')
    turn(C,false);
}
void quad(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x4, float y4, float z4)
{
  beginShape();
  vertex(x1, y1, z1);
  vertex(x2, y2, z2);
  vertex(x3, y3, z3);
  vertex(x4, y4, z4);
  endShape(CLOSE);
}

