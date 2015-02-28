
/*-----------------------------------------------------------------------------
 TP4 - Le jeu interactif
 Par Joel Lalancette
 EDM4600
 -----------------------------------------------------------------------------*/
//Declaration des variables
static final int INTRODUCTION = 0;
static final int JEU = 1;
static final int FIN = 2;
static final int CONCLUSION = 3;
static final int ECHEC = 4;
int etat = INTRODUCTION;

PImage Poisson1;
PImage Sea;
PFont policeEchec;
float time = 1000;
float wave = 25;
int Echec = 0;
int pointage;
int GPoisson = 80;
boolean Hit = false;
int RandomX()
{
  return int(random(500));
}
int[] Poissonx = { 
  RandomX(), RandomX(), RandomX(), RandomX(), RandomX()
};
int[] Poissony = {  
  100, 100, 100, 100, 100
};
//========================================================================================================
void setup() {
  size(400, 400);
  smooth();
  frameRate(60);
  Poisson1 = loadImage("Poisson1.png");
  Sea = loadImage("Sea2.png");
  policeEchec = loadFont("Echec.vlw");
  textFont(policeEchec);
}
//========================================================================================================
void draw() {
  if ( etat == INTRODUCTION ) {
    introduction();
  } 
  else if ( etat == FIN) {
    fin();
  } 
  else {
    conclusion();
  }
  if ( etat == JEU) {
    background(Sea);
    noFill();
    noStroke();
    //Vagues inspiree d'un exemple provenant de "learning Processing"
    float xwave =0;
    rect(0, 0, 400, 400);
    while (xwave<width) {
      float k = wave*noise(xwave/200, time);
      noStroke();
      ellipse(xwave, 200+(k), 3, 3);
      strokeWeight(1);
      stroke(10, 0, 255, 60);
      line(xwave, 50+(k), xwave, height);
      stroke(10, 0, 255, 100);
      line(xwave, 60+(k), xwave, height);
      xwave++;
    }
    time = time+.02;
    //========================================================================================================
    //Afficheur de pointage
    fill(255);
    noStroke ();
    fill(255);
    textSize(25);
    text(pointage, 350, 35);
    if (Hit) {
      Coup(mouseX, mouseY);
      Hit = false;
    }
    EchecHit();
    for (int i=0; i< 5; i++) {
      if (Poissonx[i]==400) {
        fill(100);
        fill(255, 0, 0);
        textSize(30);
        textAlign(CENTER);
        text("Echec", width/2, height/2);
        text("pointage : "+ pointage, width/2, height/2+45);  
        noLoop();
      }
    }
  }
}
//========================================================================================================
void mousePressed() {
  Hit = true;
  if ( etat == INTRODUCTION &&( mouseX>150 && mouseX<250 && mouseY>200 && mouseY<300 ) ) {
    etat = JEU;
  } 
  else if ( etat == JEU) {
  } 
  else if ( etat == FIN) {
    pointage = 0;
    etat = INTRODUCTION;
  }
  else if (etat == ECHEC) {
    pointage = 0;
    etat = INTRODUCTION;
  }
  else {
    etat = INTRODUCTION;
  }
}
void EchecHit() { 

  noStroke();
  noFill();
  for (int i=0; i<5; i++) {
    image(Poisson1, Poissonx[i]++, Poissony[i], GPoisson, GPoisson);
  }
}
//inspire de "exemple: autoroute".
void Coup(int CoupX, int CoupY) {
  boolean Succes = false;
  for (int i=0; i < 5; i++) {
    if ((CoupX >= (Poissonx[i]-60)) && (CoupX <= (Poissonx[i]+60)) && (CoupY >= (Poissony[i]-60)) && (CoupY <= (Poissony[i]+60))){
      Succes = true;
      Poissonx[i] = -110;
      Poissony[i] = RandomX();
      pointage++;
      if (pointage >= 20) {
        fin();
      }
    }
  }
} 
void introduction() {
  background(Sea);
  image(Poisson1, 85, 150);
  textAlign(CENTER, CENTER);
  textSize(18);
  fill(0, 0, 250, 150);
  text("Clickez sur le poisson pour jouer", 200, 120);
}
void fin() {
  if (pointage == 20) {
    etat = FIN;
    textAlign(CENTER, CENTER);
    textSize(48);
    fill(255);
    text("Felicitation!", 200, 150);
    textSize(13);
    fill(150, 0, 0);
    text("Vous avez exterminés 0,000000000001%", 200, 240);
    text("de la population aquatique mondiale!", 200, 260);
    fill(0, 5);
    rect(0, 0, width, height);
    fill(200, 0, 0);
    text("Cliquez pour recommencer", 200, 350);
  }
}
void conclusion() {
  background(0);
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(255);
  text("Conclusion", width/2, height/2);
}


//========================================================================================================


