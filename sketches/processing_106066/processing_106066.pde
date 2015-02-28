
//Thibault Bougeois
//Ecran d'accueil
//5-8-2013

void setup () {
  size(500, 500);
  frameRate(60);
  background (0);
}

int dx = 2; // parametre de la balle
int dy = 3; // parametre de la balle

int x = 100; // abscice de la balle
int y = 100; // ordonnee de la balle

int a = 250; // abscice de la palette du haut
int b = 250; // abscice de la palette du bas

int vieHaut = 3; // nombre de vie de la palette du haut
int vieBas = 3; // nombre de vie de la palette du bas


void draw () {
  background (0);
  fill (255);

  // Balle
  ellipse (x, y, 5, 5);



  //Faire rebondir la balle 
  x -= dx;
  y -= dy;
  if (x<0 || x>500) {
    dx = -dx;
  }
  if (y <0 || y>500) {
    dy=-dy;
  }

  if (x >= a - 40 && x <= a + 40 && y <= 10) {
    dy=-dy;
  }
  if (x >= b - 40 && x <= b + 40 && y >= 490) {
    dy=-dy;
  }





  // Construction des palettes
  stroke (255);
  rect (a-40, 0, 80, 10);
  rect (b-40, 490, 80, 10);



  // Faire perdre des vies
  if (y <= 0) {
    background (255, 0, 0);
    vieHaut -= 1;
  } else if (y>500) {
    background (255, 0, 0);
    vieBas -= 1;
  }


  // Declarer le vainqueur
  if (vieBas == 0) {
      background (0);
    while (true) {
      
      text ( " Winner is the top player", 240, 250);
    }
  } else if  (vieHaut == 0) {
    while (true) {
      text (" Winner is the bottom player", 240, 250);
    }
  }

  // Faire bouger les palettes
  if (key == 'a') {
    b -= 4;
  } else if (key == 'd') {
    b +=4;
  }

  if (keyCode == LEFT) {
    a -= 4;
  } else if (keyCode == RIGHT) {
    a +=4;
  }


  // Remettre les palettes lorsqu'elles sortent de l'ecran
  if (a < 40) {
    a = 40;
  } else if (a> 460) {
    a = 460;
  }
  if (b < 40) {
    b = 40;
  } else if (b> 460) {
    b = 460;
  }
}
