
final int MARCHE = 0;
final int EXPLOSE = 1;
int etat = MARCHE;

boolean blink = false;

int marcheImages = 13;
PImage[] marche;

int exploseImages = 11;
PImage[] explose;

int temps;
int compteur;

void setup() {

  size(300,300);

  marche = new PImage[marcheImages];
  explose = new PImage[exploseImages];

  for ( int i =0; i < marcheImages; i++ ) {
    marche[i] = loadImage("spider"+nf(i+1,2)+".png");
  }

  for ( int i =0; i < exploseImages; i++ ) {
    explose[i] = loadImage("explode"+nf(i+1,2)+".png");
  }

 imageMode(CENTER);
  frameRate(20);
}


void draw() {


  if ( blink ) {
    background(255,0,0);
    blink = false;
  } 
  else {
    background(100);
    if ( etat == MARCHE ) {
      // Changer l'image de l'animation a chaque 250 ms
      if ( millis() - temps > 250 ) {
        temps = millis();
        compteur = (compteur + 1) % marcheImages;
      }
       
      image( marche[compteur], width/2 , height/2);
    } 
    else {

      // Changer l'image de l'animation a chaque 250 ms
      if ( millis() - temps > 250 ) {
        temps = millis();
        compteur = (compteur + 1);
      }
     
      image( explose[compteur], width/2, height/2);

      if ( compteur == exploseImages - 1 ) {
        etat = MARCHE;
        compteur = 0;
        temps = millis();
      }
    }
  }
}


void mousePressed() {
  if ( etat == MARCHE ) {
    etat = EXPLOSE;
    temps = millis();
    compteur = 0;
    blink = true;
  }
}


