
import krister.Ess.*;

AudioChannel myChannel1,myChannel2;
SineWave myWave;


int a;
int mx;
int my;
Vector circles;

void setup() {
  circles = new Vector();
  
  size (400, 400);
  background (0);
  frameRate(35);
  noFill();
  
  Ess.start(this);
  myChannel1 = new AudioChannel();
  myChannel1.initChannel(myChannel1.frames(2000));

  myWave=new SineWave(440,0);
  myWave.generate(myChannel1);
  myChannel1.volume(1);
  myChannel1.smoothPan=true;

  myChannel1.play(Ess.FOREVER);
}

void draw() {
  background(0);
  float ratio = (float)mx/width;
  stroke((ratio*256), (ratio*256), 256);
  float sw;
  if (frameCount+100 - a > 0){
    sw = (frameCount+100 - a)/40;
  } else {
    sw = 0.001;
  }  
  strokeWeight(sw);
  noFill();
  ellipse (mx, my, pow(frameCount - a,2), pow(frameCount - a,2));
  myWave.frequency = mx*10;
  myWave.volume = pow((float)my/height,2);
  myWave.generate(myChannel1);
  if (!myChannel1.fading){
    myChannel1.fadeTo(0, 2000);
  }
}

void mousePressed() {
  myChannel1.fadeTo(1,1);
  a = frameCount;
  mx= mouseX;
  my= mouseY;
}

public void stop() {
  Ess.stop();
  super.stop();
}


