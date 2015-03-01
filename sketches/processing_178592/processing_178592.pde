
import ddf.minim.*;

Minim minim;

AudioPlayer[] song = new AudioPlayer[4];

AudioRenderer[] radar;

Button btnNextSong;
//PlayButton btnStart;

int select;
float mx = 0, my = 0;

int songN = 4;
int nowPlaying = 0;
boolean pause = false, mute=false;

float cnt = 1;
float orbitnum = 0.1;

float orbit = .45;
boolean orbitcheck = false;
boolean isEnter = false;
boolean isStart = false;

int songCnt = 0;


void setup()
{
  // setup graphics
  size(1024, 1424, P3D);

  btnNextSong = new Button();
  // setup player
  minim = new Minim(this);
  for (int i=0; i<songN; i++) { 

    song[i] = minim.loadFile("To the Moon - "+(i+1)+".mp3", 1024);
    println(i+""+song[i].getMetaData().fileName());
  }


  // setup renderers

  radar = new RadarRenderer[songN];
  for (int i=0; i<songN; i++) {
    radar[i] = new RadarRenderer(song[i]);
  }
  song[nowPlaying].loop();
  // activate first renderer in list
  song[nowPlaying].addListener(radar[nowPlaying]);
  radar[nowPlaying].setup();
}


void draw()
{ 
  
  
  radar[nowPlaying].draw();
  
  
}


void mousePressed() {


  if (orbitcheck == false) {
    if (orbit > 0.2) { 
      cnt ++;
      orbit = orbit - orbitnum;
    } else orbitcheck = !orbitcheck;
  } else if (orbitcheck == true) {
    if (orbit < 0.4) { 
      cnt --;
      orbit = orbit + orbitnum;
    } else orbitcheck = !orbitcheck;
  }


  btnNextSong.press();
}  




void keyPressed() {

  if (keyCode == ENTER) {
    isEnter = true;
    
  }
}

void stop()
{
  //song[nowPlaying].close();
  minim.stop();
  super.stop();
}


abstract class AudioRenderer implements AudioListener {
  float[] left;
  float[] right;
  synchronized void samples(float[] samp) { left = samp; }
  synchronized void samples(float[] sampL, float[] sampR) { left = sampL; right = sampR; }
  abstract void setup();
  abstract void draw();
}
 
 
// abstract class for FFT visualization
 
import ddf.minim.analysis.*;
 
abstract class FourierRenderer extends AudioRenderer {
  FFT fft;
  float maxFFT;
  float[] leftFFT;
  float[] rightFFT;
  FourierRenderer(AudioSource source) {
    float gain = .125;
    fft = new FFT(source.bufferSize(), source.sampleRate());
    maxFFT =  source.sampleRate() / source.bufferSize() * gain;
    fft.window(FFT.HAMMING);
  }
   
  void calc(int bands) {
    if(left != null) {
      leftFFT = new float[bands];
      fft.linAverages(bands);
      fft.forward(left);
      for(int i = 0; i < bands; i++) leftFFT[i] = fft.getAvg(i);  
    }
  }
}



class Button {
  boolean reverse = false; 
  boolean pressed = false;
  int[] where = {0,27000,43000,166000};

  int pos1=0, pos2=0, pos3=0;
  
  Button() {
    pos1 = 2700;
    pos2 = 4300;
    pos3 = 16400;
  }

  void press() {

    pressed = true;
    
    /*
    for (int i=0; i<songN; i++){
    where[i] = song[i].position();
   
    }
   */ 
    song[nowPlaying].pause();
    song[nowPlaying].rewind();

    changeMusic();
    //songInfo = song[nowPlaying].getMetaData();
    //sliderTime = new Slider(songInfo.title()+"-"+songInfo.author(), 100, 100, width - 200, 10, 0, song[nowPlaying].length(), color(200), color(255, 0, 0));
  }

  void changeMusic() {
    
    if (reverse) {
      
    } else {
      if (nowPlaying<songN-1)
        nowPlaying++;
        
      else {
        reverse = !reverse;
        changeMusic();
      }
    }
    println(where);
    //if (nowPlaying == 2) song[nowPlaying].skip(2700);
    //song[nowPlaying].addListener(radar[nowPlaying]);
    
      song[nowPlaying].addListener(radar[nowPlaying]);
      song[nowPlaying].play(where[nowPlaying]);
    
    
    println(nowPlaying+":"+song[nowPlaying].position());
    //song[nowPlaying].cue(where);
  }
}





class RadarRenderer extends AudioRenderer {

  float aura = .25;
  
  int delay = 2;
  int speed = 2;

  int rotations;

  RadarRenderer(AudioSource source) {
    rotations =  (int) source.sampleRate() / source.bufferSize();
  }

  void setup() {
    colorMode(RGB, TWO_PI * rotations, 5, 5);
    background(0);
  }

  synchronized void draw()
  {
    
    if (left != null) {
      
      float t = map(millis(), 0, speed * 1000, 0, PI);  
      int n = left.length;

      // center
      float w = cos(t) * 1024 * orbit;
      float h = sin(t) * 1024 * orbit;

      // size of the aura
      float w2 = 1024 * aura, h2 = 1024 * aura;

      // smoke effect
      if (frameCount % delay <= 1 ) translate(1024/2 + random(-20,20)*cos(t), 1024/2 + random(-20,20)*sin(t) + 200);
      

      // draw polar curve
      float r1=0, a1=0, x1=0, y1=0, r2=0, a2=0, x2=0, y2=0;
      for (int i=0; i <= 200; i++)
      {
        
        stroke(a1, 1 + cnt, 3.5 + cnt/2, 30 - cnt*4 + 1);
        /*
        if (cnt == 5){
          stroke(a1, 1 + cnt, 3.5 + cnt/2, 30 - cnt*3 + 1);
        }
        */
        r1 = r2; 
        a1 = a2; 
        x1 = x2; 
        y1 = y2;
        r2 = left[i % n]*2;
        a2 = map(i, 0, n, 0, TWO_PI * rotations);
        x2 = w + cos(a2) * r2 * w2;
        y2 = h + sin(a2) * r2 * h2;
        
        
        

        line(x1, y1, x2, y2);
        
      }
    }
  }
}
