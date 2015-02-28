
float[] x = new float[20];
float[] y = new float[20];
float segLength = 5;

float prisemesure;
float crayonh;
float crayonv;

float ah;
float av;
float bh;
float bv;
float ch;
float cv;

float ctruc;

void setup (){
  size (500,500);
  background (0);
  
  prisemesure = 0;
  crayonh = 0;
  crayonv = 0;
  ah = -50;
  av = -50;
  bh = -50;
  bv = -50;
  ch = -50;
  cv = -50;
  ctruc = 56;
  
}

void draw (){
  
  smooth ();
  
  
  
  
  //   INT
  
  
  
  
  
  int tc;
  tc = 10;
  
  int prsmsr;
  prsmsr = 100;
  
  int rand;
  rand = -15;
  int rand2;
  rand2 = 15;
  
  int randv;
  randv = -15;
  int randv2;
  randv2 = 15;
  
  int sw;
  sw = 1;
  
  
  //color cline = color (ctruc,50);
  color cline = color (255,25);
  
  
  
  
  
  
  //   FLOAT
  
  
  
  
  
  ctruc = ctruc+1;
  if (ctruc>255){
    ctruc = 0;}
  
  prisemesure = prisemesure+1;
  
  crayonh = crayonh + random (rand,rand2);
  crayonv = crayonv + random (randv,randv2);
  
  if (prisemesure<prsmsr*1-1){noStroke();}
  
   /*
  if (prisemesure>prsmsr*1-1){
    if (prisemesure<prsmsr*1+1){
      crayonh = -width*2;
      crayonv = -height*2;}}
      
  if (prisemesure>prsmsr*2-1){
    if (prisemesure<prsmsr*2+1){
      crayonh = -width*2;
      crayonv = -height*2;}}
  
  if (prisemesure>prsmsr*3-1){
    if (prisemesure<prsmsr*3+1){
      crayonh = -width*2;
      crayonv = -height*2;}}
      
   if (prisemesure>prsmsr*4-1){
     prisemesure = 0;
     crayonh = -width*2;
      crayonv = -height*2;}
   */
  
  
  //   PLACEMENT DES POINTS
  
  
  
  if (prisemesure>prsmsr*1-2){
    if (ah<0){
    ah = 0+crayonh;
    ah = ah;}}
  if (prisemesure>prsmsr*1-2){
    if (av<0){
    av = 0+crayonv;
    av = av;}}
  
  if (prisemesure>prsmsr*2-2){
    if (bh<0){
    bh = 0+crayonh;
    bh = bh;}}
  if (prisemesure>prsmsr*2-2){
    if (bv<0){
    bv = 0+crayonv;
    bv = bv;}}
  
  if (prisemesure>prsmsr*3-2){
    if (ch<0){
    ch = 0+crayonh;
    ch = ch;}}
  if (prisemesure>prsmsr*3-2){
    if (cv<0){
    cv = 0+crayonv;
    cv = cv;}}
  
  
  
  //   REINITIALISATION
  if (crayonh<0-width){
    crayonh = random (0,width);
  }
  if (crayonv<0-height){
    crayonv = random (0,height);
  }
  
  if (crayonh>width){
    crayonh = random (0,width);}
  if (crayonv>height){
    crayonv = random (0,height);}
  if (crayonh<0){
    crayonh = random (0,width);}
  if (crayonv<0){
    crayonv = random (0,height);}
  
  
  
  
  
  //   DRAW   DRAW   DRAW
  
  
  
  
  
  //background (255);
  
  
  
  dragSegment(0, crayonh, crayonv);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
  
  
  
  stroke (0);
  strokeWeight (5);
  //line (0,0,crayonh,crayonv);
  
  noStroke ();
  fill (0);
  
  //ellipse (ah,av,tc,tc);
  //ellipse (bh,bv,tc,tc);
  //ellipse (ch,cv,tc,tc);
  
    stroke (cline);
    strokeWeight (sw);
  
  
  
  
}



void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}
