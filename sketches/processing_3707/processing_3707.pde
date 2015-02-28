
class HyperComplex { 
  float r; //Real portion of a hypercomplex number 
  float i; //Imaginary portion of a hypercomplex number 
  float j; //J-Imaginary portion of a hypercomplex number 
  float k; //K-Imaginary portion of a hypercomplex number 
   
  HyperComplex(float R, float I, float J, float K) { //Declare the class "Complex" 
    r = R; 
    i = I; 
    j = J; 
    k = K; 
  } 
 
  void Set(float R, float I, float J, float K) { //Declare the class "Complex" 
    r = R; 
    i = I; 
    j = J; 
    k = K; 
  } 
   
  HyperComplex Zadd(HyperComplex Z, HyperComplex Y) { //Add a complex and a complex 
    return new HyperComplex( Z.r + Y.r, Z.i + Y.i, Z.j + Y.j, Z.k + Y.k ); 
  } 
 
  HyperComplex Zsub(HyperComplex Z, HyperComplex Y) { //Add a complex and a complex 
    return new HyperComplex( Z.r - Y.r, Z.i - Y.i, Z.j - Y.j, Z.k - Y.k ); 
  } 
 
  HyperComplex Zmul(HyperComplex Z, HyperComplex Y) { //Multiply a complex and a complex 
    return new HyperComplex(  
    Z.r * Y.r - Z.i * Y.i - Z.j * Y.j + Z.k * Y.k,  
    Z.i * Y.r + Z.r * Y.i - Z.k * Y.j - Z.j * Y.k,  
    Z.j * Y.r + Z.r * Y.j - Z.k * Y.i - Z.k * Y.k,  
    Z.k * Y.r + Z.r * Y.k + Z.j * Y.i + Z.i * Y.j 
    ); 
  } 
   
  float Zabs() { //Returns the absolute value of the class 
    return sqrt( r * r + i * i + j * j + k * k ); 
  } 
   
  float Zangle() { //Identifies the quadrant to return the angle 
                   //of a complex number 
    float theta; 
    if(r == 0) { 
      if(i > 0) { 
        theta = HALF_PI; 
      } 
      else if(i < 0) { 
        theta = 3*HALF_PI; 
      } 
      else { 
        theta = 0; 
      } 
    } 
    else { 
      theta = atan( i / r ); 
      if(( r < 0 ) && ( i >= 0 )) { theta += PI; } 
      if(( r < 0 ) && ( i < 0 )) { theta -= PI; } 
    } 
    return theta; 
  } 
   
  void display() { //Displays the class' value 
    println(r + " + " + i + "i = " +  
            Zabs() + " * e^(" + Zangle() + "i)"); 
  } 
   
} 


