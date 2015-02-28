
// Build an array of colors.
// Initial screen shows two colors.
// Each mouse press adds a child color between the two parents, until nmax is reached, when it starts over.

int n, nmax;
int r1=150,g1=0,b1=90, r2=30,g2=120,b2=0;
color leftcolor=color(r1,g1,b1);
color rightcolor=color(r2,g2,b2);
float wd;

void setup() {
  size(640, 360);
  noStroke();
  noLoop();
  n=2;
  nmax=7;
}

void draw() {
  wd=float(width)/float(n);
  for(int i = 0; i<=n; i++) {
    float x=float(i)/float(n-1);
    color inter = lerpColor(leftcolor, rightcolor, x);
    fill(inter);
    rect(wd*i,0,wd,height);
  }  
} 

void mousePressed() {
  n+=1;
  redraw();
  if (n >= nmax) { n = 1; } 
}
