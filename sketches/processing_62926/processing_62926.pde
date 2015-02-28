
class Courbe {
  int CourbeStep;
  int CourbeDernierPoint;
  float[] CourbeY = new float[maxpoints];
  float[] CourbeX = new float[maxpoints];
  float[] CourbeSuplimitY = new float[maxpoints];
  float[] CourbeSuplimitX = new float[maxpoints];
  float[] CourbeInflimitY = new float[maxpoints];
  float[] CourbeInflimitX = new float[maxpoints];
  boolean[] CourbeLimite = new boolean[maxpoints];


  Courbe(int Tstep, int TDernierPoint) {

    CourbeStep = Tstep;
    CourbeDernierPoint = TDernierPoint;

    for (int i = 0;i<=CourbeDernierPoint;i++) {
      CourbeY[i] = Y[i];
      CourbeX[i] = X[i];
      CourbeSuplimitY[i] = suplimitY[i];
      CourbeSuplimitX[i] = suplimitX[i];
      CourbeInflimitY[i] = inflimitY[i];
      CourbeInflimitX[i] = inflimitX[i];
      CourbeLimite[i] = limite[i];
    }
  }

  void display() {
    
    stroke(100);

    for (int i = 0;i<CourbeDernierPoint;i++) {

      if (!CourbeLimite[i] && !CourbeLimite[i+1]) {


        line(CourbeX[i], CourbeY[i], CourbeX[i+1], CourbeY[i+1]);
      }
    }
    for (int i = 0;i<CourbeDernierPoint;i++) {

      if ( CourbeLimite[i] && CourbeSuplimitX[i]>-1) {
        line(CourbeX[i+1], CourbeY[i+1], CourbeSuplimitX[i], CourbeSuplimitY[i]);
      }
    }
    for (int i = 1;i<=CourbeDernierPoint;i++) {

      if ( CourbeLimite[i] && CourbeInflimitX[i]>-1) {
        line(CourbeX[i-1], CourbeY[i-1], CourbeInflimitX[i], CourbeInflimitY[i]);
      }
    }
  }
}


