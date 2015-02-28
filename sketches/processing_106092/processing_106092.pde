
void setup () {
  size (1000, 1000);
  background (255);
  frameRate(60);
}





int x = 0;
int y = 0;
int a = 10;
int framerate = 60;
int r = 40;


int xRandom = int(random (1000));
int yRandom = int(random (1000));

int xBad = int(random (1000));
int yBad = int(random (1000));

void draw() {
  frameRate (framerate);

  // Dessiner les objets a avoir
  background (255);
  fill (255, 0, 0);
  ellipse (xRandom, yRandom, 5, 5);
  fill (0, 250, 0);
  ellipse (xBad, yBad, r, r);
  //ellipse (0,400,1500,1);
  //ellipse (900,425,600,1);

  //ellipse (0,800,600,1);

  //ellipse (
  //text("LOSER", 500, 500);


  // Dessiner le cercle et le faire bouger
  fill (0);
  ellipse (x, y, a, a);
  if (keyCode == UP) {
    y -= 6;
  } else if (keyCode == DOWN) {
    y += 6;
  } else if (keyCode == RIGHT) {
    x += 6;
  } else if (keyCode == LEFT) {
    x -= 6;
  }

  if (dist(x, y, xBad, yBad)< a/2 + r/2) { 
    background (255, 0, 0);
    fill ( 0);
    text("You lose", 500, 500);
    while (true) {
    }
  }

  if (dist(x, y, xRandom, yRandom)< a/2 +2) { 
    xRandom = int(random (1000));
    yRandom = int(random (1000));
    xBad = int(random (1000));
    yBad = int(random (1000));
    a += 5;
    framerate += 5;
    r += 5;
  }
  /* if((x >= 0 && x <= 300 && y >= 400 - a && y <= 400) || (x {
   text("You Lose", 100, 100); 
   }*/


  if (x-a/2 < 0) {
    x += 2;
  } else if (x+a/2>1000) {
    x -= 2;
  } else if (y-a/2 <0) {
    y += 2;
  } else if (y+a/2 >1000) {
    y -= 2;
  }
}

