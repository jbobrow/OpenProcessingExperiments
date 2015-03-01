
// Audio Player 

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer player[]=new AudioPlayer[4];
String filenames[] = new String[]{"test.mp3", "test.mp3", "test.mp3", "test.mp3"};
FFT fft[] = new FFT[4];
int p[] = new int[4];
int loopBegin, loopEnd;
boolean pause = false, mute=false; 
int flag=0;
int bgcolor;

void setup(){
  bgcolor=255;
  size(1024, 200, P3D);
  minim = new Minim(this);
   for(int i=0;i<4;i++){
     player[i] = minim.loadFile(filenames[i]);
     fft[i] = new FFT( player[i].bufferSize(), player[i].sampleRate() );

   }
}
void test() {
  if(flag==1){
    rect(0,0,1025,200);
    fill(50,30,60);
  } 
}

void draw(){
  background(bgcolor);
  
  for(int i = 0; i < 4; i++)
  {
    p[i] = player[i].position();  
  }

  player[0].play();
  test();
  for(int i = 0; i < 4-1; i++)
  {
     if(3000 < p[i] && p[i] < 4000 && player[i+1].isPlaying()==false) {
       flag = 1;
       if(mousePressed==true) {
          player[i+1].play();
          flag = 0;
       }
     }
     else if(p[i] > 4000 && player[i+1].isPlaying()==false) {
        player[i+1].play(); 
        flag = 0;
        bgcolor-=30;
     }
  }
}

void stop(){
for(int i=0;i<4;i++){
   player[i].close();
 }
 minim.stop();
 super.stop();
} 
