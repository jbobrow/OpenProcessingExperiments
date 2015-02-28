
public class ComplexNumber
{
  float real = 0f;
  float imaginary = 0f;
  
  public ComplexNumber(){}
  
  public ComplexNumber(float real, float imaginary)
  {
    this.real = real;
    this.imaginary = imaginary;
  }
  
  
  
  public ComplexNumber getConjugate()
  {
    return new ComplexNumber(real, -imaginary);
  }
  
  public float getModulus()
  {
    return dist(0,0,real,imaginary);
  }
  
  public float getArgument()
  {
    return atan2(imaginary, real);
  }
  
  
  
  public ComplexNumber Add(ComplexNumber cn)
  {
    return new ComplexNumber(real + cn.real, imaginary + cn.imaginary);
  }
  
  public ComplexNumber Add(float num)
  {
    return new ComplexNumber(real + num, imaginary);
  }
  
  public ComplexNumber Subtract(ComplexNumber cn)
  {
    return new ComplexNumber(real - cn.real, imaginary - cn.imaginary);
  }
  
  public ComplexNumber Subtract(float num)
  {
    return new ComplexNumber(real - num, imaginary);
  }
  
  public ComplexNumber Multiply(ComplexNumber cn)
  {
    return new ComplexNumber(real * cn.real - imaginary * cn.imaginary, real * cn.imaginary + imaginary * cn.real);
  }
  
  public ComplexNumber Multiply(float num)
  {
    return new ComplexNumber(real * num, imaginary * num);
  }
  
  public ComplexNumber Divide(ComplexNumber cn)
  {
    float divisor = cn.real * cn.real + cn.imaginary * cn.imaginary;
    return new ComplexNumber((real * cn.real + imaginary * cn.imaginary) / divisor, (imaginary * cn.real - real * cn.imaginary) / divisor);
  }
  
  public ComplexNumber Divide(float f)
  {
    return new ComplexNumber(real / f, imaginary / f);
  }
  
  public ComplexNumber Power(int power)
  {
    ComplexNumber orig = Clone();
    ComplexNumber cn = Clone();
    for(int i = 0; i < power - 1; i++)
      cn = cn.Multiply(orig);
    
    return cn;      
  }
  
  public ComplexNumber Power(float power)
  {
    float arg = power * getArgument();
    float mod = pow(getModulus(), power);
    
    return new ComplexNumber(mod * cos(arg), mod * sin(arg));
  }
  
  public ComplexNumber[] Roots(int n)
  {
    float arg = getArgument();
    float mod = getModulus();
    float mul = pow(mod, 1/(float)n);
    ComplexNumber[] cns = new ComplexNumber[n];
    
    for(int i = 0; i < n; i++)
    {
      float theta = (arg + 2*i*PI)/n;
      cns[i] = new ComplexNumber(mul * cos(theta), mul * sin(theta));
    }
    
    return cns;
  }
  
  
  
  public void DrawPoint()
  {
    point(real, imaginary);
  }
  
  
  
  public ComplexNumber Clone()
  {
    return new ComplexNumber(real, imaginary);
  }
  
  public Complex Convert()
  {
    return new Complex((double)real, (double)imaginary);
  }
  
  public String toString()
  {
    return (real + ((imaginary>=0)?"+":"-") + abs(imaginary) + "i");
  }
  
  public String toString(int format)
  {
    String ret = "";
    
    switch(format)
    {
      case ComplexFormats.Cartesian: ret = toString(); break;
      case ComplexFormats.Trigonometric: ret = toString("r(cos a + isin a)"); break;
      case ComplexFormats.Polar: ret = toString("[r,a]"); break;
      case ComplexFormats.Exponential: ret = toString("r e^ai"); break;
    }
    
    return ret;
  }
  
  public String toString(String format)
  {
    return format.replaceAll("r", Float.toString(getModulus()))
                 .replaceAll("a", Float.toString(getArgument()))
                 .replaceAll("x", Float.toString(real))
                 .replaceAll("y", Float.toString(imaginary));    
  }
}

public static final class ComplexFormats
{
  public static final int Cartesian = 0;
  public static final int Trigonometric = 1;
  public static final int Polar = 2;
  public static final int Exponential = 3;
}

