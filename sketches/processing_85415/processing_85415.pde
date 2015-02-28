
int counter;

void setup() {  //setup function called initially, only once
  size(300, 300);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  noStroke();
}

void draw() {  //draw function loops 
draw_photon(200,200, 300,300,100,20);
}

void draw_photon(int x1, int y1, int x2, int y2, int col, int amplitude) {
    dist   = sqrt((x2-x1)^2 + (y2-y1)^2)
    dx     = (x2-x1)/dist;
    dy     = (y2-y1)/dist;
    for(i=0; i<dist-1; i++) {
        for(j=(i < 100) ? i : 100; j>0; j--) {
          fill(col,255,100-j, j);
          ellipse(j*dx, j*dy, 5, 5);
        }
    }
}
