
class complex {
  float r; //Real portion of a complex number
  float i; //Imaginary portion of a complex number
  
  complex(float R, float I) { //Declare the class "Complex"
    r = R;
    i = I;
  }

  void reset(float R, float I) { //Declare the class "Complex"
    r = R;
    i = I;
  }
    
  float Zabs() { //Returns the absolute value of the class
    return sqrt( sq(r) + sq(i) );
  }

  float Zangle() { //Returns the absolute value of the class
    return atan2(r,i);
  }
  
  void display() { //Displays the class' value
    println(r + " + " + i + "i");
  }
  
}

complex Zadd(complex Z, complex Y) { //Add a complex and a complex
  return new complex( Z.r + Y.r, Z.i + Y.i );
}

complex Zsub(complex Z, complex Y) { //Add a complex and a complex
  return new complex( Z.r - Y.r, Z.i - Y.i );
}

complex Zmul(complex Z, complex Y) { //Multiply a complex and a complex
  return new complex( Z.r * Y.r - Z.i * Y.i, Z.i * Y.r + Z.r * Y.i );
}

complex Zdiv(complex Z, complex Y) { //Multiply a complex and a complex
  float c = sq(Y.r) + sq(Y.i);
  return new complex( (Z.r*Y.r + Z.i*Y.i)/c, (Z.i*Y.r - Z.r*Y.i)/c );
}


