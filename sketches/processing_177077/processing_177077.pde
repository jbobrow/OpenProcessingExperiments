
/* @pjs preload="hartnell.png"; */
/* @pjs preload="troughton.png"; */
/* @pjs preload="pertwee.png"; */
/* @pjs preload="baker4.png"; */
/* @pjs preload="davison.png"; */
/* @pjs preload="baker6.png"; */
/* @pjs preload="mccoy.png"; */
/* @pjs preload="mcgann.png"; */
/* @pjs preload="war.png"; */
/* @pjs preload="eccleston.png"; */
/* @pjs preload="tennant.png"; */
/* @pjs preload="smith.png"; */
/* @pjs preload="capaldi.png"; */
/* @pjs preload="tardis1.png"; */
/* @pjs preload="tardis2.png"; */
/* @pjs preload="wangel.png"; */
/* @pjs preload="endangel.png"; */
/* @pjs preload="hatterveg.jpg"; */
/* @pjs preload="hatter.jpg"; */


PImage Hartnell;
PImage Troughton;
PImage Pertwee;
PImage Baker4;
PImage Davison;
PImage Baker6;
PImage McGann;
PImage McCoy;
PImage Hurt;
PImage Eccleston;
PImage Tennant;
PImage Smith;
PImage Capaldi;
PImage tardAlj;
PImage tardFel;
PImage wa;
PImage vegA;

PImage doctor;

PImage hatter;
PImage everybody;

float teglalapX[] = new float[999];
float teglalapY[] = new float[999];
float teglalap2Y[] = new float[999];

boolean pontMegvan[] = new boolean[999];

float x;
float y;
float sebessegY;
float gyorsulas;
int pontok;
int eletek;

boolean elkezdodott;
boolean elsoscene;
boolean masodikscene;
boolean harmadikscene;
boolean vege;
boolean legvege;

void setup() {
  size(800, 600);
  hatter = loadImage("hatter.jpg");
  background(hatter);
  x = width/4;
  y = height/2;
  sebessegY = 0.85;
  gyorsulas = 0.04;
  eletek = 12;
  pontok = 0;
  elkezdodott = false;
  elsoscene = true;
  masodikscene = false;
  harmadikscene = false;
  legvege = false;

  Hartnell = loadImage("hartnell.png");
  Hartnell.resize(100, 100);
  Troughton = loadImage("troughton.png");
  Troughton.resize(100, 100);
  Pertwee = loadImage("pertwee.png");
  Pertwee.resize(100, 100);
  Baker4 = loadImage("baker4.png");
  Baker4.resize(100, 100);
  Davison = loadImage("davison.png");
  Davison.resize(100, 100);
  Baker6 = loadImage("baker6.png");
  Baker6.resize(100, 100);
  McCoy = loadImage("mccoy.png");
  McCoy.resize(100, 100);
  McGann = loadImage("mcgann.png");
  McGann.resize(100, 100);
  Hurt = loadImage("war.png");
  Hurt.resize(100, 100);
  Eccleston = loadImage("eccleston.png");
  Eccleston.resize(100, 100);
  Tennant = loadImage("tennant.png");
  Tennant.resize(100, 100);
  Smith = loadImage("smith.png");
  Smith.resize(100, 100);
  Capaldi = loadImage("capaldi.png");
  Capaldi.resize(100, 100);
  tardAlj = loadImage("tardis1.png");
  tardFel = loadImage("tardis2.png");
  wa = loadImage("wangel.png");
  vegA = loadImage("endangel.png");
  everybody = loadImage("hatterveg.jpg");
  everybody.resize(800, 600);


  for (int i =0; i< teglalapX.length; i++) {
    teglalapX[i] = width/2 + 300*i;
    teglalapY[i] = random(150, 300);
  }

  for (int i = 0; i < pontMegvan.length; i++) {
    pontMegvan[i] = false;
  }
}

