
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
    if(x >= 0 && x < w && y >= 0 && y < h) {
      b[x][y] += 3; 
      if(b[x][y] > 360)
        b[x][y] = 1;
    }
  } 
  
  public void draw() {
      int i = w;
      while(--i >= 0) {
        int j = h;
        while(--j >= 0) {
          if(b[i][j]>0) {
             int bij = b[i][j]; 
             fill(bij,255,255,255);
             stroke(bij,200,200,100);
             rect(xo+i*sz,yo+j*sz,sz,sz);
          }
        }  
      }
  }
  
  
  
}

