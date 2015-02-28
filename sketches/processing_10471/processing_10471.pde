
/**
 * MoireCircles
 * A simple moire effect to try out smooth 2d motion
 * Mouse control: Click into the sketch to control the overlay with the mouse
 *
 * Joerg Reuter, jore[at]stachelig[dot]de
 * Creative Commons Attribution 3.0 license
 * http://stachelig.de
 */

int MAX_X = 640;
int MAX_Y = 360;

int frame = 0;
boolean interactive = false;

PGraphics mg;
Lissajous lissX;
Lissajous lissY;

void setup() {
  size(MAX_X, MAX_Y, P2D);
  createMoirePatternCircles();
  lissX = new Lissajous(3, 28, -.01, 4, 15, .05, 2, 19, -.07);
  lissY = new Lissajous(2, 18, -.01, 4, 12, .05, 3, 29, -.07);
}

void mousePressed() {
  lissX = new Lissajous(
      random(2,8), random(2,30), random(-.2, .2),
      random(2,8), random(2,30), random(-.2, .2),
      random(2,8), random(2,30), random(-.2, .2));
  lissY = new Lissajous(
      random(2,8), random(2,30), random(-.2, .2),
      random(2,8), random(2,30), random(-.2, .2),
      random(2,8), random(2,30), random(-.2, .2));
}

void draw() {
  if(mousePressed)
    interactive = !interactive;
    
  float t = frame++ * 1.0; // use factor to slow down or speed up animation
  image(mg, -MAX_X/2-lissX.get(t), -MAX_Y/2-lissY.get(t));

  if(interactive)
    blend(mg, 0, 0, MAX_X*2, MAX_Y*2, mouseX-MAX_X, mouseY-MAX_Y, MAX_X*2, MAX_Y*2, DIFFERENCE);
  else
    blend(mg, 0, 0, MAX_X*2, MAX_Y*2, int(-MAX_X/2-lissX.get(t+20)), int(-MAX_Y/2-lissY.get(t+25)), MAX_X*2, MAX_Y*2, DIFFERENCE);
}

// fill an image with concentric circles
void createMoirePatternCircles() {
  mg = createGraphics(MAX_X*2, MAX_Y*2, P2D);
  mg.beginDraw();
  mg.background(0);
  mg.noStroke();
  mg.smooth();
  int diag=int(sqrt(sq(MAX_X)+sq(MAX_Y)));
  boolean odd=true;  
  for(int i=diag*2; i>0; i-=20) {
    mg.fill(odd ? #ffffff : #000000);
    mg.ellipse(MAX_X, MAX_Y, i, i);
    odd = !odd;
  }
  mg.endDraw(); 
}

class Lissajous {
  float freq1, freq2, freq3;
  float amp1, amp2, amp3;
  float dir1, dir2, dir3;
  
  public Lissajous(float freq1, float amp1, float dir1, float freq2, float amp2, float dir2, float freq3, float amp3, float dir3) {
    this.freq1 = freq1;
    this.amp1 = amp1;
    this.dir1 = dir1;
    this.freq2 = freq2;
    this.amp2 = amp2;
    this.dir2 = dir2;
    this.freq3 = freq3;
    this.amp3 = amp3;
    this.dir3 = dir3;
  }
  
  public float get(float t) {
    return amp1*sin(freq1+dir1*t) + amp2*sin(freq2+dir2*t) + amp3*sin(freq3+dir3*t);
  }
}


