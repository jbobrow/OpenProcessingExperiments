
float x = 150;
float y;
float v0 = 6;
float a = 0.2;
float vX = v0;
float[] res= new float[10];
float[] felsoNegyzetY= new float[10];
float[] alsoNegyzetY= new float[10];
float[] elsoNegyzetX= new float[10];
float vY = 4;
boolean gameOver=true;
int s = 300;
int pontszam;
boolean[] pontozott= new boolean[10];
PFont myfont;

void setup() {
  size (800, 600);
  background(#27B2C9);
  noCursor();
  noStroke();
  myfont = loadFont("CenturyGothic-Bold-48.vlw");
  smooth();
  textFont(myfont);
}


void draw() {
  if (gameOver == false) {
    background(#27B2C9);
    for (int i=0; i<10; i++) {
      rect (elsoNegyzetX[i], 0, 70, felsoNegyzetY[i]);
      rect (elsoNegyzetX[i], alsoNegyzetY[i], 70, 600);
      elsoNegyzetX[i]-=3;
    }

    smooth();
    fill(#000000);
    ellipse(x, y, 50, 50);
    pontszamkiiras(width/2, height/3);
    y += vX;
    vX += a;
    ujraTervezes();
    fill(#FFFFFF); 
    utkozes();
    pontszamitas();
  } else {    
    background(#27B2C9);
    textAlign(CENTER);
    smooth();
    textSize (58);
    fill(#000000);
    text("Press space", ( width / 2 ), (height / 2) );
    textAlign(CENTER);
    textSize (48);
    pontszamkiiras(width/2, height/3);
  }
}


void keyPressed() {
  if (key== ' ') {
    vX -= 7;
    if (gameOver== true) {
      s=600;
      pontszam=0; 
      for (int i=0; i<10; i++) {
        y = 30;
        v0 = 3;
        felsoNegyzetY[i] = random(150, 400); 
        res[i] = random(120, 180);
        elsoNegyzetX[i] = s + random (80, 150);
        s += 300;
        alsoNegyzetY[i] = res[i] + felsoNegyzetY[i];
        gameOver = false;
        pontozott[i]=false;
      }
    }
  }
}

void ujraTervezes() {
  for (int i=0; i<10; i++) {
    if (elsoNegyzetX[i] <= -200) {
      pontozott[i]=false;
      res[i] = random(120, 180);
      felsoNegyzetY[i] = random(150, 400);
      alsoNegyzetY[i] = res[i] + felsoNegyzetY[i];
      float legmesszebb=elsoNegyzetX[0];
      for (int j=0; j<10; j++) {
        if (legmesszebb <= elsoNegyzetX[j]) {
          legmesszebb=elsoNegyzetX[j];
        }
      }
      elsoNegyzetX[i] = legmesszebb + random(300, 450);
    }
  }
}


void utkozes() {
  for (int i=0; i<10; i++) {
    if (elsoNegyzetX[i] <= 168 && elsoNegyzetX[i] >= 62 && ( y - 17 <= felsoNegyzetY[i] || y + 17 >= alsoNegyzetY[i])) {
      gameOver=true;
    }
  }
}

void pontszamitas() {
  for (int i=0; i<10; i++) {
    if (elsoNegyzetX[i]<115&&pontozott[i]==false) {
      pontszam++;
      pontozott[i]=true;
    }
  }
}

void pontszamkiiras(int x, int y) {
  smooth();
  textAlign(CENTER);
  textSize (70);
  text(pontszam, x, y);
}



