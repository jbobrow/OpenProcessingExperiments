
//Imatges
PImage cel;
PImage rocket;
PImage Ocell;
PImage baloon;
PImage fons2;

// Variables Coet
float RocketPosX, RocketPosY;
int Rocketsz;

//Variables Globus
float GlobusPosX, GlobusPosY;
int Globussz;

//precarrega imatges
/* @pjs preload="cel.jpg" ; */
/* @pjs preload ="Globus.png"; */
/* @pjs preload ="rocket.png"; */
/* @pjs preload ="Ocell.png"; */
/* @pjs preload ="fons2.jpeg"*/


void setup() {
  size(800, 450);

  //Carrega Imatges, al setup per qüestions de memòria
  cel = loadImage ("cel.jpg");
  baloon = loadImage ("baloon.png");
  rocket = loadImage ("rocket.png");
  Ocell = loadImage ("Ocell.png");
  fons2 = loadImage ("fons2.jpeg");


  //posició inicial Coet
  RocketPosX = width/2;
  RocketPosY = height;
  Rocketsz = 100;

  //posició inicial Globus
  GlobusPosX= width/4;
  GlobusPosY= height;
  Globussz = 50;
}

void draw () {
  background(0);
  // Les imatges les Invoquem funció nit --> Aquesta funció permet que la imatge de fons s'alterni entre les hores que és de dia (9-19) i de nit (20-8)
  nit ();

  //Coet puja marcant segons
  // pujaRocket és el moviment. Map serveix perquè el segon 0 sigui 800 (baix) i el 59 sigui 0 (dalt)
  float pujaRocket = map(second(), 0, 59, height, 0);
  image (rocket, RocketPosX, RocketPosY, Rocketsz, Rocketsz);

  RocketPosY = pujaRocket;

  //Globus puja marcant Minuts

  float pujaGlobus = map (minute (), 0, 59, height, 0);
  image (baloon, GlobusPosX, GlobusPosY, Globussz, Globussz);

  GlobusPosY = pujaGlobus;

  // Cada hora apareix un ocell més en una diagonal. De 0 a 23
  for (int i = 0; i < hour (); i++) {
    image(Ocell, (width) /hour()*i, (height)/hour()*i );
  }
}

///////////////////////////FUNCIONS//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

//Aquesta és la funció que permet el canvi d'imatge del fons//
void nit () {
  // Si l'hora és més petita que 20 I més gran que 8, es comepleix la imatge de dia. Sinó la de nit//
  if (hour()<20 &&  hour() > 8 == true ) {
    image(cel, 0, 0, width, height);
  } else {
    image(fons2, 0, 0, width, height);
  }
}



