
import processing.video.*;

Capture cam;
//MovieMaker mm;
PImage captureFrame;
boolean captureVideo = false;
PGraphics displayFrame;

void setup() {
  colorMode(HSB, 360, 100, 100); 

  size(720, 450);
  frameRate(30);
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
  }
  if (captureVideo) {
    //mm = new MovieMaker(this, width*2, height*2, "capture.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
  }
  cam = new Capture(this, width, height, cameras[2], 30);
  //cam.start();
  displayFrame = createGraphics(width, height, P2D);
  captureFrame = new PImage(width, height);
}

void draw() {
  cam.read();
  displayFrame.beginDraw();
  DrawHueHistogram(cam, displayFrame, 640);
  displayFrame.endDraw();


  //DrawAverageBars(displayFrame.get(), displayFrame, 64);

  cam.filter(BLUR, 1.5);
  image(cam, 0, 0);

  displayFrame.filter(BLUR, 1.5);
  image(displayFrame, 0, 0, width, height);
  if (captureVideo) {
    //mm.addFrame();
  }
}

void stop() {
  if (captureVideo) {
    //mm.finish();
  }
  super.stop();
}

void captureEvent(Capture cameraFrame) {
  //cameraFrame.read();
  // Uncomment following like to convert different to black and white image...
  // differenceFrame.filter(THRESHOLD, 0.2);
  //cameraFrame.filter(BLUR, 3);
  //captureFrame = cameraFrame.get();
}

void DrawAverageBars(PImage source, PImage destination, int bars) {
  destination.loadPixels();
  int pos, i;
  int barWidth = width/bars; //in pixels 

    for (int bar=0; bar<bars; bar++) {
    float [] barAverageAccum = {
      0, 0, 0
    };
    int barAverageCount = 0;
    //First pass to find average hue
    for (int barPixel=0; barPixel<barWidth; barPixel++) {
      i = bar*barWidth + barPixel;
      for (int j=0; j<height; j++) {

        pos = i+j*width;
        barAverageAccum[0] += hue(source.pixels[pos]);
        barAverageAccum[1] += saturation(source.pixels[pos]);
        barAverageAccum[2] += brightness(source.pixels[pos]);
        barAverageCount++;
      }
    }
    //println("bar:" +nf(bar,2) + ", (" + barAverageAccum + "/(float)" + (float)barAverageCount + ") = " + (int)(barAverageAccum/(float)barAverageCount));
    //second pass to assign that average
    for (int barPixel=0; barPixel<barWidth; barPixel++) {
      i = width-1-(bar*barWidth + barPixel);
      for (int j=0; j<height; j++) {
        pos = i+j*width;
        destination.pixels[pos] = color(
        (barAverageAccum[0]/(float)barAverageCount), 
        (barAverageAccum[1]/(float)barAverageCount), 
        (barAverageAccum[2]/(float)barAverageCount)
          );
      }
    }
  } 
  destination.updatePixels();
}



void DrawHueHistogram(PImage source, PGraphics destination, int bars) {

  destination.loadPixels();

  float [] HistogramCount = new float[bars];
  //float [] HistogramSatBrightAverageAccum = new float[bars];

  int BarWidth = destination.width/bars;
  int [] BarHight = new int[bars];
  int pos;

  for (int i=0; i<destination.width; i++) {

    for (int j=0; j<destination.height; j++) {
      pos = i+j*destination.width;
      //destination.pixels[pos] = source.pixels[pos];
      destination.pixels[pos] = color(0, 0, 0, 0);
      int index = (int)( hue(source.pixels[pos]) / 360 * bars );
      //HistogramCount[index]++;

      HistogramCount[index] += (saturation(source.pixels[pos]) * brightness(source.pixels[pos])) / (100*100);
    }
  }

  float maxValue = 0;
  for ( int i=0; i<bars; i++) {
    maxValue = max(maxValue, HistogramCount[i]);
  }

  int i, BarHeight;
  for ( int bar=0; bar<bars; bar++) {
    BarHeight = (int) ( destination.height * ( (float)HistogramCount[bar] / (float)maxValue ) );
    int BarHue = 360 * bar/bars;
    int BarSat = 75 + (int)((float)HistogramCount[bar] * 25f / (float)maxValue ) ;
    for (int barPixel=0; barPixel<BarWidth; barPixel++) {
      i = (bar*BarWidth + barPixel);

      for (int j=(destination.height-BarHeight)/2; j<(destination.height+BarHeight)/2; j++) {
        pos = i+j*destination.width;
        destination.pixels[pos] = color( BarHue, BarSat, BarSat);
      }
    }
  }

  destination.updatePixels();
}


