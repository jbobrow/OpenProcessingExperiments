
class HDRPixels {
  // 0xHHHCCFFF
  // H = bits for filters to do multiplication etc. in. 
  // C = effective color value (when reduced to 8 bit and with factor 1)
  // F = bits to represent fractions
  int[] p;
  int w, h;
  int factor; //by how much the value in the array should be divided in toPix
  static final int dt = 3; // RGB: 3, ARGB: 4
  //boolean noAlpha; //RGB or ARGB?

  HDRPixels() {
    //noAlpha = true;
    //dt = 3;
    w = width;
    h = height;
    factor = 1;
    p = new int[width*height*dt];
    Arrays.fill(p, 0);
  }

  HDRPixels(int _w, int _h) {
    //noAlpha = true;
    //dt = 3;
    w = _w;
    h = _h;
    p = new int[w*h*dt];
    Arrays.fill(p, 0);
  }

  HDRPixels(int[] s, int _w, int _h) {
    //noAlpha = true;
    //dt = 3;
    w = _w;
    h = _h;
    p = new int[w*h*dt];
    set(s);
  }

  int[] render() {
    int[] retPix = new int[w*h];
    int idx;
    if (factor == 1) {
      for (int i = 0; i < w*h; ++i) {
        idx = dt*i;
        retPix[i] = 0xFF000000 + 
          ( (p[idx  ] >>> 12) & 0x00FF0000) + 
          ( (p[idx+1] >>> 12) & 0x0000FF00) + 
          ( (p[idx+2] >>> 12) & 0x000000FF);
      }
    } 
    else if (factor > 1) {
      for (int i = 0; i < w*h; ++i) {
        idx = dt*i;
        retPix[i] = 0xFF000000 + 
          ( ( (p[idx  ] / factor) >>> 12) & 0x00FF0000) + 
          ( ( (p[idx+1] / factor) >>> 12) & 0x0000FF00) + 
          ( ( (p[idx+2] / factor) >>> 12) & 0x000000FF);
      }
    }
    return retPix;
  }

  void render(int[] tPix) {
    if (tPix.length != w*h) {
      println("length doesn't match!");
      return;
    }
    int idx;
    if (factor == 1) {
      for (int i = 0; i < w*h; ++i) {
        idx = dt*i;
        tPix[i] = 0xFF000000 + 
          (( (p[idx  ] >>> 12) << 16)& 0x00FF0000) + 
          (( (p[idx+1] >>> 12) <<  8)& 0x0000FF00) + 
          ( (p[idx+2] >>> 12) & 0x000000FF);
      }
    } 
    else if (factor > 1) {
      for (int i = 0; i < w*h; ++i) {
        idx = dt*i;
        tPix[i] = 0xFF000000 + 
          ( (( (p[idx  ] / factor) >>> 12) << 16)& 0x00FF0000) + 
          ( (( (p[idx+1] / factor) >>> 12) << 8)& 0x0000FF00) + 
          ( ( (p[idx+2] / factor) >>> 12) & 0x000000FF);
      }
    }
  }

  // sets HDR field to array of pixels, sets factor to 1
  void set(int[] s) {
    if (s.length != w*h) {
      println("Warning: given dimensions (w: " + w + " h: " + h + ") do not match array length (" + s.length + ")");
    }
    int k = min(w*h, s.length);
    for (int i = 0; i < k; ++i) {
      p[i*3]     = (s[i] & 0x00FF0000) >>  4;
      p[i*3 + 1] = (s[i] & 0x0000FF00) <<  4;
      p[i*3 + 2] = (s[i] & 0x000000FF) << 12;
    }
    factor = 1;
  }

  // adds an array to the HDR field, increases factor by one
  void add(int[] s) {
    if (s.length != w*h) {
      println("Warning: given dimensions (w: " + w + " h: " + h + ") do not match array length (" + s.length + ")");
    }
    int k = min(w*h, s.length);
    for (int i = 0; i < k; ++i) {
      p[i*3]     += (s[i] & 0x00FF0000) >>  4;
      p[i*3 + 1] += (s[i] & 0x0000FF00) <<  4;
      p[i*3 + 2] += (s[i] & 0x000000FF) << 12;
    }
    factor++;
  }

  // subtracts an array of pixels from the HDR field, decreases factor by one (min 1)
  void sub(int[] s) {
    if (s.length != w*h) {
      println("Warning: given dimensions (w: " + w + " h: " + h + ") do not match array length (" + s.length + ")");
    }
    int k = min(w*h, s.length);
    for (int i = 0; i < k; ++i) {
      p[i*3]     = max(0, p[i*3]     - ((s[i] & 0x00FF0000) >>  4));
      p[i*3 + 1] = max(0, p[i*3 + 1] - ((s[i] & 0x0000FF00) <<  4));
      p[i*3 + 2] = max(0, p[i*3 + 2] - ((s[i] & 0x000000FF) << 12));
    }
    factor = max(1, factor-1);
  }

  // divides all pixels by factor, sets factor to 1
  void normPix() {
    for (int i = 0; i < p.length; ++i) {
      p[i] /= factor;
    }
    factor = 1;
  }

  void mul(int f) {
    for (int i = 0; i < p.length; ++i) {
      p[i] *= f;
    }
    factor *= f;
  }
  
  void rshift(int s){
    for (int i = 0; i < p.length; ++i){
      p[i] = p[i] >> s;
    }
    factor = max(1, factor >> s);
  }
  
  void lshift(int s){
    for (int i = 0; i < p.length; ++i){
      p[i] = p[i] << s;
    }
    factor = factor << s;
  }
}


