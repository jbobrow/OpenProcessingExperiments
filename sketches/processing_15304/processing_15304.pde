
/* 
  Draw julia set according to following equations:
  f(z) = z^2 + c, c is a complex number
  f(x,y) = x^2 - y^2 + p, 2xy + q
  c = p + qi
*/


boolean needRedraw = true;
boolean colormap = false;

// Complex parameter 'c'
float p = -0.687;
float q = 0.312;

// Boundaries of plane
float xmin = -1.5;
float xmax = 1.5;
float ymin = -1.0;
float ymax = 1.0;

// Screen size
int w = 500;
int h = 500;

// Iterations
float iter = 256;

// Color multipliers
float dr = 1.0;
float dg = 1.0;
float db = 1.0;


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
void julia() 
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
      int k = 0;
      int r = 0;
      
      while(r <= iter && k <= iter) {
        xc = (x+y)*(x-y) + p;
        yc = 2.0*x*y + q;
        r = int(xc*xc + yc*yc);
        k++;
        
        if(r >= iter) {
          int c = 30+k;
          if(colormap)
            pixels[i] = mapColor(c);
          else
            pixels[i] = color(int(dr*(float)c),int(dg*(float)c),int(db*(float)c));
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
    julia();
    needRedraw = false;
  }
}

void keyPressed() {
  if(key == CODED) {
    // Adjust zoom
    if(keyCode == UP){
      xmax -= 0.1;
      xmin += 0.1;
      needRedraw = true;
    }
    else if(keyCode == DOWN){
      xmax += 0.1;
      xmin -= 0.1;
      needRedraw = true;
    }
    else if(keyCode == RIGHT){
      ymax -= 0.1;
      ymin += 0.1;
      needRedraw = true;
    }
    else if(keyCode == LEFT){
      ymax += 0.1;
      ymin -= 0.1;
      needRedraw = true;
    }
  }
  // Adjust complex factor
  else if(key == 'P') {
    p += .01;
    needRedraw = true;
  }
  else if(key == 'p') {
    p -= .01;
    needRedraw = true;
  }
  else if(key == 'Q') {
    q += .01;
    needRedraw = true;
  }
  else if(key == 'q') {
    q -= .01;
    needRedraw = true;
  }
  // Adjust color
  else if(key == 'R') {
    dr += .1;
    if(dr > 1.0)
      dr = 1.0;
    needRedraw = true;
  }
  else if(key == 'r') {
    dr -= .1;
      if(dr < 0.0)
        dr = 0.0;
    needRedraw = true;
  }
  else if(key == 'G') {
    dg += .1;
    if(dg > 1.0)
      dg = 1.0;
    needRedraw = true;
  }
  else if(key == 'g') {
    dg -= .1;
    if(dg < 0.0)
      dg = 0.0;
    needRedraw = true;
  }
  else if(key == 'B') {
    db += .1;
    if(db > 1.0)
      db = 1.0;
    needRedraw = true;
  }
  else if(key == 'b') {
    db -= .1;
    if(db < 0.0)
      db = 0.0;
    needRedraw = true;
  }
  // Toggle color gradient
  else if(key == 'm' || key == 'M') {
    colormap = !colormap;
    needRedraw = true;
  }
  redraw();
}

