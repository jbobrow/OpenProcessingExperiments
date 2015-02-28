
import ddf.minim.*;
import ddf.minim.signals.*;
Matrix matrix,m2,m3;
Minim minim;         
AudioPlayer mySound; 
int bands;
float bx,by;
boolean play;

void setup() {
  size(600, 600, P3D);
  
  play=true;
  minim = new Minim(this);
  mySound = minim.loadFile("my growing up.mp3");
  mySound.loop();                          
  smooth();
  background(0); 
  bands=mySound.bufferSize();
  if (bands>=512) bands=512;
  matrix=new Matrix(bands, width/2, height/2,200);
  m2= new Matrix(bands, 100, 220,125);
  m3= new Matrix(bands, width-100, height-220,70);
}

void draw()
{
  int frame=frameCount;
  background(30*sin(frame*0.005));
  camera(-50-150*sin(frame*0.007), 200*tan(frame*0.001), 50+450*cos(frame*0.01), width/2, height/2, 0, 0, 1, 0);

    m2.position(sin(frame*0.01)*2,cos(frame*0.005)*2);
    m3.position(sin(frame*0.005)*(-1),sin(frame*0.009)*(-1.5));
    matrix.display();
    
    for (int i = 0; i < bands; i++)  
    { 
      matrix.drawBall(i, mySound.mix.get(i));
      m2.drawBall(i, mySound.left.get(i));
      m3.drawBall(i, mySound.right.get(i));
    }
    
}

void keyPressed()
{
  if ( key == 'm' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
  
  if(key == 'p')
  {
    play=!play;
    if(!play) mySound.pause();
    else mySound.play();
  }
}

void stop()
{
  mySound.close();
  minim.stop();

  super.stop();
}


