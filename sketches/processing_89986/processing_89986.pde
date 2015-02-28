
int colonnes = 200;
int rangees = 200;
float largeurColonnes;
float hauteurRangees;
color[][] tableau2D;
int timeStamp;
int timeStampMots;
String[] tMots = {
  "FAST", "THINK", "RUSH", "CONFUSE", "JUMP", "RUN", "STOP", "END", "BLINK", "FLASH", "HOLD", "LOOK", "HELP", "SINK",
  "TRIP", "SLIT", "DARK", "BEHIND", "MIND", "THOUGHT", "OVERKILL", "EMPTY", "BLANK", "JOY", "COUNT", "POINT", "GIVE UP",
  "PROTECT"
}; //28

void setup() {
  size(400, 400);
  smooth();
  frameRate(30);

  timeStamp = millis();
  timeStampMots = millis();

  largeurColonnes = width/colonnes;
  hauteurRangees = height/rangees;
  tableau2D = new color[colonnes][rangees];

  for (int i = 0; i < colonnes; i++) {
    for (int j = 0; j < rangees; j++) {
      tableau2D[i][j] = color(/*random(0, 255), random(0, 255),*/ random(0, 150));
    }
  }
}

void draw() {
  background(127);

  noStroke();

  int tempsEcoule = millis() - timeStamp;
  int tempsEcouleMots = millis() - timeStampMots;

  for (int i = 0; i < colonnes; i++) {
    for (int j = 0; j < rangees; j++) {
      fill(tableau2D[i][j]);
      rect(i*largeurColonnes, j*hauteurRangees, largeurColonnes, hauteurRangees);
    }
  }

  if (tempsEcoule >= 50) {
    for (int i = 0; i < colonnes; i++) {
      for (int j = 0; j < rangees; j++) {
        tableau2D[i][j] = color(/*random(0, 255), random(0, 255),*/ random(0, 150));
      }
    }
    timeStamp = millis();
  }

  int tempsRand = int(random(50,4000));
  if (tempsEcouleMots >= tempsRand) {
    fill(255);
    textSize(50);
    int x = int(random(0, width-75));
    int y = int(random(30, height-30));
    int valR = int(random(0, 28));
    text(tMots[valR], x, y);
    timeStampMots = millis();
  }
}
