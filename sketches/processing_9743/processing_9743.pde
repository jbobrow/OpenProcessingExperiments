
/** helmut bartz 2010-05-06
    kurbelschwinge1
*/

int   height   = 240;
int   kr       = 50;// Radius der Kurbel
float kx, ky;// Abstaende Kurbellager Kurbelmittelpunkt 
int   kd       = 10;// Kurbeldurchmesser
float l        = 200;// Abstand Schwingenlager Kurbelmittelpunkt
int   slx      = height / 4; //Position Schwingenlager
int   sly      = height / 2;
float lk;// Abstand Schwingenlager Kurbelmittelpunkt 
int   sges     = 400;// Gesamtlaenge der Schwinge
int   width    = sges + height / 2;
int   alpha    = 0;// Drehwinkel der Kurbel
int   alpha_inc= 1;
float beta;// Winkel der Schwinge
int[] xspur= new int[360];//fuer Spurpunkte
int[] yspur= new int[360];// "
  
void setup(){
  size(width, height);
  background (255);
  smooth();
  //Spurpunkte
  for (int i= 0; i < 360; i++) {
    beta= atan (sin (radians (i)) * kr / (l + cos (radians (i)) * kr));
    xspur[i]= round (cos (beta) * sges);
    yspur[i]= round (sin (beta) * sges);
  }
}

void draw(){
  background (255);
  strokeWeight (1);
  stroke (0);
  //Kurbel
  lager (slx + l, height / 2);
  //Schwinge
  lager (slx, sly);
  //Kurbel
  kx= cos (radians (alpha)) * kr;
  ky= sin (radians (alpha)) * kr;
  line (slx + l, sly, slx + l + kx, sly + ky);
  //Schwinge
  beta= atan (ky / (l + kx));
  lk= ky / sin (beta);
  translate(slx, sly);
  //spur
  stroke (#ff0000);
  for (int i= 0; i < alpha; i= i + 5) 
    point (xspur[i], yspur[i]);
  stroke (0);
  //Schwinge
  rotate (beta);
  schwinge (sges, lk);
  alpha+= alpha_inc;
  alpha= alpha % 360;
}

/** 
 * zeichnet ein kleines Kreuz
 */
void lager (float x, float y) {
  line (x - 5, y, x - 3, y);
  line (x + 3, y, x + 5, y);
  line (x, y - 5, x, y - 3);
  line (x, y + 3, x, y + 5);
}

/**
 * zeichnet die Schwinge mit Kurbelkopf
 */
void schwinge (int sl_ges, float lk) {
  line (0, 0, l - kr - 10, 0);
  line (l + kr + 10, 0, sl_ges, 0);
  strokeWeight (kd + 2);
  strokeCap (ROUND);
  line (l - kr - 10, 0, l + kr + 10, 0);
  stroke(255);
  strokeWeight (kd);
  line (l - kr - 10, 0, l + kr + 10, 0);
  //Kurbelkopf
  strokeWeight (0);
  fill (0);
  ellipseMode (CENTER);
  ellipse (lk, 0, kd, kd);
}

