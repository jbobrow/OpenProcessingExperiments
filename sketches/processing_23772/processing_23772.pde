
class SinusWave {
  float A;
  float k;
  float w;
  
  SinusWave() {
  }
  
  float f (float x, float t) {
    return A*sin(w*t-k*x);
  }
}

