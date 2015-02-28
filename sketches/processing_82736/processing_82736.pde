
//// M O S A I C O - L I S É R GI CO // dia 1 //
//// Hackpact.mx //// Dora Bartilotti ////
//// 09-12-2012 ////



Cuadrito[][] mosaico;
int canvasAncho=600;
int canvasAlto=600;
int columnasHor=canvasAncho/30;
int columnasVer=canvasAlto/30;
int cuadroAncho=canvasAncho/columnasHor;
int cuadroAlto=canvasAlto/columnasVer;


void setup() {


  smooth();
  size(600, 600);

  mosaico = new Cuadrito[columnasHor][columnasVer];

  for (int i = 0; i < columnasHor; i++) {
    for (int j = 0; j < columnasVer; j++) {

      mosaico[i][j] = new Cuadrito(i*cuadroAncho, j*cuadroAlto, cuadroAncho, cuadroAlto, (3.003*(i*j+((i+j)*2))));
      //Cuadrito(int cX, int cY, int cAncho, int cAlto, float cColor) {
    }
  }

  frameRate(15);
}


void draw() {
 background (100);

  for (int i = 0; i < columnasHor; i++) {
    for (int j = 0; j < columnasVer; j++) {

      mosaico[i][j].colorizacion();
      mosaico[i][j].dibuja();
    }
  }
}

////////////////////// C L A S E //////////////////////////

class Cuadrito {
  int x;
  int y;   
  int w;
  int h;   
  float cambioColor; 

  // Constructor cuadrito
  Cuadrito(int cX, int cY, int cAncho, int cAlto, float cColor) {
    x = cX;
    y = cY;
    w = cAncho;
    h = cAlto;
    cambioColor = cColor;
  } 
  
  
  void colorizacion() {
    cambioColor += 0.17; 
  }

  void dibuja() {
    stroke(255* sin(cambioColor));
    strokeWeight(2);
    fill((127+127*cos(cambioColor)),(127+127*sin(cambioColor)),(127+127*sin(cambioColor)), 180);
    rect(x,y,w,h); 
  }
}
