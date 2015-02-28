
int b, k, l, m, n, o, p;
float q;
int framWh = 30;
int wh = 24;
float[] y = new float[25];
float[] pos = new float[25];

void setup() {
  size(600, 600);
  background(100);
  noFill();
  smooth();
  for ( int i = 0; i < y.length; i++) {
    y[i]=100;
  }
  b=100;
  frameRate(30);
  noCursor();
}

void draw() {
  background(100);
  for ( int i = 0; i < y.length; i++) {
    for ( int j = 0; j < y.length; j++) {
      k=mouseX-(i*framWh+(framWh-wh));
      n=mouseY-(j*framWh+(framWh-wh));
      l=abs(i-k);
      o=abs(j-n);
      y[i]=100+i*4;
      b=100;
      pos[i]=(i-1)*framWh+(framWh-wh)/2+random(-3, 3); 
      pos[j]=(j-1)*framWh+(framWh-wh)/2+random(-3, 3); 
      m=255-l*3;
      p=255-o*3;
      q=(m+p)/2;
      if (q<=100) {
        q=100;
      }
      stroke(q);
      rect(pos[i], pos[j], wh, wh);
    }
  }
}


