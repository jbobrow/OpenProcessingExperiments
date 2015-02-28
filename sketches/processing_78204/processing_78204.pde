
void setup() {
  size(320, 480);
 frameRate(15);
}

void draw() {
int w = width;
int h = height;
int cx = w/2;
int cy = h/2;
int cg = h*5/(5+8);

strokeWeight(3);
line(cx,0,cx,h);
//line(0,cy,w,cy);
line(0,cg,w,cg);
}
