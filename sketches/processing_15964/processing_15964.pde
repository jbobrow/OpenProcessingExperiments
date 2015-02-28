
public class Complex{
  float re = 0;
  float im = 0;
  
  
  public Complex () {
    this.re = 0;
    this.im = 0;
  }
  public Complex(float rE, float iM) {
    this.re = rE;
    this.im = iM;
  }
      
      
  public void add(Complex op) {
    this.re = (this.re + op.re);
    this.im = (this.im + op.im);
  }
  public void mult(Complex op) {
    float temp = re * op.re - im * op.im;
    im = re * op.im + im * op.re;
    re = temp;
  }
  
  
  public float norm() {
    return sqrt(this.re * this.re + this.im * this.im);
  }
}


