
//Thibault Bougeois
//Ecran d'accueil
//5-8-2013

void setup () {
  size(500, 500);
  frameRate(60);
  background (0);
  int vie = 3;
}

int dx = 7;
int dy = 6;

int x = 100;
int y = 100;

void draw () {
  //text (vie, 450, 450);
  background (0);
  fill (255);

  rect (x, y, 5, 5, 5);
  x -= dx;
  y -= dy;

  if (x<0 || x>500) {
    dx = -dx;
  }
  if (y <0 || y>500) {
    dy=-dy;
  }
  stroke (255);
  rect (mouseX-40, 0, 80, 10);
  if ((x<mouseX-40 || x>mouseX+40)&&(y<8)) {
    background (255,0,0);
    text("Lose", 245, 245);
    
  }
}
