
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


 
Minim minim;
AudioPlayer song;
FFT fft;

BeatDetect beat;

color start=color(0,0,0);
color finish;
float amt = 0.0;
 
void setup()
{
  size(600,600,P3D);
  
   
  minim = new Minim(this);
 
  song = minim.loadFile("song2.mp3", 512);
  song.loop();
 
  fft = new FFT(song.bufferSize(), song.sampleRate());
  
   beat = new BeatDetect(song.bufferSize(), song.sampleRate());
   
   
}


void draw()
{
  background(255);
 
  fft.forward(song.mix);

//changing colors

  amt+=.01;
 if (amt >= 1) 
 {
   amt = 0.0;
   start = finish;
   finish = color(random(255),random(255),random(255));
 }
 
  strokeWeight(2);
  stroke(lerpColor(start,finish,amt));
  
 
//make circles

//left

  for(int i = 0; i < song.left.size() - 1; i++)
  {
    ellipse(300, 300, 50 + song.left.get(i)*1000, 50 + song.left.get(i)*1000);
    }
   
   
   
   
    for(int i = 0; i < song.left.size() - 1; i++)
     {
    if ((50 + song.left.get(i)*1000)>=500)
        {
      ellipse(150, 300, 50 + song.left.get(i)*100, 50 + song.left.get(i)*100);
      ellipse(450, 300, 50 + song.left.get(i)*100, 50 + song.left.get(i)*100);
        }
    
    if ((50 + song.left.get(i)*1000)>=700)
        {
      ellipse(300, 150, 50 + song.left.get(i)*100, 50 + song.left.get(i)*100);
      ellipse(300, 450, 50 + song.left.get(i)*100, 50 + song.left.get(i)*100);
        }
  
    }   
   

//right, after beats start

beat.detect(song.mix);
for(int j = 0; j < song.left.size() - 1; j++)
  {

      if ((beat.isOnset(10))&&((50 + song.right.get(j+1)*1000)>=850))

  {
      for (int i = 0; i < song.right.size() - 1; i++)
      {
      if ((50 + song.right.get(i+1)*1000)>=500)
          { 
        
            strokeWeight(2);
            stroke(lerpColor(finish,start,amt));
           fill(lerpColor(finish,start,amt));
     
                 
      ellipse(300, 300, 50 + song.right.get(i)*100, 50 + song.right.get(i)*100);
      noFill();
      noStroke();
         }
      }     
  }

}

//the end 
  
    minim.stop();
 
  }


  


