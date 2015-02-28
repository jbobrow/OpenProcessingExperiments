
PolygoneSystemeEditable ps;
int np = 16;
int ns = 8;

boolean textAffiche = false;
boolean pauseMain = false;

void setup() {
  size(400,400);
  smooth();
  textAlign(LEFT,TOP);
  reset();
}

void reset() {
  ps = new PolygoneSystemeEditable(np,ns);
  ps.pause = pauseMain;
}

void draw() {
  background(0);
  ps.update();
  ps.dessine();
  if(ps.pause) {text("pause",10,30);}
  if(textAffiche) {
    text("AreaSeekingPolygon0.02/"+ps.nombreDePolygones+"Polygones/fps"+round(frameRate),10,10);
    int i=0;
    for(Ppolygone p : ps.polygones) {
      text("polygone "+i+
           ", aire = "+round(p.aire)+
           ", aireCible = "+round(p.aireCible)+
           ", croise = "+p.croise,
           10,50+i*20);
      i++;
    }
  }
}

void keyPressed() {
  if(key==' ') {reset();}
  if(key=='m') {textAffiche=!textAffiche;}
}

