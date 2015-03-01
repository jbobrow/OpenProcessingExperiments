
//Imatges
PImage cel;
PImage Globus;
PImage rocket;
PImage Ocell;

// Variables Rocket
float RocketPosX, RocketPosY;
int Rocketsz;

//Variables Globus
float GlobusPosX, GlobusPosY;
int Globussz;


//Precarrega Imatges

/* @pjs preload="cel.jpg" ; */
/* @pjs preload ="Globus.png"; */
/* @pjs preload ="rocket.png"; */
/* @pjs preload ="Ocell.png"; */

void setup() {
  size(800, 450);

  //Carrega Imatges
  cel = loadImage ("cel.jpg");
  Globus = loadImage ("Globus.png");
  rocket = loadImage ("rocket.png");
  Ocell = loadImage ("Ocell.png");

  //posicio inicial Rocket
  RocketPosX = width/2;
  RocketPosY = height;
  Rocketsz = 100;

  //posició inicial Globus
  GlobusPosX= width/4;
  GlobusPosY= height;
  Globussz = 50;
}

void draw() {

  background(0);
  image (cel, 0, 0, width, height);

  //invoquem Rocket (segons)

  Rocket ();
  
  //invoquem Globus (minuts)

  Globus ();


  //invoquem Ocells apareixen ( hores)
  Ocell ();

  delay (1000);
}


/////////////////////////////////////Funcions//////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////

void Globus () {
  float pujaGlobus = map (minute (), 0, 59, height, 0);
  image (Globus, GlobusPosX, GlobusPosY, Globussz, Globussz);

  GlobusPosY = pujaGlobus;
}

void Rocket () {
  float pujaRocket = map(second(), 0, 59, height, 0);
  image (rocket, RocketPosX, RocketPosY, Rocketsz, Rocketsz);

  RocketPosY = pujaRocket;
}

void Ocell () {
  for (int i = 0; i < hour (); i++) {
    image(Ocell, random (width) /hour()*i, random (height)/hour()*i );
  }
}



