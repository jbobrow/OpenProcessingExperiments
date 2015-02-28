
import peasy.*;

PeasyCam cam;

float noiseSrcA=0;
float noiseSrcB=0;
float noiseSrcC=0;
float noiseSrcD=0;
float noiseSrcE=0;
float noiseSrcF=0;

float a= calc(noiseSrcA);
float b= calc(noiseSrcB);
float c= calc(noiseSrcC);
float d= calc(noiseSrcD);
float e= calc(noiseSrcE);
float f= calc(noiseSrcF);

float mod= 0.03;
float startTrans= 50;

color red1= color(240, 7, 9);
color blue1= color(9, 7, 245);

ArrayList line1;

void setup() {
  size(600, 600, P3D);
  background(255);
  smooth();

  cam = new PeasyCam(this, 500);

  line1 = new ArrayList();
}


void draw() {

  background(200);
  for(int i=1; i<line1.size(); i++) {
    FadingLine lines = (FadingLine) line1.get(i);
    lines.drawLine();
    lines.update();
    if(lines.trans<0) {
      line1.remove(i);
    }
  }

  noiseSrcA+= random(mod);
  noiseSrcB+= random(mod);
  noiseSrcC+= random(mod);
  noiseSrcD+= random(mod);
  noiseSrcE+= random(mod);
  noiseSrcF+= random(mod);

  a= calc(noiseSrcA);
  b= calc(noiseSrcB);
  c= calc(noiseSrcC);
  d= calc(noiseSrcD);
  e= calc(noiseSrcE);
  f= calc(noiseSrcF);

  println(line1.size());

  line1.add(new FadingLine(a, b, c, d, e, f, startTrans, red1));
  line1.add(new FadingLine(b, a, c, d, e, f, startTrans, red1));
  line1.add(new FadingLine(a, b, d, c, f, e,  startTrans, red1));
  line1.add(new FadingLine(b, a, d, c, f, e, startTrans, red1));

  line1.add(new FadingLine(a, c, b, d, e, f, startTrans, blue1));
  line1.add(new FadingLine(c, a, d, b, f, e, startTrans, blue1));
}

class FadingLine {
  float x1, y1, z1, x2, y2, z2, trans; 
  color col;

  FadingLine(float X1, float Y1, float Z1, float X2, float Y2, float Z2, float TRANS, color COL) {
    x1= X1;
    x2= X2;
    y1= Y1;
    y2= Y2;
    z1= Z1;
    z2= Z2;
    trans= TRANS;
    col= COL;
  }

  void drawLine() {
    stroke (col, trans);
    line(x1, y1, z1, x2, y2, z2);
  }

  void update() {
    trans-= 0.1;
  }
}

float calc(float source) {
  float noiseResult= noise(source);
  float noiseMap= map(noiseResult, 0, 1, -width/2, width/2);
  return noiseMap;
}

void keyPressed(){
  if (key=='s' || key=='S'){
    saveFrame("arrayList3d###.tif");
  }
}

