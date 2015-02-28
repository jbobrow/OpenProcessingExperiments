
import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.effects.*;

class Animations {

  AudioPlayer song;
  FFT fft, averageFft, circleFft, waveFft;

  PVector dim;

  float angle;
  Matr [][] baseMat;
  Matr [][] ampMat;
  int matrDim;

  Animations(PVector mDim, AudioPlayer mSong) {

    dim = mDim;
    song = mSong;

    fft = new FFT(song.bufferSize(), song.sampleRate());

    averageFft = new FFT(song.bufferSize(), song.sampleRate());
    averageFft.linAverages(24);

    circleFft = new FFT(song.bufferSize(), song.sampleRate());
    circleFft.linAverages(40);

    waveFft = new FFT(song.bufferSize(), song.sampleRate());
    waveFft.linAverages(256);

    matrDim = (int) sqrt(waveFft.avgSize());
    baseMat = new Matr [matrDim][matrDim];
    ampMat = new Matr [matrDim][matrDim];

    // initialisation of baseMat and ampMat

    int k1, k2;

    for (int i=0;i<matrDim;i++) {

      k1 = -160 + i*10;
      k2 = 0 + i*8;

      for (int j=0;j<matrDim;j++) {
        PVector p0, p1, p2, p3, pp0, pp1, pp2, pp3;
        p0 = new PVector(k1, k2);
        pp0 = new PVector(k1, k2);
        p1 = new PVector(k1+10, k2+8);
        pp1 = new PVector(k1+10, k2+8);
        p2 = new PVector(k1+20, k2);
        pp2 = new PVector(k1+20, k2);
        p3 = new PVector(k1+10, k2-8);
        pp3 = new PVector(k1+10, k2-8);
        baseMat[i][j] = new Matr (p0, p1, p2, p3);
        ampMat[i][j] = new Matr (pp0, pp1, pp2, pp3);

        k1 = k1 + 10;
        k2 = k2 - 8;
      }
    }
  }

  // TIME DOMAIN ANIMATION

  void timeDomain() {
    stroke(255);

    float[] mix = song.mix.toArray();

    for ( int i = 0; i < mix.length - 1; i++ ) {
      float x1 = map(i, 0, song.bufferSize(), 4, dim.x-4); 
      float x2 = map(i+1, 0, song.bufferSize(), 4, dim.x-4); 
      line(x1, (dim.y/2) - mix[i]*100, x2, (dim.y/2) - mix[i+1]*100);
    }

    noStroke();
  }

  // FREQUENCY DOMAIN ANIMATION

  void frequencyDomain() {
    stroke(255); 

    // executing Fourier transform

    fft.forward(song.mix);

    for (int i = 0; i < fft.specSize(); i++) {
      line(i+4, dim.y-4, i+4, dim.y - 4  - fft.getBand(i));
    }

    noStroke();
  }

  // AVERAGE FREQUENCY DOMAIN ANIMATION

  void averageFrequencyDomain() { 
    colorMode(HSB, 255);

    // executing Fourier transform

    averageFft.forward(song.mix);

    // calculating average value of the bands

    float [] bandsValue = new float[averageFft.avgSize()];
    for (int i = 0; i < averageFft.avgSize(); i++) {
      bandsValue[i] = averageFft.getAvg(i);
    }

    float averageHeight, averageHue;

    for (int i = 0; i < averageFft.avgSize(); i++) {      

      // color of the current band      
      averageHue = map(i, 0, averageFft.avgSize(), 0, 255);
      fill( averageHue, 255, 255 );

      // value of band mapped to frame height      
      float frequencyBands = ((dim.x-9)/averageFft.avgSize()); 
      averageHeight = map(averageFft.getAvg(i), 0, max(bandsValue), 0, dim.y-9);

      rect(i*frequencyBands+5, dim.y-(averageHeight)-4, frequencyBands, averageHeight);
    }
  }

  // SPHERES ANIMATION  

