
int nben=50;
int nberangs=50;
float cellheight;
float offx;
int base=3;
float falloff=.2;
Cell [] []cells=new Cell[nben][nberangs];
void setup() {
  size(600, 600);
  frameRate(200);
  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  //noStroke();
  strokeWeight(.1);
  smooth(8);
  noiseDetail(1,3);
  cellheight=height/nben;
  offx=width/nberangs;
  for (int r=0; r<nberangs; r++) {
    for (int i=0; i<nben; i++) {
      cells[i][r]=(new Cell(i, r));
    }
  }
}
void draw() {
  
  for (int r=0; r<nberangs; r++) {
    for (int i=0; i<nben; i++) {
      noiseDetail(base,falloff*abs(cos(r/100+i/100)+cos(frameCount/500)));//*cos(noise(frameCount/1000,i/10,r/10)));//
      float startrad=0;
      cells[i][r].run();
    }
  }
}
void mousePressed(){
  background(0);
  base=1+int(mouseY/100);
  falloff=2*mouseX/width;
  for (int r=0; r<nberangs; r++) {
    for (int i=0; i<nben; i++) {
      cells[i][r].x=cells[i][r].x0;
      cells[i][r].y=cells[i][r].y0;
    }
  }
}
class Cell {
  int n, p;
  float x, y,x0,y0;
  float radius;
  color col=color(128+random(128), 0, 128+random(128), 50);
  Cell(int n, int p) {
    this.n=n;
    this.p=p;
    x0=x=offx/2+p*offx;
    y0=y=cellheight/2+n*cellheight;
  }
  void run(){
    x+=cos(  noise(x*.01,y*.01)*TWO_PI  );
    y+=sin(  noise(x*.01,y*.01)*TWO_PI  );
    display();
  }
  void display() {
    stroke(128+128*sin(noise(x*.01,y*.01)), 150, 128+128*cos(noise(x*.01,y*.01)), 30);
    point(x,y);
    if(x<0||x>width||y<0||y>height){
      x=x0;
      y=y0;
    }
  }
}



