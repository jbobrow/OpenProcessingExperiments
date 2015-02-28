
int numC = 400;
int numR = 300;
int s = 20;

int[] xC = new int [numC];
int[] yC = new int [numC];
int[] xR = new int [numR];
int[] yR = new int [numR];

color[] c = new color[numC];

void setup() {
  size(450, 600);
  smooth();
  for (int i = 0; i < numC; i++) {
    xC[i] = int(random(width));
    yC[i] = int(random(height));
    c[i] = color(random(70), random(110), random(240), random(256));
  }
  for (int r = 0; r < numR; r++) {
    xR[r] = int(random(width));
    yR[r] = int(random(height));
  }
}
void draw () {
  background(255);
  for (int i = 0; i < numC; i=i+2) {
    xC[i]++;
    if (xC[i]> width+s) {
      xC[i]=-s;
      yC[i]=int(random(height));
      c[i]=color(random(10), random(10), random(265), random(256));
    }
    cloud(xC[i], yC[i], c[i]);
  }
  for (int r = 0; r < numR; r++) {
    xR[r]++;
    if (xR[r]> width+s) {
      xR[r]=-s;
      yR[r]=int(random(height));
       c[r]=color(random(20), random(240), random(240), random(256));
    }
    
    rain(xR[r], yR[r], c[r]);
  }
}


void cloud (int xx, int yy, color col) {
  noStroke();
  fill(col);
  ellipse(xx, yy, 20, 20);
  ellipse(xx+14, yy-4, 20, 20);
  ellipse(xx-10, yy-6, 20, 20);
  ellipse(xx+3, yy-14, 20, 20);
}


 void rain (int xx, int yy, color col) {
 noStroke();
 fill(col);
 ellipse(xx, yy, 4, 10);
 ellipse(xx+5,yy-20,4,8);
 ellipse(xx-13,yy-15,3,8);
 }
 

