
int num = 85;
int s =30;
 
color[] c = new color[num];
int [] x = new int [num];
int [] y = new int [num];
 
void setup() {
  size(500, 500);
  smooth();
  for (int i = 0; i <num; i++) {
    x[i] = int(random(width));
    y[i] = int(random(height));
    c[i] = color(random(256), random(256), random(256));
  }
}
 
void draw () {
  background(115);
  for (int i = 0; i <num; i++) {
    x[i]++;
    //y[i]++;
    if (x[i]>width+s) {
      x[i]=-s;
      y[i]=int(random(height));
      c[i]=color(random(256), random(256), random(256));
    }
    car(x[i], y[i], c[i]);
  }
}
 
void car(int x, int y, color col) {
noStroke();
fill(col);
  ellipse(x, y, 20, 20);
  rect(x-14,y+2,15,15);
  rect(x+1,y+2,15,15);
  fill(0);
  ellipse(x-8, y+15, 12, 12);
  ellipse(x+8, y+15, 12, 12);
  stroke(0);
  strokeWeight(5);
  line(x+8, y-3, x+28, y-3);
  rect(x+25, y-7, 4, 8);
}



