
float [] x = new float[500];
float [] y = new float[500];
float [] t = new float[500];
float [] v = new float[500];

void setup() {
  size(900,500);
  frameRate(10);
  for (int p=0; p < x.length; p++) {
    x[p]=random(width);
    y[p]=random(height);
    t[p]=random(5, 50);
    v[p]=random(0.1,3);
  }
}
void draw() {
  background(0);
   for (int p=0; p < t.length; p++) {
    x[p]+=v[p];
    if(x[p] > width){
      x[p] = 0;
    }
    fill(255,255,255,90);
    smooth();
    noStroke();
    ellipse(x[p],y[p],t[p]/random(5),t[p]/random(5));
  }
}
void mousePressed() {
  loop();
}
 

void mouseReleased() {
  noLoop();
}

