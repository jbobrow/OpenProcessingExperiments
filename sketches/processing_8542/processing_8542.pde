
class hyperComplex {
  float r; //Real portion of a hypercomplex number
  float i; //Imaginary portion of a hypercomplex number
  float j; //J-Imaginary portion of a hypercomplex number
  float k; //K-Imaginary portion of a hypercomplex number
  
  hyperComplex(float R, float I, float J, float K) { //Declare the class "hyperComplex"
    r = R;
    i = I;
    j = J;
    k = K;
  }

  void Set(float R, float I, float J, float K) { //Declare the class "hyperComplex"
    r = R;
    i = I;
    j = J;
    k = K;
  }
  
  float Zabs() { //Returns the absolute value of the class
    return sqrt( r * r + i * i + j * j + k * k );
  }
  
}

  hyperComplex Zadd(hyperComplex Z, hyperComplex Y) { //Add
    return new hyperComplex( Z.r + Y.r, Z.i + Y.i, Z.j + Y.j, Z.k + Y.k );
  }

  hyperComplex Zsub(hyperComplex Z, hyperComplex Y) { //Subtract
    return new hyperComplex( Z.r - Y.r, Z.i - Y.i, Z.j - Y.j, Z.k - Y.k );
  }

  hyperComplex Zmul(hyperComplex Z, hyperComplex Y) { //Multiply
    return new hyperComplex( 
    Z.r * Y.r - Z.i * Y.i - Z.j * Y.j + Z.k * Y.k, 
    Z.i * Y.r + Z.r * Y.i - Z.k * Y.j - Z.j * Y.k, 
    Z.j * Y.r + Z.r * Y.j - Z.k * Y.i - Z.k * Y.k, 
    Z.k * Y.r + Z.r * Y.k + Z.j * Y.i + Z.i * Y.j
    );
  }
  


