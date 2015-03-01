

/*

  Julia fractal generator
  Isamel Sidki Salvatierra 2014
  
  'c' change color palette
  1/2 decrease/increase maxIterations
  3/4 decrease/increase exp
  q/w decrease/increase real part of c
  a/s decrease/increase imaginary part of c

*/

int iterations, maxIterations;
int exp;
float  cReal = -0.74543, cImag = 0.11301;
boolean cMode;

Complex z, c;

void setup() {
  size(700, 700);
  colorMode(HSB, 255);
  loadPixels();
  
  maxIterations = 128;
  exp = 2;
  
  z = new Complex();
  c = new Complex();
  
}

void draw() {
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
                      //Zn = (0+0i)
      z.set(map(i, 0, width, -2, 2), map(j, 0, height, -2, 2));    //Z = (x+yi)
      c.set(cReal, cImag);
      iterations = 0;
                     
      while((z.abs() <= 2) && (iterations < maxIterations)) { 
        for(int k = 1; k < exp; k++) {
          z.mult(z);       //Zn+1 = Zn^exp
        }
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

void keyPressed() { 
  if (key == 'c') {
    cMode = !cMode;
  }
  if(key == '1') {
    maxIterations--;
    println("maxIterations = " + maxIterations);
  }
  if(key == '2') {
    maxIterations++;
    println("maxIterations = " + maxIterations);
  }
  if(key == '3') {
    exp--;
    println("exp = " + exp);
  }
  if(key == '4') {
    exp++;
    println("exp = " + exp);
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
}


/* v1.0 
   Ismael Sidki Salvatierra
   2014 */

static class Complex {
  
  float real, imag;
  
  Complex() {
        //Constructor of the complex number
  }
  
  Complex(float _real, float _imag) {
    this.real = _real;    //Constructor of the complex number
    this.imag = _imag;
  }
  
  static float real(Complex c) {
    return c.real;    //The real part of a complex number
  }
  
  static float imag(Complex c) {
    return c.imag;    //The imaginary part of a complex number
  }
  
  static void set(Complex c, float _real, float _imag) {
    c.real = _real;
    c.imag = _imag;
  }
  
  void set(float _real, float _imag) {
    this.real = _real;
    this.imag = _imag;
  }
  
//  float real() {
//    return this.real;    //The real part of this complex number
//  }
//  
//  float imag() {
//    return this.imag;    //The imaginary part of this complex number
//  }
  
  static void printC(Complex c) {
    print("(" + c.real + "+" + c.imag + "i" + ")");
  }
  
  void printC() {
    print("(" + this.real + "+" + this.imag + "i" + ")");
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
}





