
PImage bg;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
FFT fft;

int num_lines = 60;
float increment_value = TWO_PI / num_lines;
//int distance = 250; // highest value for audio
float angle = 0;
float start_angle = 0;
int circ_cent_x = 480;
int circ_cent_y = 480;
int circ_size = 60;

float distance = 0;
float biggest_size = 0;



int last_line_draw_time = -1;

void setup () {
  size (961, 960, P2D); // P2D is the rendering state
  smooth();
  bg = loadImage ("BackgroundImage.png");
  background (bg);
  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw () {
  fft.forward(in.mix);
  // draw the waveforms
  
  for (int i = 0; i < fft.specSize(); i+=10) { 
    if (biggest_size < fft.getBand(i)) {
      distance = 50*fft.getBand(i); 
      biggest_size = fft.getBand(i);
      println(distance);
    }
  }
  
  if (last_line_draw_time != second()) { // change to minute to record up to an hour
    stroke (246, 146, 30);
    line (circ_cent_x, circ_cent_y, circ_cent_x + cos(angle) * distance, circ_cent_y + sin (angle) * distance);
    angle += increment_value;

    last_line_draw_time = second(); // change to minute (see above)
    biggest_size = 0;
  }
}

void stop(){
// always close Minim audio classes when you are done with them
in.close();
minim.stop();
 
super.stop();
}




