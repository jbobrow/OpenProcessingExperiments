
/**
 Class ImgProc
   This class is from "Noise Particle 06" by Marcin Ignac, Thanks.
    => http://www.openprocessing.org/visuals/?visualID=1163
*/
class ImgProc {
  
  void ImgProc() {
  }
  
  void drawPixelArray(int[] src, int dx, int dy, int w, int h) {

    loadPixels();
    int x;
    int y;
    
    for(int i=0; i<w * h; i++) {
      x = dx + i % w;
      y = dy + i / w;
      pixels[x + y * w] = src[i];
    }
    updatePixels();
  }
  
  // Blur effects.
  void blur(int[] src, int[] dst, int w, int h) {
    
    int c;     
    int r, g, b;
    
    for(int y=1; y < h - 1; y++) {
      for(int x=1; x < w - 1; x++) {
        
        r = 0;
        g = 0;
        b = 0;
        
        for(int yb=-1; yb<=1; yb++) {
          for(int xb=-1; xb<=1; xb++) {
            c = src[(x + xb) + (y - yb) * w];
            r += (c >> 16) & 0xFF;
            g += (c >> 8) & 0xFF;
            b += (c) & 0xFF;
          }
        }
        
        r /= 9;
        g /= 9;
        b /= 9;
        dst[x + y * w] = 0xff000000 | (r << 16) | (g << 8) | b;
      }
    }
  }
  
  // Scale Brightness effects.
  void scaleBrightness(int[] src, int[] dst, int w, int h, float s) {
    
    int r, g, b;
    int c;
    int a;
    float as = s;
    
    s = 1.0;
    for(int y=0; y<h; y++) {
      for(int x=0; x<w; x++) {
        
        c = src[x + y * w];
        a = (int)(as * ((c >> 24) & 0xFF));
        r = (int)(s * ((c >> 16) & 0xFF)); 
        g = (int)(s * ((c >> 8) & 0xFF)); 
        b = (int)(s * ((c) & 0xFF));       
        dst[x + y * w] = (a << 24) | (r << 16) | (g << 8) | b; 
        
      }
    }
  }
}



