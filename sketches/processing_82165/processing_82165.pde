
final int figQty = 45;
final int minFig = 1;
final int maxFig = 44;
final float easing = 0.02;
float[] xxx, yyy, siz, deltx, delty, col, goalx, goaly, huehue;

void setup( )
{
  size( 400, 400 );
  noStroke();
  colorMode(HSB);
  smooth();
  final float speedDemon = width/2/60;

  xxx= new float [figQty] ;
  randoPop(xxx, 0, width);
  yyy  = new float [figQty] ;
  randoPop(yyy, 0, height);
  siz  = new float [figQty] ;
  randoPop(siz, minFig, maxFig );
  deltx = new float [figQty] ;
  randoPop(deltx, -speedDemon, speedDemon);
  delty = new float [figQty] ;
  randoPop(delty, -speedDemon, speedDemon);
  goalx = new float [figQty] ;
  randoPop(goalx, 0, width);
  goaly = new float [figQty] ;
  randoPop(goaly, 0, height);
  huehue = new float [figQty] ;
  randoPop (huehue, 0, 255);
}
void draw( )
{
  background(255);
refresh();
  ease();
  if (keyPressed) {
    randoPop(goalx, -.5 * width, 1.5 *  width);
    randoPop(goaly, -.5 * height, 1.5 * height);
  }

  if (mousePressed) {
    randoPop (huehue, 0, 255);
  }
}

void refresh() {
if (frameCount % 60 == 59) {
 
    randoPop(goalx, 0, width);
    randoPop(goaly, 0, height);
  }
}
void ease() {

  for (int i = 0 ; i < maxFig ; i++) {
    fill(int(huehue[i]), 244, 244,111);
    ellipse( (width + xxx[i]) % width, ( height + yyy[i] )% height, siz[i], siz[i]); ////THIS IS WRAPPING GOLD ...GOLD.
    deltx[i] = goalx[i] - xxx[i];
    if (abs(deltx[i]) > 1) {
      xxx[i] += deltx[i] * easing;
    }

    delty[i] = goaly[i] - yyy[i];
    if (abs(delty[i]) > 1) {
      yyy[i] += delty[i] * easing;
    }
  }
}


void randoPop(float[] farray, float low, float high) {
  for (int i = 0 ; i<farray.length ; i++) {
    farray[i] = random(low, high);
  }
}
