
class HyperComplex {
  float r; //Real portion of a hypercomplex number
  float i; //Imaginary portion of a hypercomplex number
  float j; //J-Imaginary portion of a hypercomplex number
  float k; //K-Imaginary portion of a hypercomplex number
  
  HyperComplex(float R, float I, float J, float K) { //Declare the class "HyperComplex"
    r = R;
    i = I;
    j = J;
    k = K;
  }

  void Set(float R, float I, float J, float K) { //Declare the class "HyperComplex"
    r = R;
    i = I;
    j = J;
    k = K;
  }
  
  float Zabs() { //Returns the absolute value of the class
    return sqrt( r * r + i * i + j * j + k * k );
  }
  
}

  HyperComplex Zadd(HyperComplex Z, HyperComplex Y) { //Add
    return new HyperComplex( Z.r + Y.r, Z.i + Y.i, Z.j + Y.j, Z.k + Y.k );
  }

  HyperComplex Zsub(HyperComplex Z, HyperComplex Y) { //Subtract
    return new HyperComplex( Z.r - Y.r, Z.i - Y.i, Z.j - Y.j, Z.k - Y.k );
  }

  HyperComplex Zmul(HyperComplex Z, HyperComplex Y) { //Multiply
    return new HyperComplex( 
    Z.r * Y.r - Z.i * Y.i - Z.j * Y.j + Z.k * Y.k, 
    Z.i * Y.r + Z.r * Y.i - Z.k * Y.j - Z.j * Y.k, 
    Z.j * Y.r + Z.r * Y.j - Z.k * Y.i - Z.k * Y.k, 
    Z.k * Y.r + Z.r * Y.k + Z.j * Y.i + Z.i * Y.j
    );
  }
  
  HyperComplex Zdiv(HyperComplex Z, HyperComplex Y) { //Divide

    float A = Y.r * Y.r - Y.i * Y.i + Y.j * Y.j - Y.k * Y.k;
    float B = 2.0 * ( Y.j * Y.k - Y.r * Y.i );

    A = ( A + B ) / ( sq(A) + sq(B) );
    
    HyperComplex temp = new HyperComplex( A * Y.r, -A * Y.i, A * Y.j, -A * Y.k );
    	
    return( Zmul(Z,Y) );
  }



