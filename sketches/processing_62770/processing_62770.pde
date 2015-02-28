
/*Complex.pde
 *Lilly Geiger
 *Created June 2, 2011
*/
static class Complex
{
  float re;
  float im;
  Complex (float r_x, float k_i){
    re = r_x;
    im = k_i;
  }
  
  String toString(){
    return re + " + " + im + "i";
  }
  
  static Complex sum(Complex lhs, Complex rhs){
    return new Complex(lhs.re + rhs.re, lhs.im + rhs.im);
  }
  
  static Complex mul(Complex lhs, Complex rhs){
    Complex temp = new Complex(0, 0);
    //complex a, b;
    // a * b
    // a is the left hand side of the operation
    // b is the right hand side of the operation
    //(lhs.re + lhs.im)*(rhs.re + rhs.im)
    // lhs.re*rhs.re + lhs.re*rhs.im + lhs.im*rhs.re + lhs.im*rhs.im
  
    temp.re = lhs.re*rhs.re + lhs.im*rhs.im*-1; //*-1 for i*i
    temp.im = lhs.re*rhs.im + lhs.im*rhs.re;
    return temp;
  }
  
  static Complex mul(float lhs, Complex rhs){
    return new Complex(lhs*rhs.re, lhs*rhs.im);
  }
  
  static Complex mul(Complex lhs, float rhs){
    return new Complex(lhs.re*rhs, lhs.im*rhs);
  }
  
  static Complex pow(Complex c, int n){
    Complex accumulator = new Complex(c.re,c.im);
    for(int i = 1; i < n; i++)
      accumulator = mul(accumulator,c);
    return accumulator;
  }
}


