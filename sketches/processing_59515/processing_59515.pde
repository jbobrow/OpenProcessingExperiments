
class Pixel
{
  int x, y;
  double z;
  int m;
  double[] a;
  double[] distances;
  
  Pixel(int x, int y, int m, double A, double k)
  {
    this.x = x;
    this.y = y;
    this.m = m;
    int nrDist = 2*m*m + 2*m + 1;
    this.distances = new double[nrDist];
    this.a = new double[nrDist];
    calculateDistance(A, k);
  }
  
  void calculateDistance(double A, double kk)
  {
    int k = 0;
    for(int i = 0; i <= this.m; i++)
    {
      for (int j = i; j >= i-floor(i/2); j--)
      {
        double w1 = j*width;
        double h1 = (i-j)*height;
        double w2 = (i-j)*width;
        double h2 = j*height;
        if (i == 0)
        {
          this.distances[k++] = Math.sqrt(this.x*this.x+this.y*this.y) - kk;
        }
        else if (j == i)
        {
          this.distances[k++] = Math.sqrt((w1+this.x)*(w1+this.x) + (this.y)*(this.y)) - kk;
          this.distances[k++] = Math.sqrt((w1-this.x)*(w1-this.x) + (this.y)*(this.y)) - kk;
          this.distances[k++] = Math.sqrt((this.x)*(this.x) + (h2+this.y)*(h2+this.y)) - kk;
          this.distances[k++] = Math.sqrt((this.x)*(this.x) + (h2-this.y)*(h2-this.y)) - kk;
        }  
        else
        {
          this.distances[k++] = Math.sqrt((w1+this.x)*(w1+this.x) + (h1+this.y)*(h1+this.y)) - kk;
          this.distances[k++] = Math.sqrt((w1-this.x)*(w1-this.x) + (h1+this.y)*(h1+this.y)) - kk;
          this.distances[k++] = Math.sqrt((w1+this.x)*(w1+this.x) + (h1-this.y)*(h1-this.y)) - kk;
          this.distances[k++] = Math.sqrt((w1-this.x)*(w1-this.x) + (h1-this.y)*(h1-this.y)) - kk;
          if (j != i-j)
          {
            this.distances[k++] = Math.sqrt((w2+this.x)*(w2+this.x) + (h2+this.y)*(h2+this.y)) - kk;
            this.distances[k++] = Math.sqrt((w2-this.x)*(w2-this.x) + (h2+this.y)*(h2+this.y)) - kk;
            this.distances[k++] = Math.sqrt((w2+this.x)*(w2+this.x) + (h2-this.y)*(h2-this.y)) - kk;
            this.distances[k++] = Math.sqrt((w2-this.x)*(w2-this.x) + (h2-this.y)*(h2-this.y)) - kk;
          }
        }
      }
    }
    
    for(int i = 0; i < this.distances.length; i++) this.a[i] = Math.pow(A, this.distances[i]/width);
  }
  
  double interference(double lamda)
  {
    this.z = 0.0;
    for (int i = 0; i < this.distances.length; i++)
    {
      this.z += this.a[i]*Math.sin(2.0*Math.PI*(this.distances[i] - Math.floor(this.distances[i] / lamda) * lamda) / lamda);
    }
    return this.z;
  }
}

