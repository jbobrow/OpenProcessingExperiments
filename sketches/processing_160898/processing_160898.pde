
/*

  Fractal generator
  Ismael Sidki Salvatierra 2014
  
  'c' change color palette
  'f' change Mandelbrot/Julia
  'r' random fractal
  1/2 decrease/increase maxIterations
  q/w decrease/increase real part of c
  a/s decrease/increase imaginary part of c
  arrow keys explore fractal
  +/- zoom in/out

*/

int iterations, maxIterations;
float  cReal = -0.74543, cImag = 0.11301;
float x0 = -2, y0 = -2, w = 4, h = 4;
boolean cMode, redrawFractal, fMode = false;

Complex z, c;

void setup() {
  size(480, 480);
  colorMode(HSB, 255);
  
  noFill();
  stroke(0, 0, 255);
  strokeWeight(2);
  
  maxIterations = 128;
  
  z = new Complex();
  c = new Complex();
  
  redrawFractal = true;
}

void drawJulia() {
  loadPixels();
  
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      
      z.set(map(i, 0, width, x0, x0+w), map(j, 0, height, y0, y0+h));    //Z = (x+yi)
      c.set(cReal, cImag);
      iterations = 0;
                     
      while((z.abs() <= 2) && (iterations < maxIterations)) { 
        z.pow(2);          //Zn+1 = Zn^2
        z.add(c);          //Zn+1 = Zn^2 + C
        
        iterations++;
      }
      
      if(cMode) {
        pixels[int(j*width + i)] = color(84, 255, map(iterations, 0, maxIterations, 0, 255));
      } else {
        if(iterations == maxIterations) {
          pixels[int(j*width + i)] = color(0);
        } else {
          pixels[int(j*width + i)] = color(iterations*16%256, 255, 255);
        }
      }
    }
  }
  
  updatePixels();
}

void drawMandelbrot() {
  loadPixels();
  
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      
      z.set(cReal, cImag);    //Z = (0+0i)
      c.set(map(i, 0, width, x0, x0+w), map(j, 0, height, y0, y0+h));
      iterations = 0;
                     
      while((z.abs() <= 2) && (iterations < maxIterations)) { 
        z.pow(2);          //Zn+1 = Zn^2
        z.add(c);          //Zn+1 = Zn^2 + C
        
        iterations++;
      }
      
      if(cMode) {
        pixels[int(j*width + i)] = color(84, 255, map(iterations, 0, maxIterations, 0, 255));
      } else {
        if(iterations == maxIterations) {
          pixels[int(j*width + i)] = color(0);
        } else {
          pixels[int(j*width + i)] = color(iterations*16%256, 255, 255);
        }
      }
    }
  }
  
  updatePixels();
}

void draw() {
  if(redrawFractal) {
    redrawFractal = false;
    if(fMode) {
      drawMandelbrot();
    } else {
      drawJulia();
    }
  }
  
  line(width/2-3, height/2, width/2+3, height/2);
  line(width/2, height/2-3, width/2, height/2+3);
}

void keyPressed() { 
  if (key == 'c') {
    cMode = !cMode;
  }
  if (key == 'f') {
    if(fMode) {
      cReal = -0.74543;
      cImag = 0.11301;
      fMode = false;
    } else {
      cReal = 0;
      cImag = 0;
      fMode = true;
    }
  }
  if (key == 'r') {
    cReal = random(-1, 1);
    cImag = random(-1, 1);
    println("random c = " + cReal + ", " + cImag + "i");
  } 
  if(key == '1') {
    maxIterations--;
    println("maxIterations = " + maxIterations);
  }
  if(key == '2') {
    maxIterations++;
    println("maxIterations = " + maxIterations);
  }
  if(key == 'q') {
    cReal+=0.001;
    println("c = " + cReal + ", " + cImag + "i");
  }
  if(key == 'w') {
    cReal-=0.001;
    println("c = " + cReal + ", " + cImag + "i");
  }
  if(key == 'a') {
    cImag+=0.001;
    println("c = " + cReal + ", " + cImag + "i");
  }
  if(key == 's') {
    cImag-=0.001;
    println("c = " + cReal + ", " + cImag + "i");
  }
  if(key == '+') {
    x0 += w/4;
    y0 += h/4;
    w /= 2;
    h /= 2;
    
    println("zoom in: xi=" + x0 + ", yi=" + y0 + ", w=" + w + ", h=" + h);
  }
  if(key == '-') {
    x0 -= w/2;
    y0 -= h/2;
    w *= 2;
    h *= 2;
    
    println("zoom in: xi=" + x0 + ", yi=" + y0 + ", w=" + w + ", h=" + h);
  }
  if(key == CODED) {
    switch(keyCode) {
      case UP: y0 -= h/20;  break;
      case DOWN: y0 += h/20;  break;
      case LEFT: x0 -= w/20;  break;
      case RIGHT: x0 += w/20;  break;
    }
  }
}

