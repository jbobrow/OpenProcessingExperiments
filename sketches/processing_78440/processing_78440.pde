
// benutzte Library
import controlP5.*;
ControlP5 slider;

// globale Variablen
int val1 = 100;

int a = 5 ; 
int b = 5;
int d= 7;
float x;
float y;
float transx;    //Verschiebung des Koordinatennullpunktes
float transy;   //auf die Mitte des Screens
float [] [] koordk = new float [100] [2]; //Matrix mit 100 Koordinatenpaaren x,y

color cline = color (16,200,100); //Farbe der Linien
color cfill = color (227,16,16); // Farbe der Füllung
color cback = color (205,214,125); // Farbe des Hintergrunds

void setup(){
//  size (screen.width-50,screen.height-50);
  size(600,600);
  transx=(width)/2;    //Verschiebung des Koordinatennullpunktes
  transy=(height)/2;   //auf die Mitte des Screens
  background (cback); 
  smooth();

  slider = new ControlP5(this);
  slider.addSlider("amplitude",0,200,100,10,30,20,150); 

  fill(cfill);
  strokeWeight(0);
  stroke (cline);

  for (int i= 0; i < 50; i=i+1){
    x=i*transx*2/50;
    y = val1 * sin (x/40)+transy;
    koordk [i] [0] = x;
    koordk [i] [1] = y;
  } 
}   


void draw () {
  background (cback); 
  koordk[49] [1] = val1 * sin (koordk[49] [0]/40)+transy;
  for (int i= 1; i < 49; i=i+1){
    //int i = (int) random (1, 99);
    float lplus = sqrt (sq(koordk [i+1] [0]- koordk [i] [0])
      +sq(koordk [i+1] [1]- koordk [i] [1]));

    float lminus = sqrt (sq(koordk [i-1] [0]- koordk [i] [0])
      +sq(koordk [i-1] [1]- koordk [i] [1]));

    koordk[i] [0] =koordk[i] [0]+(lplus-lminus)*(koordk [i+1] [0]- koordk [i-1] [0])/600;
    koordk[i] [1] = val1 * sin (koordk[i] [0]/40)+transy;
  } 

  for (int j= 0; j < 50; j=j+1){
    fill(cfill);
    ellipse(koordk[j] [0],koordk [j] [1],d,d);
  }
}
void amplitude(int val) {
  val1 = val;
} 












