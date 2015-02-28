
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
FFT fft;

void setup()
{
  // Standard minim stuff
  size(700, 200);
  minim = new Minim(this);
  song = minim.loadFile("madeon.mp3", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void draw()
{
  // Averaging my fft values into 70 compartments
  fft.linAverages(70);
  background(0);
  fft.forward(song.mix);
  noStroke();

  for (int i = 0; i < 70; i++)
  {
    // Had to refresh on HSB, but I'm only using  the latter 70% or so of the color spectrum
    // so I'm skipping yellow all together
    colorMode(HSB, 100);
    fill(map((fft.getAvg(i)), 0, 12, 30, 100), 70, 100);
    rect(i*10, 0, 10, height);
    //println(fft.getAvg(i)*34);

    fill(0, 0, 0);
    
    // This part took me forever! Taking the natural log of the average frequency
    // ended up being the solution, as seen below. I was trying to normalize my values
    // a little bit because before I did that, only the left maybe.. half or so bars
    // would ever even visibly move! Now at least they all make some sort of motion.
    rect( i*10, 0, ((i+1)*10), height - log(fft.getAvg(i)+1)*40);
  }
}

void stop()
{
  song.close();
  minim.stop();

  super.stop();
}


