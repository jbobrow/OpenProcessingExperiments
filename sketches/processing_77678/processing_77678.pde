
final int figQty = 44;
final int minFig = 8;
final int maxFig = 44;
final float easing = 0.02;
float[] xxx, yyy, siz, deltx, delty, col, goalx, goaly;
 
void setup( )
{
  size( 400, 400 );
  noStroke();
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
}
void draw( )
{
  background(33);
 
  ease();
  refresh();
}
 
void refresh() {
if (frameCount % 100 == 99) {
 
    randoPop(goalx, 0, width);
    randoPop(goaly, 0, height);
  }
}
 
void ease() {
 
for (int i = 0 ; i < maxFig ; i++) {
 fill(133, 177);
    ellipse( xxx[i], yyy[i], siz[i], siz[i]);
     fill(169, 255);
    rect( xxx[i]-(2.33*siz[i]/10), yyy[i]-(2*siz[i]/10), siz[i]/10, siz[i]/10);
   
  deltx[i] = goalx[i] - xxx[i];
  if (abs(deltx[i]) > 1) {
    xxx[i] += deltx[i] * easing;
  }
 
  delty[i] = goaly[i] - yyy[i];
  if (abs(delty[i]) > 1) {
    yyy[i] += delty[i] * easing;
  }}
}
 
 
 
void randoPop(float[] farray, float low, float high) {
  for (int i = 0 ; i<farray.length ; i++) {
    farray[i] = random(low, high);
  }
}
