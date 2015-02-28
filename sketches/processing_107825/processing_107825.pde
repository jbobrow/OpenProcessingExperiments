
//generate a 3D sulpture from a stereo audio file


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//config
int screenWidth = 1024;
int screenHeight=768; 
int screenFramerate=8;
String soundFileName = "OlafurArnalds_undan_Hulu.mp3";
int bufferLength = 256;
int numOfBuffers = 32;
float radius=screenHeight; 
float zSpeed = 0.2;
float alfa=0.48; // the weights of the value of the current sample while being smoothed
float smoothedSampleMin=0.16;

//dont touch
Minim minim;
AudioPlayer sound;
int i,j;
float[][] z = new float[numOfBuffers][bufferLength+1];
float[][] x = new float[numOfBuffers][bufferLength+1]; 
float[][] y = new float[numOfBuffers][bufferLength+1];
float smoothedSample=0;
float smoothedSampleOld=smoothedSampleMin*1.8;//1.8 is the result of testing, should be changed if other paramters are changed
float maxZ;


 
void setup()
{
  //size(screenWidth, screenHeight, P3D);
  size(1024, 768, P3D);
  frameRate(screenFramerate);
 
  minim = new Minim(this);
  sound = minim.loadFile(soundFileName, bufferLength);
  sound.play();  
  
  background(255);
  
  for(i=0; i<numOfBuffers; i++)
  {
    for(j=0; j<bufferLength;j++)
    {
      x[i][bufferLength-j-1]=1.8*smoothedSampleMin*radius*cos(2*PI*j/bufferLength+PI/2);//1.8 is the result of testing, it should be changed if other parameters are changed; x[i][j]=0;
      y[i][bufferLength-j-1]=1.8*smoothedSampleMin*radius*sin(2*PI*j/bufferLength+PI/2);//y[i][j]=0;
      z[i][j]=-(i*bufferLength+j)*zSpeed;
    }
  }
  
  for(i=0; i<numOfBuffers-1; i++)
  {
    x[i][bufferLength]=x[i+1][0];
    y[i][bufferLength]=y[i+1][0];
    z[i][bufferLength]=z[i+1][0];
  }
  z[numOfBuffers-1][bufferLength]=-numOfBuffers*bufferLength*zSpeed;
  
  maxZ = abs(z[numOfBuffers-1][bufferLength-1]);
  
}
 
void draw()
{
  background(255);
  translate(width/3, height*2/3, 0);
  rotateY(-PI/6);
  rotateX(-PI/8);
 
  for(j=0; j<bufferLength; j++) //read in new samples, compute the x and y postitions
  {
    /*
    x[0][j]=abs(sound.mix.get(j))*radius*cos(2*PI*j/bufferLength);
    y[0][j]=abs(sound.mix.get(j))*radius*sin(2*PI*j/bufferLength);
    */
    
    smoothedSample = (1-alfa)*smoothedSampleOld + alfa*abs(sound.mix.get(j));
    smoothedSample = map(smoothedSample, 0, 1, smoothedSampleMin, 1);
    x[0][bufferLength-j-1]=smoothedSample*radius*cos(2*PI*j/bufferLength+PI/2);
    y[0][bufferLength-j-1]=smoothedSample*radius*sin(2*PI*j/bufferLength+PI/2);
    //x[0][j]=smoothedSample*radius*cos(2*PI*j/bufferLength);
    //y[0][j]=smoothedSample*radius*sin(2*PI*j/bufferLength);
    smoothedSampleOld=smoothedSample;
  }
  x[0][bufferLength]=x[1][0];
  y[0][bufferLength]=y[1][0];
  
  //line up the positions to generate a 3D surface
  for(i=0; i<numOfBuffers-1; i++)
  {   
    for(j=1; j<bufferLength+1; j++)
    {
      stroke( 0+map(y[i][j], 0, radius/2, 127, 255), 255-map(abs(z[i][j]), 0, maxZ,127,255) );
      //stroke(127, map(abs(z[i][j]), 0, maxZ,0,255));
      beginShape();   
      vertex(x[i][j-1], y[i][j-1], z[i][j-1]);
      vertex(x[i][j], y[i][j], z[i][j]);
      vertex(x[i+1][j], y[i+1][j], z[i+1][j]);
      vertex(x[i+1][j-1], y[i+1][j-1], z[i+1][j-1]);    
      endShape(CLOSE);
    }

  }
  
  //update the matrix
  for(i=numOfBuffers-1; i>0; i--)
  {
    for(j=0; j<bufferLength+1; j++)
    {
      x[i][j]=x[i-1][j];
      y[i][j]=y[i-1][j];
      //z[i][j]=z[i-1][j];
    }
  }

  
  
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


