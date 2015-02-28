
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;  
AudioPlayer mp3;
FFT fftLin;
FFT fftLog;

float spectrumScale = 12;
float leng, heig;
int ave = 32;

int maxpal = 512;
int numpal = 0;
int num = 200;
color[] goodcolor = new color[maxpal];
color myc;

PImage imgBack;


void setup() {
  size(720, 1280, P3D);

  takecolor("takeme.gif");

  imgBack = loadImage("background.png");
  //imgPlayer = loadImage("player.png");

  minim = new Minim(this);
  mp3 = minim.loadFile("myMusic.mp3", 1024);
  mp3.loop();

  fftLin = new FFT(mp3.bufferSize(), mp3.sampleRate());
  fftLin.linAverages(ave);

  heig = width/30;
  leng = sqrt(heig*heig*4/3);

  noStroke();
  background(0);
}


void draw() {  
  myc = somecolor();
  fftLin.forward( mp3.mix );
  image(imgBack, 0, 0, width, height);
  triangles();
  //image(imgPlayer, 0, 0, width, height);
}


void triangles() {
  //randomSeed(4);

  for (int j = 0; j < 30 ; j++) {
    for (int i = 0; i < 48; i++) {
      if (j%2 == 0) {
        fill(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        //stroke(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        triangle(j*heig, i*leng, j*heig+heig, i*leng + leng/2, j*heig, i*leng+leng);
        fill(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        //stroke(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        triangle(j*heig, i*leng + leng/2 - leng/2, j*heig+heig, i*leng - leng/2, j*heig+heig, i*leng+leng - leng/2);
      }
      else {
        fill(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        triangle(j*heig, i*leng - leng/2, j*heig+heig, i*leng + leng/2 - leng/2, j*heig, i*leng+leng - leng/2);
        fill(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        //stroke(red(myc),green(myc),blue(myc), fftLin.getAvg((int)random(2, ave))*spectrumScale);
        triangle(j*heig, i*leng + leng/2, j*heig+heig, i*leng, j*heig+heig, i*leng+leng);
      }
    }
  }
}



// COLOR ROUTINES -----------------------------------------------------------

color somecolor() {
  // pick some random good color
  return goodcolor[int(random(numpal))];
}

void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b, 0, 0);

  for (int x=0;x<b.width;x++) {
    for (int y=0;y<b.height;y++) {
      color c = get(x, y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        // add color to pal
        if (numpal<maxpal) {
          goodcolor[numpal] = c;
          numpal++;
        } 
        else {
          break;
        }
      }
      if (random(10000)<100) {
        if (numpal<maxpal) {
          // pump black or white into palette
          if (random(100)<50) {
            goodcolor[numpal] = #FFFFFF;
            print("w");
          } 
          else {
            goodcolor[numpal] = #000000;
            print("b");
          }
          numpal++;
        }
      }
    }
  }
}

