
//siatka - Piotr Welk

Grid grid;

Grid grid1;

void setup() {
  size(800, 800);
  background(0);
  //stroke(255);
  textSize(10);

  grid = new Grid(30, 28);
  //grid1 = new Grid(20,55);
}
//____________________________________________budowanie siatki
void draw() {
  //background(0);

  grid.render();

}
class Grid {
  int d;//____________________________________________ilość podziałów
  int o; //____________________________________________odleglości między punktami
  int[][] p;//_____________________________________tablica do przechowywania wartosci punktów
  int l =0;

  Grid(int d_, int o_) {
    d=d_;
    o=o_;
    p = new int[d*d][9];
    for (int i=0;i<d*d;++i) {
      p[i][0]=i/d*o;
      p[i][1]=i%d*o;
      p[i][2]=0;
      p[i][3] = int(random(255));
      p[i][4] = int(random(255));
      p[i][5] = int(random(255));
      p[i][6] = int(sin(radians(i*360/d))*(i/d*o));
      p[i][7] = int(cos(radians(i*360/d))*(i/d*o));
      p[i][8] = int(random(255));
    }
  }
  int di() {
    return d;
  }
  int od() {
    return o;
  }

  void render() {

    translate(width/2, height/2);
    noStroke();
    noFill();
    for (int i=0;i<d*d;++i) {
      p[i][6]=p[i][6]+int(random(-2, 2));
      p[i][7]=p[i][7]+int(random(-2, 2));
    }
    for (int i=0;i<d*(d-1)-1;++i) {

      if ((i+1)%d>0) {
        beginShape(POLYGON);
        fill(p[i][3], p[i][4], p[i][5]);
        vertex(p[i][6], p[i][7], p[i][2]);
        fill(p[i+d][3], p[i+d][4], p[i+d][5]);
        vertex(p[i+d][6], p[i+d][7], p[i+d][2]);
        fill(p[i+d+1][3], p[i+d+1][4], p[i+d+1][5]);
        vertex(p[i+d+1][6], p[i+d+1][7], p[i+d+1][2]);
        fill(p[i+1][3], p[i+1][4], p[i+1][5]);
        vertex(p[i+1][6], p[i+1][7], p[i+1][2]);
        endShape(CLOSE);
      }
      if ((i+1)%d==0) {
        beginShape(POLYGON);
        vertex(p[i][6], p[i][7], p[i][2]);
        vertex(p[i+d][6], p[i+d][7], p[i+d][2]);
        vertex(p[i+d+1][6], p[i+d+1][7], p[i+d+1][2]);
        vertex(p[i+1][6], p[i+1][7], p[i+1][2]);
        endShape(CLOSE);
      }
    }
  }
}
