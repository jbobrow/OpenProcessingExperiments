
//siatka - Piotr Welk

Grid grid;

Grid grid1;

void setup() {
  size(600, 600, P3D);
  background(0);
  stroke(0, 10);
  textSize(10);

  grid = new Grid(25,20);
}
void draw() {
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
    p = new int[d*d][6];
    for (int i=0;i<d*d;++i) {
      p[i][0]=i/d*o+int(random(-2, 2));
      p[i][1]=i%d*o+int(random(-2, 2));
      p[i][2]=int(random(-2, 2));
      p[i][3] = int(random(255));
      p[i][4] = int(random(255));
      p[i][5] = int(random(255));
    }
  }
  int di() {
    return d;
  }
  int od() {
    return o;
  }

  void render() {
    translate(width/2-(d*o/2), height/2-(d*o/2));
    for (int i=0;i<d*d;++i) {
      p[i][0]=p[i][0]+int(random(-2, 2));
      p[i][1]=p[i][1]+int(random(-2, 2));
    }
    for (int i=0;i<d*(d-1)-1;++i) {
      if ((i+1)%d>0) {
        beginShape(POLYGON);
        fill(p[i][3], p[i][4], p[i][5], 1);
        vertex(p[i][0], p[i][1], p[i][2]);
        fill(p[i+d][3], p[i+d][4], p[i+d][5], 2);
        vertex(p[i+d][0], p[i+d][1], p[i+d][2]);
        fill(p[i+d+1][3], p[i+d+1][4], p[i+d+1][5], 2);
        vertex(p[i+d+1][0], p[i+d+1][1], p[i+d+1][2]);
        fill(p[i+1][3], p[i+1][4], p[i+1][5], 2);
        vertex(p[i+1][0], p[i+1][1], p[i+1][2]);
        endShape(CLOSE);
      }
    }
  }
}


