
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float period1 = 800.0, period2 = 600.0, period3 = 400, period4 = 1000, period5 = 1200, period6=700;  // How many pixels before the wave repeats

void setup() {
  size(1000, 400);
  w = width+30;
  dx1 = (TWO_PI / period1) * xspacing;
  dx2 = (TWO_PI / period2) * xspacing;
  dx3 = (TWO_PI / period3) * xspacing;
  dx4 = (TWO_PI / period4) * xspacing;
  dx5 = (TWO_PI / period5) * xspacing;
  dx6 = (TWO_PI / period6) * xspacing;
  wave1 = new float[w/xspacing];
  wave2 = new float[w/xspacing];
  wave3 = new float[w/xspacing];
  wave4 = new float[w/xspacing];
  wave5 = new float[w/xspacing];
  wave6 = new float[w/xspacing];
   strokeWeight(1.5);
}

void draw() {
  background(95,196,183);
  wave1 = calcWave(wave1,.08, 75, dx1);
  wave2 = calcWave(wave2,.1, 30, dx2);
  wave3 = calcWave(wave3,.12, 10, dx3);
   wave4 = calcWave(wave4,.01, 100, dx4);
   wave5 = calcWave(wave5,.05, 5, dx5);
   wave6 = calcWave(wave5,.02, 30, dx6);
  renderWave();
  sleep(2000);
}

float[] calcWave(wave, speed, amplitude, delta) {
  // Increment theta (try different values for 'angular velocity' here
  theta += speed;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < wave.length; i++) {
    wave[i] = sin(x)*amplitude;
    x+=delta;
  }

  return wave;
}
void sleep(sec){
  for(int i=0;i<sec;i++){
    for(int j=0;j<sec;j++){
      a = 2 + 2;
    }
  }
}
void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < wave1.length; x++) {
   stroke(255,120);
   line((x-1)*xspacing,height/2+wave1[x-1],(x)*xspacing,height/2+wave1[x]);
   stroke(255,80);
   line((x-1)*xspacing,height/2+wave2[x-1],(x)*xspacing,height/2+wave2[x]);
   stroke(255,100);
   line((x-1)*xspacing,height/2+wave3[x-1],(x)*xspacing,height/2+wave3[x]);
   stroke(255,60);
   line((x-1)*xspacing,height/2+wave4[x-1],(x)*xspacing,height/2+wave4[x]);
   stroke(255,80);
   line((x-1)*xspacing,height/2+wave5[x-1],(x)*xspacing,height/2+wave5[x]);
   stroke(255,60);
   line((x-1)*xspacing,height/2+wave6[x-1],(x)*xspacing,height/2+wave6[x]);
  }
}
