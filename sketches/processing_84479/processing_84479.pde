
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/84310*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int l = 50000;
float px[] = new float[l*2];
float py[] = new float[l*2];
color b;
float m = 1;
float n = 4;

//================================================================

void setup() {
  size(512, 512);
  background(255);
  smooth();
  b = color(0, 128, 0);
  for(int i = 0; i < l; i++) {
    px[i] = random(width);
    py[i] = random(height/2);
    set((int)px[i], (int)py[i], b);
  }
  b = color(128, 0, 0);
  for(int i = l + 1; i < l*2; i++) {
    px[i] = random(width);
    py[i] = random(height/2) + height/2;
    set((int)px[i], (int)py[i], b);
  }
}

//================================================================

void draw() {  
  if (mousePressed) {
    background(255);
    rotatePoints(mouseX - 50, mouseY, LEFT);
    rotatePoints(mouseX + 50, mouseY, RIGHT);
    b = color(0, 128, 0);
    for(int i = 0; i < l; i++)
      set((int)px[i], (int)py[i], b);      
    b = color(128, 0, 0);
    for(int i = l+1; i < l*2; i++)
      set((int)px[i], (int)py[i], b);
  }  
}

//================================================================

void rotatePoints(int x, int y, int dir) {
  for(int i = 0; i < l*2; i++) {
    float mx = px[i]-float(x);
    float my = py[i]-float(y);
    float r = dist(px[i]/m, py[i]/m, x/m, y/m);
    r*=r/50;
    float tx = 0;
    float ty = 0;
    if(dir==LEFT) {
      tx = cos(1/r*n)*mx-sin(1/r*n)*my;
      ty = sin(1/r*n)*mx+cos(1/r*n)*my;
    }
    else{
      tx = cos(-1/r*n)*mx-sin(-1/r*n)*my;
      ty = sin(-1/r*n)*mx+cos(-1/r*n)*my;
    }
    tx += float(x);
    ty += float(y);
    px[i] = tx;
    py[i] = ty;
    if(px[i]>width)
      px[i] = 0;
    if(px[i]<0)
      px[i] = width;
    if(py[i]>width)
      py[i] = 0;
    if(py[i]<0)
      py[i] = width;
  }
}

