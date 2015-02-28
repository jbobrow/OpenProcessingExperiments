
/*
* A quick sketch of a "nebula effect"
* I think I'll make a second one using the scale(), and P3D and even filter()
* But for the time being, this will do.
* Coded by: @ramayac
*/

import java.util.Arrays;
import java.util.Comparator;

static PImage IMG;

class Puff {
  int sx, sy;
  int p;
  PImage img = createImage(640, 480, ARGB);

  Puff(int pos) {
    p = pos;
    sx = int(random(0, 285))>>0;
    sy = int(random(0, 285))>>0;
  }

  void mover() {
    p = p + 2;

    if (p >= 125) {
      p = 0;
      sx = int(random(0, 285))>>0;
      sy = int(random(0, 285))>>0;
    }

    /*println("Transparency: " + trans);
    println("Position: " + p);*/
  }

  /*Not used*/
  PImage transp(final PImage src, final float valor) {
    PImage aux = src;

    //aux.loadPixels();
    for (int i=0; i<src.width*src.height; i++) {
      //aux.pixels[i] = color( red(img[i]), green(img[i]), blue(img[i]), valor);
      color c = src.pixels[i];
      //int a = (c >> 24) & 0xFF; //ignoring the alpha channel
      int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
      int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
      int b = c & 0xFF;          // Faster way of getting blue(argb)
      aux.pixels[i] = color(r, g, b, valor);
    }
    return aux;
  }

  void draw() {
    //src, sx+p, sy+p, 285-(p*2), 285-(p*2));	
    img.copy(IMG, sx+p, sy+p, 285-(p*2), 285-(p*2), 0, 0, img.width, img.height);
  }
}

Puff[] puffs;
PuffComparator PUFFCOMPARATOR = new PuffComparator();

void setup() {
  IMG = loadImage("nebula.png"); //png with transparency
  
  size(640, 480);

  puffs = new Puff[4];
  puffs[0] = new Puff(0);
  puffs[1] = new Puff(25);
  puffs[2] = new Puff(50);
  puffs[3] = new Puff(100);

  frameRate(24);
}

class PuffComparator implements Comparator<nebulaeffect.Puff> {
  public int compare(final Puff p1, final Puff p2) {
    return p1.p - p2.p;
  }
}

void draw() {
  background(0);

  if (puffs.length > 1) {  
    Arrays.sort(puffs, PUFFCOMPARATOR);
    for (int i=0; i<puffs.length; i++) {
      puffs[i].mover();
      puffs[i].draw();
      image(puffs[i].img, 0, 0);
    }
  } else {
    puffs[0].mover();
    puffs[0].draw();
    image(puffs[0].img, 0, 0);
  }
}


