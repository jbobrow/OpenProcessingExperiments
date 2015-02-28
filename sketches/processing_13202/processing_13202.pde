
//Jonathan Flinders Gendall Final
//CMPO 211 2010
import processing.opengl.*;
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

ArrayList <Piece> mPieces = new ArrayList<Piece>();
ArrayList <Line> mLines = new ArrayList<Line>();

PieceManager mPieceManager;

float xt, yt,xa,ya;
int many;

int opens;

void setup()
{
  oscP5 = new OscP5(this,12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);

  noCursor();

  noiseDetail (2,0.6);
  size (1280,800,OPENGL);
  frameRate(60);
  smooth();
  background (0);

  mPieceManager = new PieceManager();
  for (int i = 0; i < 200; i++)  //change amount of pieces used
  {
    PVector randVec = new PVector(random(width), random(height));
    //PVector ringVec = new PVector(cos(TWO_PI*(width/2))*500,cos(TWO_PI*(height/2))*500);
    mPieces.add(new Piece(randVec, color(random(100,255),10,150))); //choose random or ring
  }
}


void draw()
{ 
  opens = 1;

  if(keyPressed)
  {
    if (key == 'r')
    {
      setup();
    }
    else if (key == 'o')
    {
      opens = 0;
    }
  }

  mPieceManager.draw();
  mPieceManager.update();
  if (opens == 1)
  {
    cent();
  }
}

void cent()
{ 
  xt = 0;
  yt = 0;
  xa = 0;
  ya = 0;

  for (int i = 0; i < mPieces.size(); i++)
  {
    xt = mPieces.get(i).mLoc.x;
    yt = mPieces.get(i).mLoc.y;
  }

  xa = xt/mPieces.size();
  ya = yt/mPieces.size();
  xt = 0;
  yt = 0;

  for (int i = 0; i < mPieces.size(); i++)
  {
    xt += xa-(mPieces.get(i).mLoc.x);
    yt += ya-(mPieces.get(i).mLoc.y);
  }

  OscMessage myMessage = new OscMessage("/center");
  myMessage.add(xa);
  myMessage.add(ya);
  myMessage.add(xt);
  myMessage.add(yt);
  myMessage.add(many);
  oscP5.send(myMessage, myRemoteLocation);
  many = 0;
}