void keyReleased() {
  redrawFractal = true;
}



/* v2.0 
   Ismael Sidki Salvatierra
   2014 */

static class Complex {
  
  float real, imag;
  
  Complex() {
    
  }
  
  Complex(float _real, float _imag) {
    this.real = _real;
    this.imag = _imag;
  }
  
  static void set(Complex c, float _real, float _imag) {
    c.real = _real;
    c.imag = _imag;
  }
  
  void set(float _real, float _imag) {
    this.real = _real;
    this.imag = _imag;
  }
  
  static void printC(Complex c) {
    print("(" + c.real + ", " + c.imag + "i" + ")");
  }
  
  void printC() {
    print("(" + this.real + ", " + this.imag + "i" + ")");
  }
  
  static Complex add(Complex c1, Complex c2) {
    return new Complex(c1.real+c2.real, c1.imag+c2.imag);
  }
  
  void add(Complex c) {
    this.real += c.real;
    this.imag += c.imag;
  }
  
  static Complex scale(Complex c, float r) {
    return new Complex(r*c.real, r*c.imag);
  }
  
  void scale(float r) {
    this.real *= r;
    this.imag *= r;
  }
  
  static Complex mult(Complex c1, Complex c2) {
    float a = c1.real;
    float b = c1.imag;
    float c = c2.real;
    float d = c2.imag;
    
    return new Complex(a*c - b*d, a*d + b*c);
  }
  
  void mult(Complex c1) {
    float a = this.real;
    float b = this.imag;
    float c = c1.real;
    float d = c1.imag;
    
    this.real = a*c - b*d;
    this.imag = a*d + b*c;
  }
  
  static boolean equals(Complex c1, Complex c2) {
    if((c1.real == c2.real) && (c1.imag == c2.imag)) {
      return true;
    }
    return false;
  }
  
  boolean equals(Complex c) {
    if((this.real == c.real) && (this.imag == c.imag)) {
      return true;
    }
    return false;
  }
  
  static Complex sub(Complex c1, Complex c2) {
    return new Complex(c1.real - c2.real, c1.imag - c2.imag);
  }
  
  void sub(Complex c) {
    this.real -= c.real;
    this.imag -= c.imag;
  }
  
  static Complex div(Complex c1, Complex c2) {
    float a = c1.real;
    float b = c1.imag;
    float c = c2.real;
    float d = c2.imag;
    
    float re = (a*c + b*d) / (c*c + d*d);
    float im = (b*c - a*d) / (c*c + d*d);
    
    return new Complex(re, im);
  }
  
  void div(Complex c1) {
    float a = this.real;
    float b = this.imag;
    float c = c1.real;
    float d = c1.imag;
    
    float re = (a*c + b*d) / (c*c + d*d);
    float im = (b*c - a*d) / (c*c + d*d);
    
    this.real = re;
    this.imag = im;
  }
  
  static float abs(Complex c) {
    return sqrt(c.real*c.real + c.imag*c.imag);
  }
  
  float abs() {
    return sqrt(this.real*this.real + this.imag*this.imag);
  }
  
  static Complex pow(Complex c, int n) {
    Complex x = c;
    
    for(int i = 1; i < n; i++) {
      c.mult(x);
    }
    return c;
  }
  
  void pow(int n) {
    Complex x = this;
    
    for(int i = 1; i < n; i++) {
      this.mult(x);
    }
  }
}





