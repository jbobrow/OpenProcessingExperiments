
class AffineHandler {
  
  int[] proB = new int[50];
  int[] proCd = new int[0];
  float[][] coEffies = new float[50][6];
  
  AffineHandler(int[] C, float r) {
    for(int i = 0; i < C.length; i++) {
      proB[i] = C[i];
    }
    int k = 0;
    while(k<proB.length) {
      int g = proB[k];
      while(g>0) {
        proCd = append(proCd, k);
        g--;
      }
      k++;
    }
    for(int x = 0; x < 50; x++) {
      for(int y = 0; y < 6; y++) {
        coEffies[x][y] = random(-r, r);
      }
    }
  }
  
  float[] transF(float tX, float tY) {
    float qX = tX;
    float qY = tY;
    int ranD = (int)random(proCd.length);
    int U = proCd[ranD];
    qX = coEffies[U][0]*tX + coEffies[U][1]*tY + coEffies[U][2];
    qY = coEffies[U][3]*tX + coEffies[U][4]*tY + coEffies[U][5];
    float[] info = {qX, qY};
    return(info);
  }
}

