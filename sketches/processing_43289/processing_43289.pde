
// Start showing gameStep 0
int gameStep = 0;

// Images
PFont font;
PImage tavolo;
PImage scodella;
PImage burro;
PImage sfondoing;
PImage scodellavuota;
PImage farina;
PImage zucchero;
PImage uovo;
PImage try_again;
PImage mestolo;
PImage iniziale;
PImage win;
PImage turn;
PImage filling;
PImage fly;
PImage credits;
PImage coda;
PFont time;
PImage guantone;
PImage forno;
PImage kabom;

// Variables
boolean failGame = false;
boolean cupFilled = false;
boolean farinaCheck = false;
boolean zuccheroCheck = false;
boolean uovoCheck = false;
boolean burroCheck = false;

int farinaCounter = 2;
int zuccheroCounter = 3;
int uovoCounter = 1;
int burroCounter = 2;
int mescolareCounter = 0;
int mescolareDirection = -1;
int ellipseStartPos;
int timer = 1;

float pos=constrain(mouseX, 80, 81);

// Muffins Setup
// position
float x[] = new float[10];
float y[] = new float[10];
// speed
float speedX[] = new float[10];
float speedY[] = new float[10];
// is the muffin catched?
Boolean moveCheck[] = new Boolean[10];
// Number of muffins
PImage muffinImage[] = new PImage[10];
int step = 1;
// delay between each muffin
int ballDelay = 5;
// Muffin End

void setup() {
  size (400, 400);

  smooth();

  // GAMESTEP 0
  iniziale = loadImage("iniziale.png");

  // GAMESTEP 1
  tavolo= loadImage("tavolo_ombra.png");
  scodella= loadImage("scodella.png");
  burro= loadImage("burro.png");
  sfondoing= loadImage("sfondo_ingredienti.png");
  filling= loadImage ("filling.png");
  scodellavuota= loadImage("scodella_vuota.png");
  farina= loadImage("farina.png");
  zucchero= loadImage("zucchero.png");
  uovo= loadImage("uovo.png");
  kabom= loadImage("kabom.png");
  try_again= loadImage ("try_again.png");
  // GAMESTEP 1 END

  //GAMESTEP 2
  mestolo = loadImage("mestolo.png");
  turn= loadImage("turn.png"); 
  //GAMESTEP 2 END  

  // GAMESTEP 3
  fly= loadImage("fly.png");
  time = createFont("Courier", 18);
  textFont(time, 17);
  guantone = loadImage("guantone.png");
  forno = loadImage("forno_aperto.png");
  // GAMESTEP 3 END

  // GAMESTEP 4
  win = loadImage("win.png");
  credits= loadImage ("credits.png");
  coda= loadImage ("coda.png");
  // GAMESTEP 4 END

  // Muffin setup all values for startup
  for (int i=0; i < x.length; i++) {

    x[i] = width;
    y[i] = height;
    speedX[i]= int (random(3, 6));
    speedY[i]= int (random(3, 6));

    moveCheck[i] = true;
    println(random(1, 2));
    muffinImage[i] = loadImage("muffin" + int(random(1, 3))+ ".png");
  }
  // Muffin End
}

// Draw gameSteps
void draw() {
  if (gameStep == 0) {
    drawGameStep0();
  }

  if (gameStep == 1) {
    drawGameStep1();
  }

  if (gameStep == 2) {
    drawGameStep2();
  }

  if (gameStep == 3) {
    drawGameStep3();
  }

  if (gameStep == 4) {
    drawGameStep4();
  }

  if (gameStep == 5) {
    drawGameStep5();
  }
}

////////////////////////////////////
void mouseDragged() {

  if (gameStep == 1) {
    if (mouseX>24 && mouseX<101) {
      if (mouseY>93 && mouseY<173) {
        cursor (farina);
        farinaCheck = true;
      }
    }

    else {
      if (mouseX>111 && mouseX<195) {
        if (mouseY>93 && mouseY<173) {
          cursor (zucchero);
          zuccheroCheck = true;
        }
      }

      { 
        if (mouseX>205 && mouseX<300) {
          if (mouseY>93 && mouseY<173) {
            cursor (uovo);
            uovoCheck = true;
          }
        }
      }
      { 
        if (mouseX>300 && mouseX<385) {
          if (mouseY>93 && mouseY<173) {
            cursor (burro);
            burroCheck = true;
          }
        }
      }
    }
  }
}





////////////////////////
void mouseReleased() {


  // Fail game
  if (gameStep == 1) {
    if (mouseX>81 && mouseX<317 && mouseY>210 && mouseY<265)
    {

      if (farinaCheck == true) {
        farinaCounter--;
        farinaCheck = false;

        if (farinaCounter < 0) {
          failGame = true;
        }
      }

      if (zuccheroCheck == true) {
        zuccheroCounter--;
        zuccheroCheck = false;

        if (zuccheroCounter < 0) {
          failGame = true;
        }
      }

      if (uovoCheck == true) {
        uovoCounter--;
        uovoCheck = false;

        if (uovoCounter < 0) {
          failGame = true;
        }
      }

      if (burroCheck == true) {
        burroCounter--;
        burroCheck = false;

        if (burroCounter < 0) {
          failGame = true;
        }
      }

      cursor(ARROW);
      cupFilled = true;
    }

    else {
      cursor(ARROW);
      failGame = true;
    }
    // End fail game

    // If fail, restart game
    if (failGame == true && mouseX > 112 && mouseX < 112 + try_again.width && mouseY > 317 && mouseY < 317 + try_again.height) {
      failGame = false;
      cupFilled = false;
      farinaCounter = 2;
      zuccheroCounter = 3;
      burroCounter = 2;
      uovoCounter = 1;
    }
    // End restart game
  }
}


