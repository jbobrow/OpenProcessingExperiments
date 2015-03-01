
int nben=100;
int nberangs=90;
float cellheight;
float offx;
Cell [] []cells=new Cell[nben][nberangs];
void setup() {
  size(600, 600);
  frameRate(200);
  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  //noStroke();
  //strokeWeight(.3);
  cellheight=height/nben;
  offx=(width-150)/nberangs;
  for (int r=0; r<nberangs; r++) {
    for (int i=0; i<nben; i++) {
      cells[i][r]=(new Cell(i, r));
    }
  }
}
void draw() {
  background(128);
  for (int r=0; r<nberangs-1; r++) {
    beginShape();
    fill(cells[0][r].col);
    for (int i=0; i<nben; i++) {
      cells[i][r].display();
      if(i>0 && abs(cells[i][r].x-cells[i-1][r].x)<100){
        vertex(cells[i][r].x, cells[i][r].y);
      }
//      else{
//        endShape();
//        beginShape();
//        vertex(cells[i][r].x, cells[i][r].y);
//      }
    }
    for (int i=nben-1; i>=0; i--) {
      cells[i][r+1].display();
      if(i>0 && abs(cells[i][r+1].x-cells[i-1][r+1].x)<100){
        vertex(cells[i][r+1].x, cells[i][r+1].y);
      }
//      else{
//        endShape();
//        beginShape();
//        vertex(cells[i][r+1].x, cells[i][r+1].y);
//      }
    }
    endShape();
  }
}
class Cell {
  int n, p;
  float x, y;
  color col=color(128+random(128),0,128+random(128),150);
  Cell(int n, int p) {
    this.n=n;
    this.p=p;
    x=p*offx-60;
    y=cellheight/2+n*cellheight;
  }
  void display() {
    x=p*offx-60+noise(n/100,millis()/5000,sin(n/(10+mouseX/20))+cos(p/(10+mouseY/20)))*300;//*sin((n+frameCount)/100)//
    x=(x+width)%width;
  }
}



