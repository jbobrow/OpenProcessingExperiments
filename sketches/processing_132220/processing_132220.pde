
//Variables
float myFloat  = 50;
float shipX;

PImage bomb;
PImage pirateShip;
PImage enemyCannons;
PImage waves;

int count;
int lives = 10;

//Instructie om nieuwe (x aantal) cirkels te maken
Circle [] circles = new Circle [5];
//Instructie om nieuwe (x aantal) bommen te maken
Bomb [] bombs = new Bomb [3];


void setup () {

  size (600, 600);
  smooth (); //Trekt alle geometrische vormen naar een vorm met een gladde rand.
  noStroke(); //No outline

    //Images
  pirateShip = loadImage("PirateShip.png");
  enemyCannons = loadImage("EnemyCannons.png");
  waves = loadImage("golven.png");
  bomb = loadImage("bomb.png");

  //For loop; wat de cirkels aanroept
  for (int i=0; i<circles.length; i++) {
    circles[i] = new Circle (random(600), 50, 16);
  }

  for (int i=0; i<bombs.length; i++) {
    bombs[i] = new Bomb (random(600), 50);
  }
}


void draw () {
  background (255);

  //Draw images
  image(waves, 0, 530, (waves.width + 10), waves.height);
  image(pirateShip, shipX, 490, pirateShip.width/2, pirateShip.height/2);
  image(enemyCannons, 0, 0, enemyCannons.width, enemyCannons.height);

  //For loop; voor elke cirkel wat getekent word krijgen de functie checkCollisions, update en drawCircle mee.
  for (int i=0; i<circles.length;i++) {
    circles[i].checkCollisions ();  //Checken of de cirkel iets aanraakt.
    circles[i].update ();           //Update om ze de snelheid en punten telling bij te houden.
    circles[i].drawCircle();        //Deze functie tekent daadwerkelijk de cirkel
  }

  for (int i=0; i<bombs.length;i++) {
    bombs[i].checkCollisions ();  //Checken of de cirkel iets aanraakt.
    bombs[i].update ();           //Update om ze de snelheid en punten telling bij te houden.
    bombs[i].drawBomb();        //Deze functie tekent daadwerkelijk de cirkel
  }
}

//De cirkel definiëren - wat het gaat worden
class Circle {

  //properties van de cirkel class
  float x;
  float y;

  float xspeed;
  float yspeed;

  float circleSize;


  //methods van de cirkel class
  Circle (float  xpos, float ypos, float cSize) {

    x = xpos;
    y = ypos;
    circleSize = cSize;

    yspeed = random (2, 5); //Random bepaald de snelheid tussen 2 en 5 waarmee de cirkel moet vallen.
  }

  void update () { //Update functie is nog een toevoegsel van de Cirkel class
    x += xspeed;
    y += yspeed;
    shipX = mouseX;

    //Telling van de score
    fill(0, 0, 0);
    text("Score:" + count, 5, 120);
  }

  void checkCollisions () { //Kijken of de cirkel iets raakt
    if (y > 600) {
      y = 60;
      x = random (600);
    }

    if (y > 490 && x > (shipX - 5) && x < (shipX + 94)) {
      count ++; 
      y = 60;
      x = random (600);
    }
  }

  void drawCircle () { //De cirkel word hier getekent
    //Hij krijgt een kleur als je een x aantal punten heb gescoord.
    if (count < 10) {
      fill (0, 0, 100);
    }
    if (count < 20 && count > 9) {
      fill (0, 100, 0);
    }
    if (count < 40 && count > 19) {
      fill (100, 0, 0);
    }
    if (count > 39) {
      fill (random(255), random(255), random(255));
    }
    //DE CIRKEL!
    ellipse (x, y, circleSize, circleSize);
  }
}

class Bomb {

  //properties van de bomb class
  float x;
  float y;

  float xspeed;
  float yspeed;

  float bombSize;


  //methods van de bomb class
  Bomb (float  xpos, float ypos) {

    x = xpos;
    y = ypos;

    yspeed = random (2, 5); //Random bepaald de snelheid tussen 2 en 5 waarmee de bom moet vallen.
  }

  void update () { //Update functie is nog een toevoegsel van de Bomb class
    x += xspeed;
    y += yspeed;

    //Levens
    text("Lives:" + lives, 5, 140);

    //Zwart kleur boven de 3 levens, onder de 3 of 3 krijgt hij een rode kleur.
    if (lives < 4) {
      fill(255, 0, 0);
    }
    else {
      fill(0, 0, 0);
    }

    //Simpele kleine reset
    if (lives < 1) {
      lives = 10;
      count = 0;
    }
  }

  void checkCollisions () { //Kijken of de bom iets raakt
    if (y > 600) {
      y = 60;
      x = random (600);
    }

    if (y > 490 && x > (shipX - 5) && x < (shipX + 94)) { //Schip geraakt
      lives --; 
      y = 60;
      x = random (600);
    }
  }

  void drawBomb () { //De bom word hier getekent
    image(bomb, x, y, bomb.width, bomb.height);
  }
}



