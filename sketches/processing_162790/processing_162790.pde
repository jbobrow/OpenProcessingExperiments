
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;




void setup()
{
  
  size(512, 400);
  smooth();

  // always start Minim first!
  minim = new Minim(this);

  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("viol.mp3", 512);
  song.play();

  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void draw()
{

  // first perform a forward fft on one of song's buffers
  // I'm using the mix buffer
  //  but you can use any one you like
  fft.forward(song.mix);
 
 
 strokeCap(PROJECT);
  strokeWeight(4);

  // I draw the waveform by connecting 
  // neighbor values with a line. I multiply 
  // each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
 
 
   for (int i = 0; i < song.left.size () - 1; i++)
 if (song.left.get(i)*50>=43){
background(random(160,225),random(200,225),random(130,255),i); 

 }


  for (int i = 0; i < song.left.size () - 1; i++)
 if (song.left.get(i)*50>=15){

    
    
    stroke(255,200);
    
    line(i, song.left.get(i+1)*100, width/2 , song.left.get(i+1)*500-60);
  
 
}
 fill(0,20);

  rect(-20, -20, 600, 600);
}



