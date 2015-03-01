
import ddf.minim.*;
Minim minim;

//Variables globals
AudioSample drop;
AudioSample splash;
AudioPlayer gurgle;

PImage ground;

PImage bridge;

PImage cos;
PImage dreta;
PImage esquerra;

PImage fish;
int[] fishx = {235, 360, 370, 640, 610, 760, 750, 750, 900, 900, 905, 825};
int[] fishy = {325, 265, 395, 200, 425, 390, 560, 50,  75,  450, 625, 220};
int sz = 75;
float r = 0;
int a = 255;


void setup() {
  size(1000, 700);
  frameRate(60);
  noCursor();

  //Carrega de sons i imatges
  minim = new Minim(this);
  drop = minim.loadSample("waterdrop.wav");
  splash = minim.loadSample("watersplash.wav");
  gurgle = minim.loadFile("gurgle.wav");
  gurgle.play();
  gurgle.loop();

  fish= loadImage("koi2.png");
  ground= loadImage("fons2.png");
  bridge= loadImage("bridge.png");
  cos= loadImage("cos.png");
  dreta= loadImage("dreta.png");
  esquerra= loadImage("esquerra.png");
}

void draw() {
  background(#8AC5CB);

  if (frameCount % 60 == 0) {
    //drop.trigger();
  }  

  tint(255, a);
  
  //Condicionls amb les funcions per dibuixar les carpes
    if (hour() == 0 || hour() == 12) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
    carpa(6);
    carpa(7);
    carpa(8);
    carpa(9);
    carpa(10);
    carpa(11);
  } else if (hour() == 23 || hour() == 11) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
    carpa(6);
    carpa(7);
    carpa(8);
    carpa(9);
    carpa(10);
  } else if (hour() == 22 || hour() == 10) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
    carpa(6);
    carpa(7);
    carpa(8);
    carpa(9);
  } else if (hour() == 21 || hour() == 9) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
    carpa(6);
    carpa(7);
    carpa(8);
  } else if (hour() == 20 || hour() == 8) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
    carpa(6);
    carpa(7);
  } else if (hour() == 19 || hour() == 7) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
    carpa(6);
  } else if (hour() == 18 || hour() == 6) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
    carpa(5);
  } else if (hour() == 17 || hour() == 5) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
    carpa(4);
  } else if (hour() == 16 || hour() == 4) {
    carpa(0);
    carpa(1);
    carpa(2);
    carpa(3);
  } else if (hour() == 15 || hour() == 3) {
    carpa(0);
    carpa(1);
    carpa(2);
  } else if (hour() == 14 || hour() == 2) {
    carpa(0);
    carpa(1);
  } else {
    carpa(0);
  }

  //Reapareixer carpes
  if (a<255 && frameCount > 180) {
    a++;
    tint (255, a);
  }

  tint(255, 255); 
  image(ground, 0, 0);
  
  image(bridge, 375, 60);
  
  tortuga();

}

void mousePressed() {
  splash.trigger();
  a = 0;
  frameCount = 0;
}

void tortuga() {
  float turtley = map(minute(),0,59, 625, 95);
  image(dreta, 415, turtley, 100,100);     
  image(esquerra,415, turtley, 100,100);
  image(cos, 415, turtley, 100, 100);
  
}

void carpa(int quina) {
  translate(fishx[quina], fishy[quina]);
  float r = map(second(), 0, 59, 0, TWO_PI);
  rotate(r*3);
  image(fish, 0, 0, sz, sz);
  resetMatrix();
  }

void stop() {
  drop.close();
  splash.stop();
  minim.stop();
  super.stop();
}


