
float t;
int nMax;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
  smooth();
  nMax = 3;
}

void draw() {
    t = millis()/1000;
    background(255);
    drawCircles(width/2, height/2, 100, nMax, 1);
}

void drawCircles(int cX, int cY, int d, int n, int f) {
    fill(200-(150/nMax)*n, 0, 0);
    int s = (1+cos((t*f)%PI))*d;
    
    int[] xArr = {cX+s-d, cX-s+d, cX-d, cX+d};
    int[] yArr = {cY+d, cY-d, cY+s-d, cY-s+d};
    
    for (int i = 0; i < 4; i++) {
        fill(200-(150/nMax)*n, 0, 0);
        ellipse(xArr[i], yArr[i], d, d);
        if (n > 0) {
            drawCircles(xArr[i], yArr[i], d/2, n-1, f);
        }
    }
}
