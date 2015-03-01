
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 *
 * mouse click to switch effect on or off, adds a water shimmer to the image
 */
/* @pjs preload="mountainlake.png"; */

PImage myImg;
ArrayList<PGraphics> ripples;
int ripplerate = 13;
float x, y;
int i, j;
float a, n;
boolean on_off = true;

void setup() {
  size(800, 600);
  myImg = loadImage("mountainlake.png");
  ripples = new ArrayList<PGraphics>();
  for (int k = 0; k < ripplerate; k++){
    ripples.add( makeRipples(k) );
  }
  frameRate(ripplerate);
}

void draw() {
  // draw the image
  image(myImg, 0, 0);
  //target area size is of rect(0,370,800,230);
  if (on_off) {
    image(ripples.get(int(frameCount%ripplerate)), 0, 370);
  }
  //saveFrame("frame_###.png");
}

void mousePressed() {
  on_off = !on_off;
}

PGraphics makeRipples(int k) {
  PGraphics ripple = createGraphics(800, 230);
  ripple.beginDraw();
  ripple.noStroke();
  //ripple.rect(0,0,800,230);
    for (i = 0; i < 800; i+=5) {
      for (j = 0; j < 230; j+=4) {
        color dotcolour = myImg.get(i, j+370);
        n = map(noise(j/10), 0, 1, -3, 3);
        x = cos(k+j+i) + n;
        y = sin(k+j+i) + n;
        a =  j+50;
        ripple.fill(dotcolour, a);
        ripple.ellipse(i+x, j+y, 8+(j)*0.025, 1+(j)*0.01);
      }
    }
  ripple.endDraw();
  return ripple;
}


