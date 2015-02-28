
import ddf.minim.analysis.*;
import ddf.minim.*;
 
AudioPlayer conversation;
FFT fftLin;
float height3;

Coin myCoin1; 
Coin myCoin2;
 
void setup()
{
  size(500, 500);
  height3 = height/10;
//================================== Start Minim, open audio file

  Minim.start(this);
  conversation = Minim.loadFile("juno.wav");
  // loop the file
  conversation.loop();
  fftLin = new FFT(conversation.bufferSize(), conversation.sampleRate());
  fftLin.linAverages(30);
  
//================================== Initiate moving Coin 1 & 2

  myCoin1 = new Coin();
  myCoin2 = new Coin();
  
}
 
void draw()
{
  background(0);
  fftLin.forward(conversation.mix);

//================================== draw and move Coin 1 & 2 

  myCoin1.make();
  myCoin1.counterClockWise();
  
  myCoin2.make();
  myCoin2.clockWise();
 
}

//================================== always close Minim audio classes when you are done with them 

void stop(){
  conversation.close();
  Minim.stop();
  super.stop();
}

//=================================== Coin Class begins here

class Coin{
  float r;
  float theta;
  float theta_vel;
  float theta_acc;
  
  
  Coin(){
  r = 200;
  theta = 0.0f;
  theta_vel = 0.01f;
  theta_acc = 0.000001f;
  
  }

//=================================== Convert polar to cartesian & draw the audio spectrum as Coins

  void make(){
  float x = r * cos(theta);
  float y = r * sin(theta);  
  
  stroke(255);
    noFill();
    translate(width/2, height/2);

    for(int i = 0; i < fftLin.specSize(); i++){
   
      ellipse(x, y, height3 - fftLin.getBand(i)*2, height3 - fftLin.getBand(i)*2);
      height3 = 0;
    }

  }
  
  
//=================================== Apply acceleration and velocity to angle CLOCKWISE

  void clockWise(){
  theta_vel += theta_acc;
  theta += theta_vel;
  }
  
//=================================== Apply acceleration and velocity to angle COUNTER CLOCKWISE

  void counterClockWise(){
  theta_vel -= theta_acc;
  theta -= theta_vel;
  }  
  
}

