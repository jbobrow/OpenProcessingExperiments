
/**
 * STARFISH by Mauro A. Zordan
 * Based on
 * Additive Wave
 * by Daniel Shiffman 
 * &
 *  LiveSpectrum by
 *  Dan Ellis dpwe@ee.columbia.edu
 *  The live spectrum part has been commented out
 *  as it is not compatible with javascript 
*/

//import ddf.minim.analysis.*;
//import ddf.minim.*;
// 
//Minim minim;
//AudioInput in;
//FFT fft;
//float[] peaks;
//
//// how wide each 'peak' band is, in fft bins
//int binsperband = 40;
//int peaksize; // how many individual peak bands we have (dep. binsperband)
//float gain = 80; // in dB
//float dB_scale = 2.0;  // pixels per dB
//
//int buffer_size = 1024;  // also sets FFT size (frequency resolution)
//float sample_rate = 44100;
//
float spectrum_height = 200; // determines range of dB shown
int legend_height = 20;
int spectrum_width = 512; // determines how much of spectrum we see
int legend_width = 40;
float spec = 0;

int circNum = 0;
int circDiam = 0;
int radius = 0;
float x = 0;
float y = 0;
int counter = 0;

//*SPECTRUM STUFF HERE ON TOP

//*STAR FISH STUFF HERE

int xspacing = 13;   // How far apart should each horizontal location be spaced
float w;              // Width of entire wave
int maxwaves = 5;   // total # of waves to add together
int segmentsize = 27;
int seg_opacity = 50;

float theta = 0.0;
float Sigma = 0.0;
float lambda = 0.0; //The first "tentacle" will be with rotation of 0 radians.
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues; // Using an array to store height values for the wave (not entirely necessary)
float[] Origins;


void setup() {
  
//  minim = new Minim(this);
//  in = minim.getLineIn(Minim.MONO,buffer_size,sample_rate);
//  // create an FFT object that has a time-domain buffer 
//  // the same size as line-in's sample buffer
//  fft = new FFT(in.bufferSize(), in.sampleRate());
//  // Tapered window important for log-domain display
//  fft.window(FFT.HAMMING);
  
  size(800, 800);
  frameRate(30);
  w = width/1.75;
  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = 8;
    float period = random(70, 100); // How many pixels before the wave repeats
    dx[i] = (PI / period) * xspacing;
  }

  yvalues = new float[int(w/xspacing)];
}

void draw() {
  colorMode(HSB, 100, 100, 100);
  background(0, 0, 0);
  calcWave();
  Origins = renderWave1();
  StarHeart(Origins); 
  int[] nums = {10,30,50,70,90,110,130,150,170,190,210};
  for (int i : nums) {
  renderWave2(i, Origins);
  } 
}

// Place the sound sensitive heart of the star exactly in center of the star's arms by passing it the 
//Origins from the renderwave1() routine

void StarHeart(float[] Origins) {
       counter = counter + 1;
//     spectrum_width = spectrum_width + 1;
     
//    // perform a forward FFT on the samples in input buffer
//    fft.forward(in.mix);

  // now draw current spectrum in brighter blue
  
//    for(int i = 0; i < spectrum_width; i++)  {
//    // draw the line for frequency band i using dB scale
//    float val = dB_scale*(20*((float)Math.log10(fft.getBand(i))) + gain);
//    if (fft.getBand(i) == 0) {   val = -200;   }  // avoid log(0)
//    spec = spectrum_height - Math.round(val);
        
    Sigma = 0.02; // Sigma in radians
    
    x = Origins[0] + segmentsize*Sigma*cos(degrees(Sigma));
    y = Origins[1] + segmentsize*Sigma*sin(degrees(Sigma));
    
    fill(0, 100, 100, 50);
    ellipse(x, y, segmentsize, segmentsize);
  
    if (counter%1 == 0){spectrum_width = spectrum_width + 1;}
    if (spectrum_width > 64) {spectrum_width = 64;}
  }

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.01;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

//Renderwave1 doesn't draw anything it just creates the central reference point for all the
//other arms of the star
float[] renderWave1() {
  // A simple way to draw the wave with an ellipse at each location
  float[] StartCoords = new float[2]; //Initialize the array to be used
  int MaxX = yvalues.length;
  float MaxY = yvalues[MaxX-1];
  float xEnd = (MaxX*xspacing-MaxX)*cos(lambda) - ((height/2 + yvalues[MaxX-1]) - MaxY)*sin(lambda);
  float yEnd = (MaxX*xspacing-MaxX)*sin(lambda) + ((height/2 + yvalues[MaxX-1]) - MaxY)*cos(lambda);
  StartCoords[0] = xEnd; 
  StartCoords[1] = yEnd;
  return StartCoords;
  }
 
  
 void renderWave2(float beta, float StartCoords[]) {
  // A simple way to draw the wave with an ellipse at each location
  noStroke();
  fill(0,100,100,seg_opacity); //Ellipses are red with 50% opacity
  ellipseMode(CENTER);
  int MaxX = yvalues.length;
  float MaxY = int(yvalues[MaxX-1]);
  float xEnd; 
  float yEnd;
  
  // Take the data from RenderWave1 and use them to determine point of rotation of next wave
      xEnd = StartCoords[0]; yEnd = StartCoords[1];
  
  for (int x = 10; x < yvalues.length; x++) {
    float x1 = xEnd + (x*xspacing-10*xspacing)*cos(beta) - ((height/2 + yvalues[x]) - (height/2 + yvalues[10]) )*sin(beta);
    float y1 = yEnd + (x*xspacing-10*xspacing)*sin(beta) + ((height/2 + yvalues[x]) - (height/2 + yvalues[10]))*cos(beta);
    ellipse(x1, y1, segmentsize, segmentsize);
  }  
}

//void keyReleased()
//{
//  // +/- used to adjust gain on the fly
//  if (key == 'q' || key == '=') {
//    gain = gain + 5.0;
//  } else if (key == 'w' || key == '_') {
//    gain = gain - 5.0;
//  }
//  println("gain = " + gain);
//}

//void stop()
//{
//  // always close Minim audio classes when you finish with them
//  in.close();
//  minim.stop();
//  super.stop();
//}



