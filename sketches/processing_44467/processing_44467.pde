
//drum class
class Drum {
  float x, y, dia;
  boolean T= false;

  //initial setup function of drum
  void start(float xp, float yp) {
    x = xp;
    y = yp;
    T = true;
    dia = 1;
  }

  //build up a drum update function within drum class
  void update() {
    if (T) {
      dia += 0.5;
      if (dia > 600) {
        T = false;
      }
    }
  }

  //build up a show funtion wlin drum class
  void show() {
   
    colorMode(HSB);
    if (T) {
      noFill();
      strokeWeight(3);
      stroke(col,255,255);
      ellipse(x, y, dia, dia);
    }
  }
}



