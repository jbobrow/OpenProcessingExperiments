
float d;
float gyorsulas;
int labdakSzama;
float eletek;
int pontszam;
int KOROK_SZAMA = 100;

float korX[] = new float[KOROK_SZAMA];
float korY[] = new float[KOROK_SZAMA];
float korXsebesseg[] = new float[KOROK_SZAMA];
float korYsebesseg[] = new float[KOROK_SZAMA];

color hatter;

boolean vege; 
boolean halal;

PImage szivek;
PImage fekete;

void setup() {
  size(800, 600);
  hatter = #94E8B0;
  background(hatter);

  szivek = loadImage("http://cdn4.iconfinder.com/data/icons/24x24-free-application-icons/24/Heart.png");
  fekete = loadImage("http://cdn0.iconfinder.com/data/icons/win8-and-ios-tab-bar-icons/48/Broken_heart.png");

  rectMode(CENTER);
  d = 20;
  gyorsulas = 1.04;


  for (int i= 0; i < korX.length; ++i) {
    korX[i] = -100;
    korY[i] = -100;
    korX[0] = width/2;
    korY[0] = height/2;
    korXsebesseg[i] = 3;
    korYsebesseg[i] = 4;

    labdakSzama = 1;

    if (random(10) <= 3) {
      korXsebesseg[i] *= -1;
    } else if (random(10) > 3 && random(10) <= 5) {
      korYsebesseg[i] *= -1;
    } else if (random(10) > 5 && random(10) <= 8) {
      korXsebesseg[i] *= -1;
      korYsebesseg[i] *= -1;
    } else {
      korXsebesseg[i] *= 1;
      korYsebesseg[i] *= 1;
    }
  } 

  eletek = 5;
  pontszam = 0;

  vege = false;

  noCursor();
}

void draw() {
  background(hatter);
  tabla();
  strokeWeight(1);

  if (vege == true) {
    vegUzenet();
  } else if (eletek == 0) {
    aJateknakVege();
    image(fekete, 0, 0);
  } else {
    labda();
  }

  szivek();
  kiiras();
}

void labda() {
  fill(#FFFFFF);

  for (int i =0; i< KOROK_SZAMA; ++i) {
    if (korX[i] != -100) {
      ellipse(korX[i], korY[i], d, d);

      if (korY[i] <= 10) {
        korYsebesseg[i] *= -(gyorsulas);
        korXsebesseg[i] *= gyorsulas;
      }
      if (korX[i] >= width || korX[i] <= 10) {
        korXsebesseg[i] *= -(gyorsulas);
        korYsebesseg[i] *= gyorsulas;
      }
      if (korY[i]+10 >= 550) { 
        if (korX[i]+10 > mouseX && korX[i]+10 < mouseX +100) {
          korYsebesseg[i] *= -(gyorsulas);
          korXsebesseg[i] *= gyorsulas;
          pontszam += 5;
        } else {
          vege = true;
        }
      }
    }
  }
    for (int i = 0; i < KOROK_SZAMA; ++i) {
      if (korX[i] != -100) {
        korX[i] += korXsebesseg[i];
        korY[i] += korYsebesseg[i];
      }
    }
}

  void keyReleased() {
    if (key == ' ') {
      korX[labdakSzama] = width/2;
      korY[labdakSzama] = height/2;
      korXsebesseg[labdakSzama] = 3;
      korYsebesseg[labdakSzama] = 4;
      korX[labdakSzama] += korXsebesseg[labdakSzama];
      korY[labdakSzama] += korYsebesseg[labdakSzama];

      ++labdakSzama;
    }
  }

  void tabla() {
    strokeWeight(10);
    line(mouseX, 550, mouseX+100, 550);
  }

  void vegUzenet() {
    textAlign(CENTER);
    textSize(50);
    fill(#FFFFFF);
    text("A játékos időknek vége", width/2, height/2);
    fill(#0A9336);
    rect(width/2, (height/2)+70, 100, 70);
    textSize(40);
    fill(#FFFFFF);
    text("Újra", 400, (height/2)+85);

    cursor();

    if (mousePressed && mouseX >= 350 && mouseX <= 450 && mouseY >= 335 && mouseY <= 405) {
      hatter = color(random(10, 255), random(10, 255), random(10, 255));

      labdakSzama=1;

      for (int i = 0; i < KOROK_SZAMA; ++i) {
        korX[i] = -100;
        korY[i] = -100;

        korXsebesseg[i] = 3;
        korYsebesseg[i] = 4;
        noCursor();
        if (random(10) < 5) {
          korXsebesseg[i] *= -1;
        } else {
          korYsebesseg[i] *= -1;
        }
        labda();
        vege=false;
      }

      korX[0] = width/2;
      korY[0] = height/2;
      --eletek;
    }
  }

  void aJateknakVege() {
    textSize(50);
    fill(#FF0000);
    textAlign(CENTER);
    text("A játékos időknek végleg vége", width/2, height/2);
  }

  void szivek() {
    if (eletek == 5) {
      image(szivek, 0, 0);
      image(szivek, 24, 0);
      image(szivek, 48, 0);
      image(szivek, 72, 0);
      image(szivek, 96, 0);
    } else if (eletek ==4) {
      image(szivek, 0, 0);
      image(szivek, 24, 0);
      image(szivek, 48, 0);
      image(szivek, 72, 0);
    } else if (eletek ==3) {
      image(szivek, 0, 0);
      image(szivek, 24, 0);
      image(szivek, 48, 0);
    } else if (eletek == 2) {
      image(szivek, 0, 0);
      image(szivek, 24, 0);
    } else if (eletek == 1) {
      image(szivek, 0, 0);
    }
  }

  void kiiras() {
    fill(#000000);
    textSize(35);
    textAlign(RIGHT);
    text("" + pontszam, 780, 40);
  }



