
float noiseSrcA=0;
float noiseSrcB=0;
float noiseSrcC=0;
float noiseSrcD=0;
 
float a= calc(noiseSrcA);
float b= calc(noiseSrcB);
float c= calc(noiseSrcC);
float d= calc(noiseSrcD);
 
float mod= 0.1;
float startTrans= 100;
 
color red1= color(2, 70, 9);
color blue1= color(245, 7, 5);
 
ArrayList line1;
 
void setup() {
  size(600, 600, P2D);
  background(255);
  smooth();
  line1 = new ArrayList();
}
 
void draw() {
  background(255);
  for(int i=10; i<line1.size(); i++) {        
    FadingLine lines = (FadingLine) line1.get(i);
    lines.drawLine();   //draw the lines in the arrayList
    lines.update();     //update transparency
    if(lines.trans<0) {
      line1.remove(i);  //remove lines no longer visible
    }
  }
 
  noiseSrcA+= random(mod);
  noiseSrcB+= random(mod);
  noiseSrcC+= random(mod);
  noiseSrcD+= random(mod);
 
  a= calc(noiseSrcA);
  b= calc(noiseSrcB);
  c= calc(noiseSrcC);
  d= calc(noiseSrcD); //generate new values
   
  println(line1.size());
 
  line1.add(new FadingLine(a, b, c, d, startTrans, red1)); //add lines to arrayList with new values
  line1.add(new FadingLine(b, a, c, d, startTrans, red1));
  line1.add(new FadingLine(a, b, d, c, startTrans, red1));
  line1.add(new FadingLine(b, a, d, c, startTrans, red1));
 
  line1.add(new FadingLine(a, c, b, d, startTrans, blue1));
  line1.add(new FadingLine(c, a, d, b, startTrans, blue1));
}
 
class FadingLine {
  float x1, y1, x2, y2, trans;
  color col;
 
  FadingLine(float X1, float Y1, float X2, float Y2, float TRANS, color COL) {
    x1= X1;
    x2= X2;
    y1= Y1;
    y2= Y2;
    trans= TRANS;
    col= COL;
  }
 
  void drawLine() {
    stroke (col, trans);
    line(x1, y1, x2, y2);
  }
 
  void update() {
    trans-= 10;
  }
}
 
float calc(float source) {
  float noiseResult= noise(source);
  float noiseMap= map(noiseResult, 0, 1, 0, width);
  return noiseMap;
}
 
void keyPressed(){
  if (key=='s' || key=='S'){
    saveFrame("arrayList2d###.tif");
  }
}

