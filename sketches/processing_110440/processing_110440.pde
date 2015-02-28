
//generate a 3D sulpture from a stereo audio file
//will have a problem on the touching point if running too long. no more than 10 mins is ok.


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//config
int screenWidth = 1024;
int screenHeight=768; 
int screenFramerate=24;
String soundFileName = "OlafurArnalds_undan_Hulu.mp3";
int bufferLength = 512;
int numOfBuffers = 2048*4;  //can equal to the length of the song
float radius=screenHeight/3; 
float zSpeed = 0.1;
float alfa=0.1; // the weights of the value of the current sample while being smoothed
float smoothedAverage=0;
float rotateSpeed=0.012;
float bigRotateSpeed=0.002;
float angle=0;
float bigAngle=0;

//dont touch
Minim minim;
AudioPlayer sound;
int i,j;
float[] z = new float[numOfBuffers];
float[] x = new float[numOfBuffers]; 
float[] y = new float[numOfBuffers];
float[] strokeWeightValues = new float[numOfBuffers];
float bufferAverage=0;
float scaledAverage=0;
float maxZ;


 
void setup()
{
  //size(screenWidth, screenHeight, P3D);
  size(1024, 768, P3D);
  frameRate(screenFramerate);
  smooth();
 
  minim = new Minim(this);
  sound = minim.loadFile(soundFileName, bufferLength);
  sound.play();  
  
  background(255);
  
  for(i=0; i<numOfBuffers; i++) // 
  {
    x[numOfBuffers-i-1]=radius*cos(angle);//x[i]=0;
    y[numOfBuffers-i-1]=radius*sin(angle);//y[i]=0;
    z[i]=-i*zSpeed; 
    angle=angle+rotateSpeed;
    strokeWeightValues[i]=0;
  }  
  
  maxZ=(numOfBuffers-1)*zSpeed;
}
 
void draw()
{
  //saveFrame();
  
  background(255);
  translate(width/2, height/2, 0);
  //rotateY(-PI/24);
  //rotateX(-PI/12);
  rotateZ(-bigAngle);
  bigAngle+=bigRotateSpeed;
 
  bufferAverage=0;
  for(j=0; j<bufferLength; j++) //read in a new buffer, compute the average amplitude
  {
    bufferAverage=bufferAverage+sq(sound.mix.get(j));
  }
  bufferAverage = sqrt(bufferAverage/bufferLength)*20;
  smoothedAverage = (1-alfa)*smoothedAverage + alfa*bufferAverage; // compute the smoothed average amplitude
  strokeWeightValues[0] = map(smoothedAverage, 0, 4, 0, 20);
  println(bufferAverage);
  
  x[0]=radius*cos(angle);
  y[0]=radius*sin(angle);
  z[0]=0;
  
  //line up the positions 
  for(i=0; i<numOfBuffers-1; i++)
  {   
    strokeWeight( strokeWeightValues[i] );
    stroke( map(y[i], 0, radius, 0, 64), 255-map(abs(z[i]), 0, maxZ,127,255) );//stroke(255-map(abs(z[i]), 0, maxZ,127,255));
    line(x[i], y[i], z[i], x[i+1], y[i+1], z[i+1]);
  }

  //draw the touch point
  pushMatrix();
  translate(x[0], y[0], z[0]);
  rotate(angle);
  //noStroke();
  fill(255);
  ellipse(0,0,strokeWeightValues[0], strokeWeightValues[0]*2);
  fill(map(y[0], 0, radius, 0, 64), 255-map(abs(z[0]), 0, maxZ,127,255));
  ellipse(0,0,strokeWeightValues[0], strokeWeightValues[0]*2);
  popMatrix();
 
  //update the data
  for(i=numOfBuffers-1; i>0; i--)
  {
    x[i]=x[i-1];
    y[i]=y[i-1];
    strokeWeightValues[i]=strokeWeightValues[i-1];
  }

  angle=angle+rotateSpeed;
  
}
 
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  sound.close();
  
  minim.stop();
 
  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}


