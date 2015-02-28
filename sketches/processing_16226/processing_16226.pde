

boolean needRedraw = true;

// Boundaries of plane
float xmin = -1.5;
float xmax = 1.5;
float ymin = -1.0;
float ymax = 1.0;
float zoom = 1.0;

// Screen size
int w = 500;
int h = 500;

// Iterations
float iter = 256;

// Maps wavelength to rgb (crudely)
color mapColor(int w) {
  int r, g, b;
  if(w >= 0 && w < 38) {
    r = int(255.0 * (38.0 - w) / 38.0);
    g = 0;
    b = 255;
  }
  else if(w >= 38 && w < 70) {
    r = 0;
    g = int(255.0 * (w - 38.0) / 32.0);
    b = 255;
  }
  else if(w >= 70 && w < 83) {
    r = 0;
    g = 255;
    b = int(255.0 * (83.0 - w) / 13.0);
  }
  else if(w >= 83 && w < 128) {
    r = int(255.0 * (w - 83.0) / 35.0);
    g = 255;
    b = 0;
  }
  else if(w >= 128 && w < 170) {
    r = 255;
    g = int(255.0 * (170.0 - w) / 42.0);
    b = 0;
  }
  else if(w >= 170 && w <= 256){
    r = 255;
    g = 0;
    b = 0;
  }
  else {
    r = g = b = 0;
  }
  return color(r,g,b);
}

// Generates the fractal
void fractal() 
{
  float dx = (xmax - xmin) / (float)(w);
  float dy = (ymax - ymin) / (float)(h);
  
  float xc = 0;
  float yc = 0;
  
  int i = 0;
  loadPixels();
  
  for(int px = 0; px < w; px++) {
    float x0 = xmin + dx*(float)px;
    
    for(int py = 0; py < h; py++) {
      float y0 = ymin + dy*(float)py; 
      float x = x0;
      float y = y0;
      float p = x0 - 0.5*(exp(-1.0*y)*sin(x) - exp(y)*sin(-1.0*x));
      float q = y0 - 0.5*(exp(y)*cos(-1.0*x) - exp(-1.0*y)*cos(x));
      int k = 0;
      int r = 0;
      
      while(r <= iter && k <= iter) {
        float denom = x*x + y*y;
        p = x0 - x + (p*x + q*y)/denom;
        q = y0 - y + (q*x - p*y)/denom;
        xc = x*x0 - y*y0 + (p*x + q*y)/denom;
        yc = x*y0 + x0*y + (q*x - p*y)/denom;
        
        r = int(xc*xc + yc*yc);
        k++;
        
        if(r >= iter) {
          int c = 30+k;
          pixels[i] = mapColor(c);
        }
        
        if(k == iter) {
          pixels[i] = color(0, 0, 0);
        }
        
        x = xc;
        y = yc;
      }
      i++;
    }
  }
  
  updatePixels();
}

void setup() {
  size(w, h);
}

void draw() {
  if(needRedraw) {
    fractal();
    needRedraw = false;
  }
}

