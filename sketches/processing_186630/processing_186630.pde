
/*pràctica rellotge by Pol Mas de Xaxàs
creació de videojocs
comunicació audiovisual
universitat Pompeu Fabra */

///////////////MÚSICA NO FUNCIONA AMB JAVASCRIPT///////////////////
///HE INTENTAT TOT EL QUE A LA MEVA MENT SE LI HA POGUT OCORRE////

//declaració de variables
int posX, posY; //centre del rellotge
float segonsR;
float minutsR;
float horesR;
//import ddf.minim.*;

//AudioPlayer player;
//Minim minim;


void setup() {
  size(700, 600);
  stroke(255);
  posX = width / 2;//declarem que el centre del rellotge estara al centre de la pantalla
  posY = height/2 ;
  int radi =min(width, height) / 2;
  segonsR = radi * 1.5;
  minutsR = radi;
  horesR = radi * 0.50;
  
//musica
  //minim = new Minim(this);
  //player = minim.loadFile("07 Feels Like We Only Go Backwards.mp3", 2048);
  //player.play();

}

void draw() {
  background(#F5F1C8);
 
  
  int horaTotal=hour();
   if (horaTotal>12) {
      horaTotal = horaTotal-12;
   }
   
  
 //funcions map() i norm() extretes de https://processing.org/examples/clock.html
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(horaTotal + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  
      
  // Dibuix del rellotge
  noStroke();
  fill(36,109,94);
  arc(posX,posY,segonsR,segonsR,s,PI+HALF_PI);
  fill(96,151,50);
  arc(posX,posY,minutsR,minutsR,m,PI+HALF_PI);
  fill(159,168,56);
  arc(posX,posY,horesR,horesR,h,PI+HALF_PI);
 
 if (mousePressed==true) {
 fill(0);
 PFont font;
 font = loadFont("HelveticaNeue-Light-48.vlw");
 textFont(font, 32);
 text("time goes backwards", 200,570);
 }
}

//void stop()
{
  //player.close();
  //minim.stop();
  //super.stop();
}
