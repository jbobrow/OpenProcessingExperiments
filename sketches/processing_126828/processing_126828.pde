

import ddf.minim.*;


Minim minim;
AudioPlayer player;

Shape test;

int smin = 33;
int smax = 200;

int imgno = 0;
float rots[] = {
  0, 45, -45, 135, -135, 180, 90, -90
};
float dist = 10;
int size = 256;
float siz = 128;
int step = 1;

int ww = -1;

PFont font;

float peak = 0;

void setup() {

  size(400, 800);

  minim = new Minim(this);
  player = minim.loadFile("flusser.mp3");

  player.loop();


  font = loadFont("MarVoSym-128.vlw");//createFont(PFont.list()[(int)random(PFont.list().length)],siz,true);
  test =new Shape(size, size);

  background(0);

  smooth();
}

void keyPressed() {
  clear();
}

void draw() {



  // tint(255,noise(frameCount/3.0)*10+245);
  // noStroke();

  ww = (int)(noise(frameCount/500.0)*width);

  strokeWeight(2);
  stroke(0);
  line(0, height-1, width, height-1);
  stroke(255, 3);
  peak = 0;
  for (int i = 0; i < player.bufferSize() - 1; i++) {
    float x1 = map( i, 0, player.bufferSize(), 0, height );
    float x2 = map( i+1, 0, player.bufferSize(), 0, height );
    line(ww + player.left.get(i)*100, height-1, ww + player.left.get(i+1)*100, height );
    peak = max(player.left.get(i), peak);
  }

  if (peak>0.25)
    test.detect(5);

  loadPixels();

  image(g, 0, -1);
}


void clear() {
  font = createFont(PFont.list()[(int)random(PFont.list().length)],55,true);
  test =new Shape(size, size);

    save("out"+nf(imgno, 5)+".png");
  imgno++;

  background(0);
}

class Shape {
  PGraphics tile, mask;
  int w, h;
  int x, y;

  Shape(int _w, int _h) {
    w=_w;
    h=_h;

    prepare();
  }

  void prepare() {

    float rot = radians(rots[(int)random(rots.length)]);
    int symbol = (int)random(smin, smax);
    tile = createGraphics(w, h, JAVA2D);
    tile.beginDraw();
    tile.textFont(font, map(peak, 0.1, 0.5, 16, 100));
    tile.textAlign(CENTER);
    tile.smooth();
    tile.translate(w/2, h/2);
    tile.rotate(rot);
    tile.translate(-w/2, -h/2);
    tile.colorMode(HSB);
    tile.fill(60, map(symbol, smin, smax, 0, 40), 200);
    tile.noStroke();
    tile.text((char)symbol+"", w/2, h-20);
    tile.endDraw();
  }

  void detect(int iter) {

    for (int i = 0 ; i < iter;i++) {
      prepare();



      x = (int)random(width-w);
      y = (int)random(height/2, height-h);

      loadPixels();
      tile.loadPixels();

      boolean overlap = false;

      int X = 0;
      int Y = 0;

SKIP:
      for (int _y = y; _y < y + h - 2 ; _y+=step) {
        X = 0;
        for (int _x = x; _x < x + w - 2; _x+=step) {

          if ( brightness(tile.pixels[Y*w+X]) > 3) {
            if (brightness(pixels[(_y)*width+(_x)]) > 3) {
              overlap = true;
              break SKIP;
            }
          }
          X+=step;
        }
        Y+=step;
      }


      if (!overlap) {
        draw();
      }
    }
  }

  void draw() {
    image(tile, x, y);
  }
}


