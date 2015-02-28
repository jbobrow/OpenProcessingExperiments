
int halfw, halfh, style;
float xrat, yrat, xoff, yoff, inc, n, h, s, b;
 
void setup() {
  size(500, 500);
  colorMode(HSB, 1.0);
  halfw = width/2;
  halfh = height/2;
  style = 0;
}

void draw() {
  xrat = (float) mouseX/width; yrat = (float) mouseY/height;
  xoff = 0;//yoff = 0;
  inc = xrat*0.1;
  float time = frameCount*0.03;
  loadPixels();
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      n = noise(xoff, yoff, time);
      switch (style) {
        case 0 : h = 0.5+0.5*(sin(n*TWO_PI+6*radians(frameCount)+((j)*0.05))); break;
        case 1 : h = 0.5+0.5*(sin(n*TWO_PI+6*radians(frameCount))*sin(n*TWO_PI+j*0.05)); break;
        case 2 : h = 0.7+0.3*sin(n*TWO_PI-6*radians(frameCount)+yrat*PI*sin(n*TWO_PI)*sin(0.03*dist(i, j, halfw, halfh))); break;
        case 3 : h = 0.5+0.5*sin(n*TWO_PI-6*radians(frameCount)+PI*sin(0.1*yrat*dist(i, j, halfw, halfh))); break;
        case 4 : h = 0.5+0.5*sin(n*TWO_PI-3*radians(frameCount)+atan2(j-halfh, i-halfw)+0.4*yrat*dist(i, j, halfw, halfh)); break;
      }
      s = 1-n/3;
      b = 1-h*h;
      pixels[i+j*width] = color(h, s, b, 0.3);
      yoff += inc;
    }
    yoff = 0; xoff += inc;
  }
  updatePixels();
}

void mouseReleased() {
    style = ++style % 5;
}

