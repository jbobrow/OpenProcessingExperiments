
//Thibault Bougeois
//Ecran d'accueil
//5-8-2013

void setup () {
  size(500, 500);
  frameRate(60);
  background (0);
}

int dx = 21;
int dy = 14;

int x = 50;
int y = 50;

void draw () {
  background (0);
  fill (255);

  for (int i=0; i<100; i+=20)
    rect (x, y+i, 25, 25, 5);
  x -= dx;
  y -= dy;

  if (x<0 || x>500) {
    dx = -dx;
  }
  if (y <0 || y>500) {
    dy=-dy;
  }
}
