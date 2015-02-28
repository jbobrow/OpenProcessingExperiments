
/**
 * Pulsing Music (v2.02)
 * by RealIsFake (2013/Feb)
 * with tweaks by GoToLoop and with help of amnon.owed on forum.processing.org
 * http://forum.processing.org/topic/draw-to-off-screen-buf-render-it-to-image-move-image-with-everything-drawn-on-it-doesn-t-work
 */

import ddf.minim.*;

final Minim minim = new Minim(this);
AudioPlayer song;
AudioMetaData meta;

PGraphics pg;

final static byte numBeams = 6;
final static byte shiftX = 2, shiftY = 0;
final static String fileName = "Your-audio-file.mp3";

void setup() {
  size(1024, 768);
  frameRate(50);
  strokeWeight(3);

  pg = createGraphics(width, height, JAVA2D);

  pg.beginDraw();
  pg.colorMode(HSB, 360, 100, 100);
  pg.ellipseMode(RADIUS);
  pg.smooth();
  pg.endDraw();

  song = minim.loadFile(fileName);
  meta = song.getMetaData();
  song.play();
}

void draw() {
  if (frameCount == 360)  frameCount = 0;

  int ww = width>>1, hh = height>>1;
  float sz = abs( song.mix.get(0) ) * ww;

  pg.beginDraw();
  pg.fill(0, 010);
  pg.rect(0, 0, width, height);

  pg.fill(frameCount, 0200, 0100);
  pg.ellipse(ww, hh, sz, sz);
  pg.endDraw();

  shiftImage(shiftX, shiftY);

  image(pg, 0, 0);

  if (sz > ww>>1) {
    translate(ww, hh);
    stroke(random(360), 0150, 050);

    for (int i=0; i!=numBeams; i++) {
      rotate( random(360) );
      line(0, 0, ww, hh);
    }
  }
} 

void shiftImage(int dX, int dY) {
  PImage source = pg.get();

  int w = pg.width, ww = w>>1;
  int h = pg.height;
  int l = pg.pixels.length;

  for (int y=0; y!=h; y++)
    for (int x=0, iS1, iS2, iPg; x!=ww;) {
      iS1 = w*(y+dY) + x+dX;
      iS2 = w*(y+dY) + x-dX + ww;
      iPg = w*y + x++;

      if (iS1 >= 0 & iS2 < l) {
        pg.pixels[iPg] = source.pixels[iS1];
        pg.pixels[iPg + ww] = source.pixels[iS2];
      }
    }

  pg.updatePixels();
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

void mousePressed() {
  if ( song.isPlaying() ) {
    song.pause();
    noLoop();
  }

  else {
    song.play();
    loop();
  }
}

void keyPressed() {
  mousePressed();
}