void draw() {
  background(hatter);
  if (elkezdodott == false) {
    kezdoKep();
  } else {
    if (vege == true) {
      textSize(50);
      fill(#FFFFFF);
      textAlign(CENTER);
      text("Regenerating...", width/2, height/2);
      textSize(24);
      text("Press Space", width/2, height/2+42);
    } else if (eletek == -1) {
      legvege = true;
      vegUzenet();
    } else {
      flappyDoctor();
      teglalapok();
      nehezseg();
    }
  }
  pontSzamlalas();
  println(pontok);
  println(eletek);
}

void flappyDoctor() {

  if (eletek == 12) {
    doctor = Hartnell;
  } else if (eletek == 11) {
    doctor = Troughton;
  } else if (eletek == 10) {
    doctor = Pertwee;
  } else if (eletek == 9) {
    doctor = Baker4;
  } else if (eletek == 8) {
    doctor = Davison;
  } else if (eletek == 7) {
    doctor = Baker6;
  } else if (eletek == 6) {
    doctor = McCoy;
  } else if (eletek == 5) {
    doctor = McGann;
  } else if (eletek == 4) {
    doctor = Eccleston;
  } else if (eletek == 3) {
    doctor = Tennant;
  } else if (eletek == 2) {
    doctor = Smith;
  } else if (eletek == 1) {
    doctor = Capaldi;
  } else if (eletek == 0) {
    doctor = Hurt;
  }

  if (vege == false) {
    fill(#FFFFFF);
    imageMode(CENTER);
    image(doctor, x, y);
    y += sebessegY;
    sebessegY += gyorsulas;
  } 

  for (int i = 0; i < teglalapX.length; i++) {
    if (x >= teglalapX[i]-20 && x <= teglalapX[i]+150) {
      if (y >= teglalapY[i]+5 && y <= teglalapY[i]+120) {
        vege = false;
      } else {
        vege = true;
        --eletek;
      }
    }
  }
}

void teglalapok() {
  imageMode(CORNERS);
  for (int i = 0; i < teglalapX.length; i++) {
    fill(#102372);
    image(tardFel, teglalapX[i]+150, 0, teglalapX[i], teglalapY[i]);
    image(tardAlj, teglalapX[i]+150, teglalapY[i]+120, teglalapX[i], 600);
    teglalapX[i] -= 2.5;
    if (i%9 == 2) {
      image(wa, teglalapX[i]+150, teglalapY[i]+210, teglalapX[i], 600);
    }
    if (teglalapX[998] <= 0) {
      nyertel();
    }
  }
}

void nehezseg() {
  for (int i = 0; i < teglalapX.length; i++) {
    if (i >= 50) {
      teglalapX[i] -= 1.5;
    }
    if (pontok >= 10) {
      teglalapX[i] -= 1;
    } else if (pontok >= 25) {
      teglalapX[i] -= 2;
    } else if (pontok >= 30) {
      teglalapX[i] -= 2.5;
    }
  }
}

void pontSzamlalas() {
  for (int i = 0; i < teglalapX.length; i++) {
    if (teglalapX[pontok] <= x-150) {
      pontMegvan[pontok] = true;
      ++pontok;

      if (eletek == -1) {
        legvege = true;
      }
    }
  }

  fill(#FFFFFF);
  textSize(35);
  textAlign(RIGHT);
  text("" + pontok, 780, 40);
}

void alapAllas() {
  x = width/4;
  y = height/4;
  sebessegY = 0.7;
  gyorsulas = 0.03;
  pontok = 0;

  for (int i =0; i< teglalapX.length; i++) {
    teglalapX[i] = width/2 + 300*i;
    teglalapY[i] = random(150, 300);
  }

  for (int i = 0; i < pontMegvan.length; i++) {
    pontMegvan[i] = false;
  }

  pontSzamlalas();
}

void kezdoKep() {
  textAlign(CENTER);
  fill(#FFFFFF);
  if (elsoscene == true) {
    textSize(50);
    text("Welcome to Flappy Who!", width/2, height/2);
    textSize(25);
    text("Press Enter", width/2, height/2 +50);
  } else if (masodikscene == true) {
    textAlign(CENTER);
    textSize(50);
    text("You can jump by pressing space", width/2, height/2-50);
    textSize(25);
    text("Don't touch the TARDISes!", width/2, height/2);
  } else if (harmadikscene == true) {
    text("Ready?", width/2, height/2);
    textSize(30);
    text("Press Space to start", width/2, height/2-40);
  }
}

void vegUzenet() {
  imageMode(CENTER);
  image(vegA, width/2, height/2);
  textAlign(CENTER);
  fill(#FF0000);
  textSize(100);
  text("Don't blink!", width/2, height/2);
}

void nyertel() {
  background(everybody);
  textAlign(CENTER);
  fill(#FF0000);
  textSize(50);
  text("Just this once, ", width/2, height/8-20);
  text("everybody lives!", width/2, height/8 +25);
}

void keyPressed() {
  if (key== ' ') {
    elkezdodott = true;
    if (vege == false) {
      sebessegY = sebessegY -3;
    } else if (vege == true && legvege == false) {
      alapAllas();
      vege = false;
    } else if (legvege == true) {
      vegUzenet();
    }
  } else if (key == ENTER) {
    if (elsoscene == true) {
      elsoscene = false;
      masodikscene = true;
    } else if (masodikscene == true) {
      masodikscene = false;
      harmadikscene = true;
    }
  }
}



