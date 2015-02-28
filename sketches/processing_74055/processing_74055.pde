
int siz=100; //diameter of circles
int hs=siz/2;//half size
int ss = (int)sq(hs);//square root of hs
boolean onoff[][]=new boolean[siz][siz];//array to determine which pixels must be lit to make the circle
ArrayList circles = new ArrayList();

void setup() {
  size(510, 510);
  background(6);
  render();//create the array for the circle
}
void draw() {
  loadPixels();
  for (int i=0; i<pixels.length; i++)
    pixels[i]=color(0, 20);
  updatePixels();

  loadPixels();
  for (int n=0; n<circles.size(); n++) {
    circle a = (circle) circles.get(n);
    for (int y=0; y<siz; y++) {
      int yyy = y*width+a.addon;
      for (int x=0; x<siz; x++) {
        if (onoff[x][y]) {
          int ttt = x+yyy;
          if (ttt<pixels.length && ttt>0) {
            pixels[x+yyy]=a.col;
          }
        }
      }
    }
  }
  for (int n=0; n<circles.size(); n++) {
    circle a = (circle) circles.get(n);
    a.decay(n);
  }
  updatePixels();
  if (mousePressed) {
    circles.add(new circle(mouseX-hs, mouseY-hs));
  }
}

void render() {
  for (int x=-hs; x<hs; x++) {
    for (int y=-hs; y<hs; y++) {
      int xx=x+hs;
      int yy=y+hs;
      float sqx =sq(x);
      if (y < sqrt(-sqx+ss) && y > -sqrt(-sqx+ss)) {
        onoff[xx][yy]=true;
      }
      else {
        onoff[xx][yy]=false;
      }
    }
  }
}
class circle {
  int x, y;
  int r, g, b, a=12;
  int addon;
  int col;

  circle( int tx, int ty) {
    x=tx;
    y=ty;
    r=250;
    b=mouseX/2>255 ? 255 : mouseX/2>0 ? mouseX/2 : 0;
    g=mouseY/2>255 ? 255 : mouseY/2>0 ? mouseY/2 : 0;
    col=(b)+(g<<8)+(r<<16)+(a<<24);

    addon=x+y*width;
  }
  void decay(int n) {
    x+=5;
    y++;
    if (x>width)
      x=0;
    if (y>height)
      y=0;
    addon=x+y*width;

    col=(b)+(g<<8)+(r<<16)+(a<<24);
    if (b>0)
      b-=1;
    if (r>2)
      r-=3;
    if (g>1)
      g-=2;
    if (b<1 && r<3) {
      circles.remove(n);
    }
  }
}



