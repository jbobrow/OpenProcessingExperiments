
import ddf.minim.*;
AudioPlayer sound1;
AudioPlayer sound2;
AudioPlayer sound3;
AudioPlayer sound4;
AudioPlayer sound5;
AudioPlayer sound6;
Minim minim;

float posizioneXCupcake;
float posizioneYCupcake;
float PosizioneYGuanto;

int start;
int avanti;
int caduto;
int preso;

PImage X; // variabile d'appoggio che uso per cambiare cupcake ad ogni livello

PFont font;
PFont font1;

PImage img1; // guanto
PImage img2; // cupcake azzurro
PImage img3; // cupcake farfalla
PImage img4; // cupcake rosa
PImage img5; // cupcake zucca
PImage img6; // macchia azzurra
PImage img7; // logo
PImage img8; // sfondo rosso
PImage img9; // sfondo giallo
PImage img10; // nastro azzurro
PImage img11; // cupcake con fiore di cioccolato
PImage img12; // sfondo ocra

int Z=55;
int Y=55;
int livello=1;

void setup() {

  size(800, 400);

  start=1;
  avanti=1;
  PosizioneYGuanto=350;
  caduto=0;
  preso=0;


  font = loadFont("LucidaSans-Demi-15.vlw");

  font1=loadFont("LucidaSans-Demi-30.vlw");


  img1=loadImage("guanto.png");
  img2=loadImage("cupcake1.png");
  X=img2;
  img3=loadImage("cupcake2.png");
  img4=loadImage("cupcake3.png");
  img5=loadImage("cupcake4.png");
  img6=loadImage("macchia1.png");
  img7=loadImage("logo giochino.png");
  img8=loadImage("sfondo.png");
  img9=loadImage("macchia2.png");
  img10=loadImage("nastro.png");
  img11=loadImage("cupcake5.png");
  img12=loadImage("sfondo1.png");



  minim = new Minim(this);
  sound1 = minim.loadFile("Slime Splash.wav"); // quando il cupcake cade a terra fa questo suono
  sound2=minim.loadFile("Ovation.wav"); // quando si supera un livello
  sound3=minim.loadFile("Ovation.wav");
  sound4=minim.loadFile("Ovation.wav");
  sound5=minim.loadFile("Ovation.wav");
  sound6=minim.loadFile("punch.wav"); // quando si prende un cupcake col guanto fa questo suono
}


void draw() {

  background(img8);
  image(img9, 70, 30, 300, 170);
  image(img10, 1, 150, 300, 80);
  textFont(font, 15);
  text("Cupcake presi:", 5, 30);
  text("Cupcake caduti:", 5, 60);
  text(preso, 135, 30);
  text(caduto, 135, 60);
  fill(255);

  textFont(font1, 20);
  text("Livello:", 10, 163);
  text(livello, 100, 163);
  fill(255);

  image(img7, 650, 60);


  imageMode(CENTER);
  image(img1, 0+mouseX, PosizioneYGuanto, 80, 80);

  if (start==1)
  {
    posizioneXCupcake=random(width);
    posizioneYCupcake=0;

    image(X, posizioneXCupcake, posizioneYCupcake, Z, Y);
    start=0;
  }
  else
  {
    if (avanti==1)
    {
      posizioneYCupcake=posizioneYCupcake+5;
      image(X, posizioneXCupcake, posizioneYCupcake, Z, Y);
      frameRate(70);
      sound6.play(preso); // si attiva quando si prende un cupcake col guanto
      if (mouseX-40<posizioneXCupcake && mouseX+40>posizioneXCupcake && PosizioneYGuanto-30<posizioneYCupcake && PosizioneYGuanto+30>posizioneYCupcake)
      {
        avanti=0;

        preso=preso+1;
        println("cupcake presi: ");
        println(preso);
      }
      else
      {
        if (posizioneYCupcake==PosizioneYGuanto+20) {
          image(img6, posizioneXCupcake, posizioneYCupcake, 90, 90);

          sound1.play(caduto); // si attiva quando si lascia cadere un cupcake
          caduto=caduto+1;
          println("cupcake caduti: ");
          println(caduto);
          start=1;
        }
      }
    }

    else {//indietro



      posizioneYCupcake=posizioneYCupcake-15;
      image(X, posizioneXCupcake, posizioneYCupcake, Z, Y);


      if (posizioneYCupcake<0) {

        start=1;
        avanti=1;
      }
    }
  }


  if (preso>=10 && preso<20) { // dopo un tot di cupcake presi, vai avanti di livello

    X=img3; // cambia il cupcake di livello
    Z=80;
    Y=80;
    sound2.play(); // si attiva quando si supera un livello
    frameRate(80);
    livello=2;
  }

  if (preso>=20 && preso<30) {

    X=img4;
    Z=60;
    Y=70;
    sound3.play();
    frameRate(90);
    livello=3;
  }

  if (preso>=30 && preso<40) {
    X=img5;
    Z=60;
    Y=70;
    sound4.play();
    frameRate(100);
    livello=4;
  }

  if (preso>=40) {
    X=img11;
    Z=60;
    Y=70;
    sound5.play();
    frameRate(120);
    livello=5;
  }
}



