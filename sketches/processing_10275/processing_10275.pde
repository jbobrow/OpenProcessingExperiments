
class Blob {
  float x,y;
  float vx,vy; 
  int[] bx,by;
  
  Blob(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.bx = new int[w];
    this.by = new int[h];
  }
  
  void update() {
    x+=vx;
    y+=vy;
    
    if (x<0 || x>w) vx=-vx;
    if (y<0 || y>h) vy=-vy;
    
    for (int i=0; i<w; i++) bx[i] = int(sq(x-i));
    for (int i=0; i<h; i++) by[i] = int(sq(y-i)); 
  }
}

