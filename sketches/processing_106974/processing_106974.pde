
/*
leecy li, bootcamp code final project
 */

import ddf.minim.*; 

Minim minim; 
AudioInput in; 

float widthBall=0;
float ballX;
float ballY;
boolean downFirst=true;
boolean getSound=false;

float[] ballXSave=new float[1000];
float[] ballYSave=new float[1000];
float[] ballWSave=new float[1000];
float[] speed=new float[1000];

int countNumber=0;

float speedSet=7;
float gravity=0.008;



void setup()
{
  size(700, 800);
  background(0);
  stroke(255, 0, 0);
  
  minim = new Minim(this); 
  in = minim.getLineIn(Minim.MONO, 2);

  for (int i=0;i<1000;i++)
  {
    speed[i]=speedSet;
  }
}

void draw() {

  smooth();
  if (mousePressed==true) {

    //    speed=2;
    getSound=false;

    if (downFirst)
    {
      ballX=mouseX;
      ballY=mouseY;
      downFirst=false;
      countNumber++;

      ballXSave[countNumber-1]=ballX;
      ballYSave[countNumber-1]=ballY;
    }

    widthBall=(dist(ballX, ballY, mouseX, mouseY))*2;
    ellipse(ballX, ballY, widthBall, widthBall);
    ballWSave[countNumber-1]=widthBall;
    speed[countNumber-1]=speedSet;
  }
  else {


    downFirst=true;

    if (countNumber!=0)
    {
      //      println("-------------------------");
      //      println(countNumber-1);
      //      println(ballXSave[countNumber-1]);
      //      println(ballYSave[countNumber-1]);
      //      println(ballWSave[countNumber-1]);
    }

    float mic_volume = abs(in.left.get(0)); 
    if (mic_volume*100>10)
    {
      println(" voice"+mic_volume*100);
      getSound=true;
    }

    if (getSound==true)
    {
      background(0);
      for (int i=0;i<1000;i++)
      {
        ellipse(ballXSave[i], ballYSave[i], ballWSave[i], ballWSave[i]);
        ballYSave[i]+=speed[i];
        speed[i]+=0.2;

        if (ballYSave[i]>(height-ballWSave[i]/2)) {
          ballYSave[i]=height-ballWSave[i]/2;
          speed[i]=speed[i]*-0.6;
        }

        if (ballYSave[i]>(height-ballWSave[i]/2)-3&&speed;[i]<0.3&&speed;[i]>-0.3)
        {
          speed[i]=0;
          ballYSave[i]=height-ballWSave[i]/2;
        }
      }
    }
  }
}

void stop() 
{ 
  in.close(); 
  minim.stop(); 
  super.stop();
}