  void spheresAnimation() {
    colorMode(HSB, 255);

    // executing Fourier transform

    circleFft.forward(song.mix);

    // calculating average value of the bands

    float [] bandsValue = new float[averageFft.avgSize()];
    for (int i = 0; i < averageFft.avgSize(); i++) {
      bandsValue[i] = circleFft.getAvg(i);
    }

    float externalRadius = 30;
    float averageHue;

    for (int i = 0; i < circleFft.avgSize(); i++) {

      // angle used to calculate the position of the sphere associated to the band
      angle = i*(PI/20);
      averageHue = map(i, 0, circleFft.avgSize(), 0, 255);
      stroke( averageHue, 255, 255 );

      if (circleFft.getAvg(i) >= 0.1) {
        // value used to map the distance of the sphere from center of the frame proportionally with the average band value
        externalRadius = map(circleFft.getAvg(i), 0, max(bandsValue), 30, dim.y/2-30);
        fill( averageHue, 255, 255 );
        // filled spheres of the internal circle
        int internalRadius = 15;
        ellipse(dim.x/2+cos(angle)*internalRadius, dim.y/2+sin(angle)*internalRadius, 3, 3);
        // filled spheres of the external circle
        int intermediateRadius = 30;
        ellipse(dim.x/2+cos(angle)*(dim.y/2-intermediateRadius), dim.y/2+sin(angle)*(dim.y/2-intermediateRadius), 6, 6);
      }
      else {
        noFill();
      }

      // not filled spheres of the intermediate circle      
      float xx = cos(angle)*externalRadius;
      float yy = sin(angle)*externalRadius; 
      ellipse((dim.x)/2+xx, (dim.y)/2+yy, 5, 5);

      externalRadius = 30;
    }
  }

  // WAVE RECTANGLES ANIMATION

  void waveAnimation() {
    colorMode(HSB, 255);

    // centering the animation

    translate(width/2, height/2+65);

    // executing Fourier transform

    waveFft.forward(song.mix);

    // calculating average value of the bands

    float [] x = new float[waveFft.avgSize()];
    for (int i = 0; i < waveFft.avgSize(); i++) {
      x[i] = waveFft.getAvg(i);
    }

    // calculation of the end points of the rectangles that grow in proportion to the average value the bands

    for (int l = 0; l < waveFft.avgSize(); l++) {
      int i, j;
      i = (int) (l/matrDim);
      j = l % matrDim;
      int border = 10;
      if (waveFft.getAvg(l) > 0) {
        float val = map(waveFft.getAvg(l), 0, max(x), 0, 100);
        (ampMat[i][j].p0).y = (baseMat[i][j].p0).y - val-border;
        (ampMat[i][j].p1).y = (baseMat[i][j].p1).y - val-border;
        (ampMat[i][j].p2).y = (baseMat[i][j].p2).y - val-border;
        (ampMat[i][j].p3).y = (baseMat[i][j].p3).y - val-border;
      }
      else {
        (ampMat[i][j].p0).y = (baseMat[i][j].p0).y-border;
        (ampMat[i][j].p1).y = (baseMat[i][j].p1).y-border;
        (ampMat[i][j].p2).y = (baseMat[i][j].p2).y-border;
        (ampMat[i][j].p3).y = (baseMat[i][j].p3).y-border;
      }
    }

    // displaying of the rectangles 

    for (int i=0;i<matrDim;i++) {
      for (int j=matrDim-1;j>=0;j--) {

        // left hand side

        float x0 = (baseMat[i][j].p0).x;
        float y0 = (baseMat[i][j].p0).y;
        float x1 = (baseMat[i][j].p1).x;
        float y1 = (baseMat[i][j].p1).y;
        float x2 = (ampMat[i][j].p1).x;
        float y2 = (ampMat[i][j].p1).y;
        float x3 = (ampMat[i][j].p0).x;
        float y3 = (ampMat[i][j].p0).y;
        fill(100);
        stroke(255);
        quad(x0, y0, x1, y1, x2, y2, x3, y3);
        noStroke();
        noFill();

        // right hand side

        x0 = (baseMat[i][j].p1).x;
        y0 = (baseMat[i][j].p1).y;
        x1 = (baseMat[i][j].p2).x;
        y1 = (baseMat[i][j].p2).y;
        x2 = (ampMat[i][j].p2).x;
        y2 = (ampMat[i][j].p2).y;
        x3 = (ampMat[i][j].p1).x;
        y3 = (ampMat[i][j].p1).y;
        fill(100);
        stroke(255);
        quad(x0, y0, x1, y1, x2, y2, x3, y3);
        noStroke();
        noFill();        

        // upper hand side

        x0 = (ampMat[i][j].p0).x;
        y0 = (ampMat[i][j].p0).y;
        x1 = (ampMat[i][j].p1).x;
        y1 = (ampMat[i][j].p1).y;
        x2 = (ampMat[i][j].p2).x;
        y2 = (ampMat[i][j].p2).y;
        x3 = (ampMat[i][j].p3).x;
        y3 = (ampMat[i][j].p3).y;
        float tmp = map((matrDim*i+j), 0, waveFft.avgSize(), 0, 255);
        fill( tmp, 255, 255 );
        stroke(255);
        quad(x0, y0, x1, y1, x2, y2, x3, y3);
        noStroke();
        noFill();
      }
    }
  }
}

class Matr {

  PVector p0, p1, p2, p3;

  Matr(PVector mP0, PVector mP1, PVector mP2, PVector mP3) {
    p0 = mP0;
    p1 = mP1;
    p2 = mP2;
    p3 = mP3;
  }
}


