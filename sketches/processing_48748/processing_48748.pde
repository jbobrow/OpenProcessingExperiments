
public class Boxes {
  public final int w,h;
  public final int sz;
  public final int xo,yo;
  public int[][] b;
  public int lastx, lasty;

  public Boxes( int wd, int hh ) {
    w = wd;
    h = hh;
    int wsz = width*4/(5*w);
    int hsz = height*4/(5*h);
    wsz = wsz < hsz ? wsz : hsz;
    sz = wsz < 2 ? 2 : wsz;
    xo = (width-(w*sz))>>1;
    yo = (height-(h*sz))>>1;
    b = new int[w][h];
  } 
 
  public void scroll(int x, int y) {
    x-=xo;
    y-=yo;
    x/=sz;
    y/=sz;
    if(lastx==x)
      if(lasty==y)
        return;
    if(lastx >= 0 && lastx < w && lasty >= 0 && lasty < h) {
             fill(0,0,0,255);
             stroke(0,0,0,255);
             rect(xo+lastx*sz,yo+lasty*sz,sz,sz);
       int bxy = b[lastx][lasty];
      if(bxy>0) {
             fill(bxy,255,255,255);
             stroke(bxy,200,200,200);
             rect(xo+lastx*sz,yo+lasty*sz,sz,sz);
      }
    }
    lastx=x;
    lasty=y;
    if(x >= 0 && x < w && y >= 0 && y < h) {
             fill(0,0,0,255);
             stroke(0,0,0,255);
             rect(xo+x*sz,yo+y*sz,sz,sz);
             fill(200,255,255,255);
             stroke(200,200,200,200);
             rect(xo+x*sz,yo+y*sz,sz,sz);
    }
  } 
  
  public void draw() {
      int i = w;
      while(--i >= 0) {
        int j = h;
        while(--j >= 0) {
          int bij = b[i][j];
          if(bij>0) {
             fill(bij,255,255,255);
             stroke(bij,200,200,200);
             rect(xo+i*sz,yo+j*sz,sz,sz);
          }
          else {
             fill(0,0,0,255);
             stroke(0,0,0,255);
             rect(xo+i*sz,yo+j*sz,sz,sz);
          }
        }  
      }
  }
  
}

