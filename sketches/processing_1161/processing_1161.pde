
public class ImgProc {
  
void ImgProc() {
}
  
void drawPixelArray(int[] src, int dx, int dy, int w, int h) {  
  //backBuf.loadPixels();
  //arraycopy(src, backBuf.pixels);
  //backBuf.updatePixels();
  //image(backBuf, dx, dy);
  loadPixels();
  int x;
  int y;
  for(int i=0; i<w*h; i++) {
    x = dx + i % w;
    y = dy + i / w;
    pixels[x  + y * w] = src[i];
  }
  updatePixels();
}

void blur(int[] src, int[] dst, int w, int h) {
  int c;
  for(int y=1; y<h-1; y++) {
    for(int x=1; x<w-1; x++) {
      c = src[(x)+(y)*w];
      c += src[(x-1)+(y-1)*w];
      c += src[(x  )+(y-1)*w];      
      c += src[(x+1)+(y-1)*w];      
      c += src[(x-1)+(y  )*w];   
      c += src[(x+1)+(y  )*w];      
      c += src[(x-1)+(y+1)*w];
      c += src[(x  )+(y+1)*w];      
      c += src[(x+1)+(y+1)*w];      
      c /= 9;
      dst[(x)+(y)*w] = c;
    }
  }
}

//you must be in HSB colorModel
void scaleBrightness(int[] src, int[] dst, int w, int h, float s) {
  int ch;
  int cs;
  int cb;
  int c;
  for(int y=0; y<h; y++) {
    for(int x=0; x<w; x++) {
      c = src[x + y*w];
      ch = (int)(s * ((c >> 16) & 0xFF));
      cs = (int)(s *((c >> 8) & 0xFF));
      cb = (int)(s *((c) & 0xFF));

      dst[x + y*w] = 0xFF000000 | (ch << 16) | (cs << 8) | cb;
      //ch = hue(c);
      //cs = saturation(c);
      //cb = brightness(c) * s;
      //dst[x + y*w] = color(ch, cs, cb);
      //dst[x + y*w] = src[x + y*w];
    }
  }
}

}

