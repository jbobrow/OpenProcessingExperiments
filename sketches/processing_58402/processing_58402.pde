

//John Carmack hack, converted to Java.
float InvSqrt(float n)
{
  if (n < 11043908100L) {
    int i;
    float x2, y;

    x2 = n * 0.5F;
    y = n;
    i = Float.floatToRawIntBits(y);
    // using the magic number from 
    // http://www.lomont.org/Math/Papers/2003/InvSqrt.pdf
    i = 0x5f375a86 - (i >> 1);
    y = Float.intBitsToFloat(i);
    y = y * (1.5 - (x2 * y * y));
    y = y * (1.5 - (x2 * y * y)); //Newton iteration, more accurate

    float sqrt = Math.round(1.0 / y);

    return sqrt;
  } 
  else {
    //Carmack hack gives incorrect answer for n >= 11043908100.
    float sqrt = (float) sqrt(n);
    return sqrt;
  }
}


