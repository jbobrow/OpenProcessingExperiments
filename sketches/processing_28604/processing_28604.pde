
import processing.dxf.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
FFT fftLin;
FFT fftLog;

Waveform myRects;

Minim minim;
AudioPlayer groove;

boolean record;


float camzoom;
float maxX = 0;float maxY = 0;float maxZ = 0;
float minX = 0;float minY = 0;float minZ = 0;


void setup(){
size(1000,500,P3D);
  noStroke();
  minim = new Minim(this);
  groove = minim.loadFile("song.wav");
  //repeat the song
  groove.play();
  background(255);

  fftLog = new FFT(groove.bufferSize(),groove.sampleRate());
  fftLog.logAverages(22,4);     //adjust numbers to adjust spacing

  float w = float (width/fftLog.avgSize());
  float x = w;
  float y = 0;
  float z = 50;
  float radius = 10;  
  myRects = new Waveform(x,y,z,radius);
}


void draw(){
  if(!groove.isPlaying()) return;
  //this is where background colour is defined
  background(255);
  directionalLight(126,126,126,sin(radians(frameCount)),cos(radians(frameCount)),1);
  ambientLight(102,102,102);


    for(int i = 0; i < fftLog.avgSize(); i++){
      float zoom = 1;
      float jitter = (fftLog.getAvg(i)*200);
      //println(jitter);
      PVector foc = new PVector(myRects.x+jitter + mouseX, myRects.y+jitter, mouseY);
      PVector cam = new PVector(zoom, zoom, -zoom);
      camera(foc.x+cam.x+50,foc.y+cam.y+50,foc.z+cam.z,foc.x,foc.y,foc.z,0,0,1);
    }
    
  //play the song
  fftLog.forward(groove.mix);

  myRects.update();
 

  if(record){
    beginRaw(DXF, "output.dxf");
  }
  // DXF will export the stuff drawn between here.

  myRects.plotTrace();

  if(record){
    endRaw();
    record = false;
    println("Done DXF~!");
  }
}


void stop() {
  // always close Minim audio classes when you finish with them
  groove.close();
  // always stop Minim before exiting
  minim.stop();
  super.stop();
}

class Waveform{
  float x,y,z;
  float radius;

  PVector[] pts = new PVector[fftLog.avgSize()];

  PVector[] trace = new PVector[0];

  Waveform(float incomingX, float incomingY, float incomingZ, float incomingRadius){
    x = incomingX;
    y = incomingY;
    z = incomingZ;
    radius = incomingRadius;
  }

  void update(){
    plot();
  }

  void plot(){
    for(int i = 0; i < fftLog.avgSize(); i++){
      int w = int(width/fftLog.avgSize());

      x = i*w;
      y = frameCount*5;
      z = height/4-fftLog.getAvg(i)*10;

      stroke(0);
      smooth();
      point(x, y, z);
      pts[i] = new PVector(x, y, z);
      //increase size of array trace by length+1
      trace = (PVector[]) expand(trace, trace.length+1);
      //always get the next to last
      trace[trace.length-1] = new PVector(pts[i].x, pts[i].y, pts[i].z);
    }
  }

  void plotTrace(){
    
    //drawing poly surface
//these are the lines that are drawn
    stroke(0);
   //this is the function that makes it outline without colour
   noFill();
    int inc = fftLog.avgSize();

    for(int i=1; i<trace.length-inc; i++){
      if(i%inc != 0){
        beginShape(TRIANGLE_STRIP);

        float value = (trace[i].z*100); 
        float m = map(value, -500, 20000, 0, 255);
        //fill(m*2, 125, -m*2, 140);
        vertex(trace[i].x, trace[i].y, trace[i].z);
        vertex(trace[i-1].x, trace[i-1].y, trace[i-1].z);
        vertex(trace[i+inc].x, trace[i+inc].y, trace[i+inc].z);
        vertex(trace[i-1+inc].x, trace[i-1+inc].y, trace[i-1+inc].z);
        endShape(CLOSE);
      }
    }
     }
}


void keyPressed() {
  // use a key press so that it doesn't make a million files
  if (key == 'r') record = true;
}









