
import oscP5.*;
import netP5.*;

/**
  * This sketch is adapted from an example sketch LinLogAverages
  * Ian Pryor
  * FFT displayer w color and some control
  * 
  */
  
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer jingle;
FFT fftLin;
FFT fftLog;
float height6;
float height56;
OscP5 oscP5;
//NetAddress myRemoteLocation;
float n = 1.0;
int red =255;
int blue =255;
int green =255;
int r_next = 0;
int b_next = 0;
int g_next = 0;

int choice = 1;


void setup()
{
  textSize(height/32);
  //setup the view
  size(800,600, P3D);
  height6 = height/6;
  height56 = 5*height/6;
  red = int(random(255));
  blue = int(random(255));
  green = int(random(255));

  minim = new Minim(this);
  jingle = minim.loadFile("input.mp3", 2048);
  // loop the file
  jingle.loop();
  // create an FFT object that has a time-domain buffer the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be 1024. 
  // see the online tutorial for more info.
  fftLin = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate the averages by grouping frequency bands linearly. use 30 averages.
  fftLin.linAverages(30);
  fftLog = new FFT(jingle.bufferSize(), jingle.sampleRate());
  // calculate averages based on a miminum octave width of 22 Hz
  // split each octave into three bands
  // this should result in 30 averages
  fftLog.logAverages(22, 3);
  rectMode(CORNERS);
  //oscP5 = new OscP5(this, 12004);
  //myRemoteLocation = new NetAddress("127.0.0.1",12004);
}
/*
void mousePressed(){
  OscMessage myMessage = new OscMessage("/IAP/mouse");
  
  myMessage.add("hello");
  //myMessage.add(mouseY);
  
  oscP5.send(myMessage, myRemoteLocation);
}*/
void keyPressed() {
  switch(key){
    case 'w':
       if(n<1){
          n = n*2;
        }
        else{
          ++n;
        }
        print(n + "\n");
        break;
    case 's':
      if(n > 1){
        n--;
      }
      else{
       n = n*0.5;
      }
      print(n + "\n");
      break;
    case '1':
      choice =1;
      break;
    case '2':
      choice =2;
      break;
  }
}
/*
void oscEvent(OscMessage theOscMressage){
  print("### received an osc message.\n");
}*/

void draw()
{
  background(0);
  
  // perform a forward FFT on the samples in jingle's mix buffer
  // note that if jingle were a MONO file, this would be the same as using jingle.left or jingle.right
  fftLin.forward(jingle.mix);
  
  //draw some lines for reference
  //randomize some colors in here
  if(red == r_next){
    r_next = int(random(255));
  }
  if(blue == b_next){
    b_next = int(random(255));
  }
  if(green == g_next){
    g_next = int(random(255));
  }
  if(red < r_next){
    red++;
  }else{
    red--;
  }
  if(blue < b_next){
    blue++;
  }else{
    blue--;
  }
  if(green < g_next){
    green++;
  }else{
    green--;
  }
  
  stroke(255, 255, 255);
  fill(255, 255, 255);  
  
  
  text("Scale x", 4*width/16, 2*height6/3);
  text(n, 5*width/16, 2*height6/3);
  text("1 for Log   'w' to increase scale", 7*width/16, height6/3);
  text("2 for Lin    's' to decrease scale", 7*width/16 , 2*height6/3);
  
  // draw the logarithmic averages or linear averages
  int w = 0;
  int size = 0;
  switch(choice) {
    case 1:
      text("Logarithmic", width/16, 2*height6/3);
      fftLog.forward(jingle.mix);
      w = int(width/fftLog.avgSize());
      size = fftLog.avgSize();
      break;
    case 2:
      text("Linear", width/16, 2*height6/3);
      fftLin.forward(jingle.mix);
      w = int(width/fftLin.avgSize());
      size = fftLin.avgSize();
      break;
  }
 
  
  

  //draw some lines for reference
  stroke(red, green, blue);
  line(0,height6,width,height6);
  line(0,height56,width,height56);
  
  //color the other objects a much different color
  stroke(blue, red, green);
  fill(blue, red, green);
  
  for(int i = 0; i < size; i++)
  {
    // draw a ellipse for each average, multiply the value by n that the user controls
    // do a linear or an log spectrum based on what the user controls
    float h = 0;
    switch(choice){
      case 1:
        h = fftLog.getAvg(i)*n;
        break;
      case 2:
        h = fftLin.getAvg(i)*n;
        break;
    }
    ellipse(i*w,height,w, h);
    
    //check the heights in a way that makes sense, its reversed with what the computer sees
    if(h/2 >= height56){
      ellipse((width - (width/8)), height6, width/64,width/64);
    }
    if(h/2 >= height6){
      ellipse((width - (width/8)), height56, width/64,width/64);
    }
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  jingle.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}

