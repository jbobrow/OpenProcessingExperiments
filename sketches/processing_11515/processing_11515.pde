
// Sun and Moon
// Steven Kay, Aug 2010
// Originally, was an attempt at a solar corona using Perlin Noise
// See : http://www.noisemachine.com/talk1/24a.html
// Click to switch between
// - solar corona
// - moon with clouds on a windy night

int mode=1;
PImage moon;
int[] moonpix;

void setup() {
  size(300,300);
  background(0);
  moon=loadImage("full moon.jpg"); //100x100px moon image
  moonpix=moon.pixels;
}

void mousePressed() {
  mode=1-mode;
}

void draw() {
  loadPixels();
  float fc=frameCount;
  for (int ix=0;ix<300*300;ix++) {
    int x=ix%300;
    int y=ix/300;
    float scaler=(mode==0) ? 0.0065 : 0.05;
    float d=mag(x-150,y-150);
    float amt=noise(scaler*(x+fc),y*scaler,-scaler*(y+fc));
    if (mode==0) {
      // moon with clouds
      if (d<50) {
        // inside the moon circle
        d=255-.2*(d-50);
        color mcol=moonpix[((y-100)*100)+(x-100)]; // pixel color(int) on moon jpg
        // convert R,G,B to L (greyscale)
        float lum=0.3*red(mcol) + 0.59*green(mcol) + 0.11*blue(mcol); 
        float m=max(lum,(d*amt*1.52));
        pixels[ix]=color(m);
      } else {
        // outside the moon circle
        d=255-.5*(d-50);
        pixels[ix]=color(d*amt);
      }
    }
    if (mode==1) {
      // solar corona
      if (d<50) {
        // black out the inner circle
        pixels[ix]=color(0);
      } else {
        d=255-7*(d-50);
        pixels[ix]=color(d*amt,0,0);
      }
    }
  }
  updatePixels();
}

