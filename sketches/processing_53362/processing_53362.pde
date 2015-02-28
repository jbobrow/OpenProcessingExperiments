
import processing.video.*;

// our capture variable
Capture video;

// a few variables to manage locations and lengths
int newx = 0;
int newy = 0;
int r;
int p;
int xjump = 10;
int yjump = 10;
float circledrift = 15;

void setup() {
  size(xjump*80, yjump*60, P2D);
  video = new Capture(this, 80, 60, 15);
  frameRate(999);
  smooth();
  r=1; p=0;
}

void draw() {
  
  for (int y = 0; y < video.height; y++) {
    for (int x = video.width-1; x > -1; x--) { 

      // use our location formula to
      // grab the color at this pixel
      int loc = x + y * video.width;
      
      // now store the color at that location
      color c = video.pixels[loc];
  {
         noStroke();
         fill(c,220);
         ellipse(newx+random(circledrift),newy+random(circledrift),
         5,5);
        translate(width/8, height/8);
         rotate(r);
         p++;
      }
     newx += xjump;
    }
    newx = 0;
    newy+=yjump;

  }
  newy = 0;
}

void captureEvent(Capture c) {
  c.read();
}



