
// Direct port of sample code by Paul Bourke.
// Original code: http://paulbourke.net/geometry/bezier/

int ni=4, nj=5, RESI=ni*10, RESJ=nj*10;
PVector outp[][], inp[][];


void setup() {
  size(600,600,P3D);
  build();
}

void draw() {
  background(255);
  translate(width/2,height/2);
  lights();
  scale(0.9);
  rotateY(map(mouseX,0,width,-PI,PI));
  rotateX(map(mouseY,0,height,-PI,PI));
  
  noStroke();
  fill(255);
  stroke(0);
  for(int i=0; i<RESI-1; i++) {
    beginShape(QUAD_STRIP);
    for(int j=0; j<RESJ; j++) {
      vertex(outp[i][j].x,outp[i][j].y,outp[i][j].z);
      vertex(outp[i+1][j].x,outp[i+1][j].y,outp[i+1][j].z);      
    }
    endShape();
  }
}

void keyPressed() {
  if(key==' ') build();
  if(!online)saveFrame("bezPatch.png");
}

void build() {
  int i, j, ki, kj;
  double mui, muj, bi, bj;

  outp=new PVector[RESI][RESJ];
  inp=new PVector[ni+1][nj+1];

  for (i=0;i<=ni;i++) {
    for (j=0;j<=nj;j++) {
      inp[i][j]=new PVector(i,j,random(-3,3));
    }
  }

  for (i=0;i<RESI;i++) {
    mui = i / (double)(RESI-1);
    for (j=0;j<RESJ;j++) {
      muj = j / (double)(RESJ-1);
      outp[i][j]=new PVector();
      
      for (ki=0;ki<=ni;ki++) {
        bi = BezierBlend(ki, mui, ni);
        for (kj=0;kj<=nj;kj++) {
          bj = BezierBlend(kj, muj, nj);
          outp[i][j].x += (inp[ki][kj].x * bi * bj);
          outp[i][j].y += (inp[ki][kj].y * bi * bj);
          outp[i][j].z += (inp[ki][kj].z * bi * bj);
        }
      }
      outp[i][j].add(new PVector(-ni/2,-nj/2,0));
      outp[i][j].mult(100);
    }
  }
}

double BezierBlend(int k, double mu, int n) {
  int nn, kn, nkn;
  double blend=1;

  nn = n;
  kn = k;
  nkn = n - k;

  while (nn >= 1) {
    blend *= nn;
    nn--;
    if (kn > 1) {
      blend /= (double)kn;
      kn--;
    }
    if (nkn > 1) {
      blend /= (double)nkn;
      nkn--;
    }
  }
  if (k > 0)
    blend *= Math.pow(mu, (double)k);
  if (n-k > 0)
    blend *= Math.pow(1-mu, (double)(n-k));

  return(blend);
}


