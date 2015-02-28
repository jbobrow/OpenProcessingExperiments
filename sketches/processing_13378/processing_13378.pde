
// Mouvement pseudo-brownien (on utilise une loi uniforme au lieu d'une normale)
// PrPierre, 2008

int NPART = 100; // nombre de particules
int D = 5; // ecart type du processus

int[] x = new int[NPART];
int[] y = new int[NPART];
int i;
float th, ra, R;

void setup() {
  R = D*sqrt(3.0);
  size(600,600);
  frameRate(30);
  smooth();strokeWeight(20);
  for (i=0;i<NPART;i++) {
    x[i] = int(random(width));
    y[i] = int(random(height));
  }
}

void draw() {
 background(0);
 for (i=0;i<NPART;i++) {
    x[i] += int(random(-R,R));
    x[i] = max(x[i],0); x[i] = min(x[i],width);
    y[i] += int(random(-R,R));
    y[i] = max(y[i],0); y[i] = min(y[i],height);
    // on colorie autrement la particule 0 pour la suivre des yeux
    if (i==0) stroke(255,0,0); else stroke(255);
    point(x[i],y[i]);
  } 
} 

