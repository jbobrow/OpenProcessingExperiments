
class Hue {
  float r;
  float g;
  float b;
  float[][] gradient = new float[3][10];
  
  Hue(float _r, float _g, float _b){
    r = _r;
    g = _g;
    b = _b;
    
    
     for (int i = 0; i<10; i++){
       gradient[0][i] = r/(i+1);
       gradient[1][i] = g/(i+1);
       gradient[2][i] = b/(i+1);
     }
  }
}

